document.querySelectorAll('.copy-btn').forEach(
  /** @param {HTMLButtonElement} */ e =>
    e.addEventListener('click', () => {
      const tagValue = tagText.value;
      copyToClipboard(tagValue);
    })
);

const tooltipTriggerList = [].slice.call(
  document.querySelectorAll('[data-bs-toggle="tooltip"]')
);
const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl);
});
