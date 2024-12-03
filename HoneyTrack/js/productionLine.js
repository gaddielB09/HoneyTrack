document.addEventListener('DOMContentLoaded', function() {
    // Obtener los botones y formularios
    const editButtons = document.querySelectorAll('.btn-edit');
    const editUserForm = document.getElementById('editUserForm');
    const format2 = document.getElementById('format2');

    // Añadir el evento de clic a cada botón de edición
    editButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Ocultar el formato actual (format2)
            format2.style.display = 'none';

            // Mostrar el formulario de edición
            editUserForm.style.display = 'block';
        });
    });

});

    // Volver al formulario de búsqueda
    function backToSearch() {
        editUserForm.style.display = 'none';
        format2.style.display = 'block';
    }
