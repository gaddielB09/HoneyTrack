// loading.js
function setupLoadingScreen() {
    const navLinks = document.querySelectorAll('a');

    navLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            const href = this.getAttribute('href');
            if (href && href.endsWith('.html')) {
                event.preventDefault();
                document.getElementById('loadingScreen').style.display = 'flex'; // Muestra la pantalla de carga
                setTimeout(function() {
                    window.location.href = href; // Redirige a la URL después de 1 segundo
                }, 500); // 1000 ms = 1 segundo
            }
        });
    });
}

window.addEventListener('load', setupLoadingScreen);