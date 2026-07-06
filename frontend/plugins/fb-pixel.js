export default function () {
  window.fbq = window.fbq || function () {
    (window.fbq.callMethod ? window.fbq.callMethod.apply(window.fbq, arguments) : window.fbq.queue.push(arguments));
  };
  if (!window._fbq) window._fbq = window.fbq;
  window.fbq.push = window.fbq;
  window.fbq.loaded = true;
  window.fbq.version = "2.0";
  window.fbq.queue = [];
  window.fbq("init", "25426138810416648");
  window.fbq("track", "PageView");
}
