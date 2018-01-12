export const { REACT_APP_BASE_URL:base = '' } = process.env;

export const loadCss = (url, cssId) => {
  if (!document.getElementById(cssId)) {
    const link = document.createElement('link');
    link.id = cssId;
    link.rel = 'stylesheet';
    link.href = url;
    document.head.appendChild(link);
  }
}
