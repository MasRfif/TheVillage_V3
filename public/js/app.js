document.addEventListener('DOMContentLoaded', function () {
  // Ikon Lucide (pengganti lucide-react)
  if (window.lucide) lucide.createIcons();

  // Toast hilang otomatis
  document.querySelectorAll('.toast').forEach(function (t) {
    setTimeout(function () { t.remove(); }, 3500);
  });

  // Toggle menu (dropdown profil & menu mobile)
  document.querySelectorAll('[data-toggle]').forEach(function (btn) {
    btn.addEventListener('click', function (e) {
      e.stopPropagation();
      var el = document.querySelector(btn.dataset.toggle);
      if (el) el.classList.toggle('hidden');
    });
  });
  document.addEventListener('click', function () {
    document.querySelectorAll('[data-closeable]').forEach(function (el) { el.classList.add('hidden'); });
  });

  // Accordion FAQ
  document.querySelectorAll('.faq-q').forEach(function (q) {
    q.addEventListener('click', function () { q.parentElement.classList.toggle('open'); });
  });

  // Tombol geser carousel
  document.querySelectorAll('[data-scroll]').forEach(function (b) {
    b.addEventListener('click', function () {
      var t = document.querySelector(b.dataset.target);
      if (t) t.scrollBy({ left: parseInt(b.dataset.scroll, 10), behavior: 'smooth' });
    });
  });
});
