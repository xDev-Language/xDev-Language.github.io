'use strict';

(() => {
  const version = document.querySelector('meta[name="doc-version"]')?.content;
  if (!version) return;
  setInterval(async () => {
    if (document.hidden) return;
    try {
      const response = await fetch(document.body.dataset.base + '__version', { cache: 'no-store' });
      if (response.ok && await response.text() !== version) location.reload();
    } catch {}
  }, 1200);
})();
