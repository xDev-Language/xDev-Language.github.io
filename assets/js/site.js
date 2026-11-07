'use strict';

(() => {
  const root = document.documentElement;
  let savedTheme;
  try { savedTheme = localStorage.getItem('xdev-theme'); } catch {}
  root.dataset.theme = savedTheme || (matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
  document.querySelector('.theme-toggle').addEventListener('click', () => {
    root.dataset.theme = root.dataset.theme === 'dark' ? 'light' : 'dark';
    try { localStorage.setItem('xdev-theme', root.dataset.theme); } catch {}
  });

  const menuButton = document.querySelector('.menu-button');
  const sidebar = document.querySelector('.sidebar');
  const backdrop = document.querySelector('.menu-backdrop');
  function setMenu(open) {
    sidebar.classList.toggle('open', open);
    document.body.classList.toggle('menu-open', open);
    backdrop.hidden = !open;
    menuButton.setAttribute('aria-expanded', String(open));
    if (open) sidebar.querySelector('.close-menu').focus();
  }
  menuButton.addEventListener('click', () => setMenu(!sidebar.classList.contains('open')));
  document.querySelector('.close-menu').addEventListener('click', () => { setMenu(false); menuButton.focus(); });
  backdrop.addEventListener('click', () => setMenu(false));
  document.addEventListener('keydown', event => {
    if (!sidebar.classList.contains('open')) return;
    if (event.key === 'Escape') { setMenu(false); menuButton.focus(); }
    if (event.key === 'Tab') {
      const elements = [...sidebar.querySelectorAll('button, a[href]')];
      const first = elements[0]; const last = elements.at(-1);
      if (event.shiftKey && document.activeElement === first) { event.preventDefault(); last.focus(); }
      if (!event.shiftKey && document.activeElement === last) { event.preventDefault(); first.focus(); }
    }
  });

  let toastTimer;
  function toast(message) {
    const element = document.querySelector('.toast');
    element.textContent = message;
    element.classList.add('visible');
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => element.classList.remove('visible'), 2400);
  }
  document.querySelectorAll('[data-copy]').forEach(button => button.addEventListener('click', async () => {
    const code = document.getElementById(button.dataset.copy);
    try {
      await navigator.clipboard.writeText(code.textContent);
      toast('Code copied to clipboard');
    } catch {
      const selection = getSelection(); const range = document.createRange();
      range.selectNodeContents(code); selection.removeAllRanges(); selection.addRange(range);
      toast('Code selected. Press Ctrl+C to copy.');
    }
  }));

  const dialog = document.querySelector('.search-dialog');
  const input = document.getElementById('doc-search');
  const category = document.getElementById('search-category');
  const results = document.querySelector('.search-results');
  const status = document.querySelector('.search-status');
  const base = document.body.dataset.base;
  let catalog; let loading; let selected = -1; let links = [];
  async function load() {
    if (catalog) return;
    loading ??= fetch(base + 'assets/data/catalog.json').then(response => {
      if (!response.ok) throw new Error('Catalog unavailable');
      return response.json();
    }).then(value => { catalog = value; }).catch(error => { loading = undefined; throw error; });
    await loading;
  }
  function select(index) {
    if (!links.length) return;
    links.forEach(link => link.removeAttribute('data-selected'));
    selected = (index + links.length) % links.length;
    links[selected].setAttribute('data-selected', '');
    links[selected].scrollIntoView({ block: 'nearest' });
  }
  async function search() {
    status.textContent = 'Loading reference…';
    try { await load(); } catch {
      results.replaceChildren();
      links = []; selected = -1;
      status.textContent = 'The search index could not be loaded. Close and reopen search to retry.';
      return;
    }
    const query = input.value.trim().toLowerCase();
    const words = query.split(/\s+/).filter(Boolean);
    const matching = catalog.documents.filter(doc => (!category.value || doc.category === category.value)
      && words.every(word => `${doc.name} ${doc.summary}`.toLowerCase().includes(word)))
      .sort((a, b) => Number(b.name.toLowerCase().startsWith(query)) - Number(a.name.toLowerCase().startsWith(query)));
    results.replaceChildren(); selected = -1; links = [];
    const visible = matching.slice(0, 60);
    status.textContent = matching.length ? (matching.length > 60 ? 'Type to narrow your search.' : '') : 'No entries found. Try another name or category.';
    for (const doc of visible) {
      const link = document.createElement('a'); link.className = 'search-result'; link.href = base + doc.url;
      const heading = document.createElement('div'); const label = document.createElement('span');
      heading.append(document.createTextNode(doc.name));
      label.textContent = catalog.categories.find(c => c.id === doc.category).name;
      heading.append(label); const description = document.createElement('p'); description.textContent = doc.summary;
      link.append(heading, description); results.append(link); links.push(link);
    }
  }
  function openSearch() {
    setMenu(false);
    if (!dialog.open) dialog.showModal();
    input.focus(); search();
  }
  document.querySelector('.search-trigger').addEventListener('click', openSearch);
  document.querySelector('.close-search').addEventListener('click', () => dialog.close());
  dialog.addEventListener('click', event => { if (event.target === dialog) {
    const box = dialog.getBoundingClientRect();
    if (event.clientX < box.left || event.clientX > box.right || event.clientY < box.top || event.clientY > box.bottom) dialog.close();
  } });
  input.addEventListener('input', search); category.addEventListener('change', search);
  dialog.addEventListener('keydown', event => {
    if (document.activeElement !== input && !links.includes(document.activeElement)) return;
    if (event.key === 'ArrowDown') { event.preventDefault(); select(selected + 1); }
    if (event.key === 'ArrowUp') { event.preventDefault(); select(selected < 0 ? links.length - 1 : selected - 1); }
    if (event.key === 'Enter' && document.activeElement === input && links.length) {
      event.preventDefault(); links[Math.max(0, selected)].click();
    }
  });
  document.addEventListener('keydown', event => {
    if ((event.ctrlKey || event.metaKey) && event.key.toLowerCase() === 'k') { event.preventDefault(); openSearch(); }
    if (event.key === '/' && !dialog.open && !/INPUT|TEXTAREA|SELECT/.test(document.activeElement.tagName) && !document.activeElement.isContentEditable) {
      event.preventDefault(); openSearch();
    }
  });

})();
