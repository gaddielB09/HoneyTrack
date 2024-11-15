// Selección de elementos
const sidebar = document.querySelector('.sidebar');
const toggleButton = document.getElementById('btn');

// Evento para abrir/cerrar en móvil
toggleButton.addEventListener('click', () => {
    sidebar.classList.toggle('active');
});

// Solo muestra el sidebar completo en escritorio al pasar el mouse
if (window.innerWidth >= 768) {
    sidebar.addEventListener('mouseenter', () => {
        sidebar.classList.add('hover');
    });
    
    sidebar.addEventListener('mouseleave', () => {
        sidebar.classList.remove('hover');
    });
}



