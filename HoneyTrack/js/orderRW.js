/// Función para mostrar el toast
function showToast(message, type) {
    const toastContainer = document.createElement('div');
    toastContainer.classList.add('toast', 'fade', 'show');
    toastContainer.style.position = 'absolute';
    toastContainer.style.top = '20px';
    toastContainer.style.left = '50%';
    toastContainer.style.transform = 'translateX(-50%)'; 
    toastContainer.style.zIndex = '1050';

    // Establecer el color basado en el tipo de mensaje (success o error)
    if (type === 'success') {
        toastContainer.classList.add('bg-success');
    } else {
        toastContainer.classList.add('bg-danger');
    }

    // Crear el contenido del toast
    toastContainer.innerHTML = `
        <div class="toast-body">
            <strong>${type === 'success' ? 'Success: ' : 'Error: '}</strong> ${message}
        </div>
    `;

    // Añadir el toast al cuerpo del documento
    document.body.appendChild(toastContainer);

    // Eliminar el toast después de 2 segundos
    setTimeout(() => {
        toastContainer.classList.remove('show');
        setTimeout(() => {
            toastContainer.remove();
        }, 500); // Tiempo para desaparecer
    }, 2000); // Tiempo que permanece visible
}

// Validar que se haya seleccionado una opción válida
document.getElementById('addOrderRMForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevenir el envío normal del formulario

    const selectElement = document.getElementById('code');
    const selectedValue = selectElement.value;

    // Verificar que el valor seleccionado no sea la opción predeterminada
    if (selectedValue === "" || selectedValue === "default") {
        showToast("Please select a valid Raw Material Code", "error"); // Mostrar mensaje de error
        return; // Evitar el envío del formulario
    }

    const formData = new FormData(this);

fetch('../php/insertOrderRM.php', {
    method: 'POST',
    body: formData
})
.then(response => {
    if (!response.ok) {
        throw new Error("Network response was not ok");
    }
    return response.json();
})
.then(data => {
    const message = data.msg;
    const type = (data.status === 'success') ? 'success' : 'error';
    showToast(message, type);

    if (type === 'success') {
        setTimeout(() => {
            window.location.reload();
        }, 2000);
    }
})
.catch(error => {
    console.error('Error:', error);
    showToast("Unexpected error occurred", "error");
});

});

