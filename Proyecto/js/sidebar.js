document.addEventListener('DOMContentLoaded', function() {
    const btn = document.getElementById('btn');
    const sidebar = document.querySelector('.sidebar');

    btn.addEventListener('click', function() {
        sidebar.classList.toggle('active');
        const isActive = sidebar.classList.contains('active');
        btn.setAttribute('aria-expanded', isActive); // Mejora de accesibilidad
    });
});
