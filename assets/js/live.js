'use strict';

(() => {
  const POLL_INTERVAL_MS = 1200;

  const versionMeta = document.querySelector('meta[name="doc-version"]');
  const version = versionMeta?.content;

  if (!version) {
    return;
  }

  const versionUrl = document.body.dataset.base + '__version';

  async function checkForUpdate() {
    if (document.hidden) {
      return;
    }

    try {
      const response = await fetch(versionUrl, { cache: 'no-store' });

      if (!response.ok) {
        return;
      }

      const latest = await response.text();

      if (latest !== version) {
        location.reload();
      }
    } catch {
      // The local server may be restarting.
    }
  }

  setInterval(checkForUpdate, POLL_INTERVAL_MS);
})();
