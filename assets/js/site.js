'use strict';

(() => {
  const TOAST_DURATION_MS = 2400;
  const MAX_VISIBLE_RESULTS = 60;

  const root = document.documentElement;
  const body = document.body;
  const base = body.dataset.base;

  function initTheme() {
    const prefersDark = matchMedia('(prefers-color-scheme: dark)').matches;
    root.dataset.theme = prefersDark ? 'dark' : 'light';
    try {
      root.dataset.theme = localStorage.getItem('xdev-theme') || root.dataset.theme;
    } catch {
      // Storage can be disabled in private browsing.
    }

    document.querySelector('.theme-toggle').addEventListener('click', () => {
      root.dataset.theme = root.dataset.theme === 'dark' ? 'light' : 'dark';
      try {
        localStorage.setItem('xdev-theme', root.dataset.theme);
      } catch {
        // Keep the selected theme for this page.
      }
    });
  }

  const menu = {
    button: document.querySelector('.menu-button'),
    sidebar: document.querySelector('.sidebar'),
    backdrop: document.querySelector('.menu-backdrop'),
    closeButton: document.querySelector('.close-menu'),
  };

  function isMenuOpen() {
    return menu.sidebar.classList.contains('open');
  }

  function setMenu(open) {
    menu.sidebar.classList.toggle('open', open);
    body.classList.toggle('menu-open', open);
    menu.backdrop.hidden = !open;
    menu.button.setAttribute('aria-expanded', String(open));

    if (open) {
      menu.closeButton.focus();
    }
  }

  function closeMenuAndRestoreFocus() {
    setMenu(false);
    menu.button.focus();
  }

  function initMenu() {
    menu.button.addEventListener('click', () => setMenu(!isMenuOpen()));
    menu.closeButton.addEventListener('click', closeMenuAndRestoreFocus);
    menu.backdrop.addEventListener('click', () => setMenu(false));

    document.addEventListener('keydown', (event) => {
      if (!isMenuOpen()) {
        return;
      }

      if (event.key === 'Escape') {
        closeMenuAndRestoreFocus();
        return;
      }

      if (event.key !== 'Tab') {
        return;
      }

      // Keep keyboard focus inside the open menu.
      const focusable = [...menu.sidebar.querySelectorAll('button, a[href]')];
      const first = focusable[0];
      const last = focusable.at(-1);

      if (event.shiftKey && document.activeElement === first) {
        event.preventDefault();
        last.focus();
      }

      if (!event.shiftKey && document.activeElement === last) {
        event.preventDefault();
        first.focus();
      }
    });
  }

  function initCopyButtons() {
    const toastElement = document.querySelector('.toast');
    let toastTimer;

    function showToast(message) {
      toastElement.textContent = message;
      toastElement.classList.add('visible');

      clearTimeout(toastTimer);
      toastTimer = setTimeout(() => {
        toastElement.classList.remove('visible');
      }, TOAST_DURATION_MS);
    }

    function selectContents(element) {
      const range = document.createRange();
      range.selectNodeContents(element);

      const selection = getSelection();
      selection.removeAllRanges();
      selection.addRange(range);
    }

    document.querySelectorAll('[data-copy]').forEach((button) => {
      button.addEventListener('click', async () => {
        const code = document.getElementById(button.dataset.copy);

        try {
          await navigator.clipboard.writeText(code.textContent);
          showToast('Code copied to clipboard');
        } catch {
          selectContents(code);
          showToast('Code selected. Press Ctrl+C to copy.');
        }
      });
    });
  }

  function initSearch() {
    const dialog = document.querySelector('.search-dialog');
    const input = document.getElementById('doc-search');
    const category = document.getElementById('search-category');
    const results = document.querySelector('.search-results');
    const status = document.querySelector('.search-status');

    let catalog;
    let loadingPromise;
    let links = [];
    let selected = -1;

    async function loadCatalog() {
      if (catalog) {
        return;
      }

      loadingPromise ??= fetch(base + 'assets/data/catalog.json')
        .then((response) => {
          if (!response.ok) {
            throw new Error('Catalog unavailable');
          }
          return response.json();
        })
        .then((value) => {
          catalog = value;
        })
        .catch((error) => {
          loadingPromise = undefined;
          throw error;
        });

      await loadingPromise;
    }

    function resetSelection() {
      selected = -1;
      links = [];
    }

    function select(index) {
      if (!links.length) {
        return;
      }

      links.forEach((link) => link.removeAttribute('data-selected'));

      selected = (index + links.length) % links.length;
      links[selected].setAttribute('data-selected', '');
      links[selected].scrollIntoView({ block: 'nearest' });
    }

    function categoryName(categoryId) {
      return catalog.categories.find((c) => c.id === categoryId).name;
    }

    function matchesQuery(doc, words) {
      if (category.value && doc.category !== category.value) {
        return false;
      }

      const haystack = `${doc.name} ${doc.summary}`.toLowerCase();
      return words.every((word) => haystack.includes(word));
    }

    function sortByPrefixMatch(docs, query) {
      const startsWithQuery = (doc) => doc.name.toLowerCase().startsWith(query);

      return docs.sort(
        (a, b) => Number(startsWithQuery(b)) - Number(startsWithQuery(a)),
      );
    }

    function buildResultLink(doc) {
      const link = document.createElement('a');
      link.className = 'search-result';
      link.href = base + doc.url;

      const heading = document.createElement('div');
      const label = document.createElement('span');
      label.textContent = categoryName(doc.category);

      heading.append(document.createTextNode(doc.name));
      heading.append(label);

      const description = document.createElement('p');
      description.textContent = doc.summary;

      link.append(heading, description);
      return link;
    }

    function updateStatus(totalMatches) {
      if (totalMatches === 0) {
        status.textContent = 'No entries found. Try another name or category.';
      } else if (totalMatches > MAX_VISIBLE_RESULTS) {
        status.textContent = 'Type to narrow your search.';
      } else {
        status.textContent = '';
      }
    }

    function renderResults(docs, totalMatches) {
      results.replaceChildren();
      resetSelection();
      updateStatus(totalMatches);

      const visible = docs.slice(0, MAX_VISIBLE_RESULTS);

      for (const doc of visible) {
        const link = buildResultLink(doc);
        results.append(link);
        links.push(link);
      }
    }

    async function runSearch() {
      status.textContent = 'Loading reference…';

      try {
        await loadCatalog();
      } catch {
        results.replaceChildren();
        resetSelection();
        status.textContent =
          'The search index could not be loaded. Close and reopen search to retry.';
        return;
      }

      const query = input.value.trim().toLowerCase();
      const words = query.split(/\s+/).filter(Boolean);

      const matching = catalog.documents.filter((doc) => matchesQuery(doc, words));

      renderResults(sortByPrefixMatch(matching, query), matching.length);
    }

    function openSearch() {
      setMenu(false);

      if (!dialog.open) {
        dialog.showModal();
      }

      input.focus();
      runSearch();
    }

    function isClickOutsideDialog(event) {
      if (event.target !== dialog) {
        return false;
      }

      const box = dialog.getBoundingClientRect();
      return (
        event.clientX < box.left ||
        event.clientX > box.right ||
        event.clientY < box.top ||
        event.clientY > box.bottom
      );
    }

    function isTypingTarget(element) {
      if (/INPUT|TEXTAREA|SELECT/.test(element.tagName)) {
        return true;
      }
      return element.isContentEditable;
    }

    document.querySelector('.search-trigger').addEventListener('click', openSearch);
    document.querySelector('.close-search').addEventListener('click', () => {
      dialog.close();
    });

    dialog.addEventListener('click', (event) => {
      if (isClickOutsideDialog(event)) {
        dialog.close();
      }
    });

    input.addEventListener('input', runSearch);
    category.addEventListener('change', runSearch);

    dialog.addEventListener('keydown', (event) => {
      const focusIsInside =
        document.activeElement === input || links.includes(document.activeElement);

      if (!focusIsInside) {
        return;
      }

      if (event.key === 'ArrowDown') {
        event.preventDefault();
        select(selected + 1);
        return;
      }

      if (event.key === 'ArrowUp') {
        event.preventDefault();
        select(selected < 0 ? links.length - 1 : selected - 1);
        return;
      }

      if (event.key === 'Enter' && document.activeElement === input && links.length > 0) {
        event.preventDefault();
        links[Math.max(0, selected)].click();
      }
    });

    // The slash shortcut must not interrupt typing.
    document.addEventListener('keydown', (event) => {
      const isSearchShortcut =
        (event.ctrlKey || event.metaKey) && event.key.toLowerCase() === 'k';

      if (isSearchShortcut) {
        event.preventDefault();
        openSearch();
        return;
      }

      if (event.key === '/' && !dialog.open && !isTypingTarget(document.activeElement)) {
        event.preventDefault();
        openSearch();
      }
    });
  }

  initTheme();
  initMenu();
  initCopyButtons();
  initSearch();
})();
