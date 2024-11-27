document.getElementById('addOrderRMForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Evita el envío normal del formulario

    const formData = new FormData(this); // Captura los datos del formulario

    fetch('../php/insertOrderRM.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        const message = data.msg || 'No message from server';
        const type = data.status === 'success' ? 'success' : 'error';

        // Muestra el mensaje con un toast
        showToast(message, type);

        // Si es exitoso, recarga la página tras 2 segundos
        if (type === 'success') {
            setTimeout(() => {
                window.location.reload();
            }, 2000);
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showToast('An unexpected error occurred.', 'error');
    });
});

// Función para mostrar el toast
function showToast(message, type) {
    const toastContainer = document.createElement('div');
    toastContainer.classList.add('toast', 'fade', 'show');
    toastContainer.style.position = 'absolute';
    toastContainer.style.top = '20px';
    toastContainer.style.left = '50%';
    toastContainer.style.transform = 'translateX(-50%)'; 
    toastContainer.style.zIndex = '1050';

    // Estilo según el tipo de mensaje
    if (type === 'success') {
        toastContainer.classList.add('bg-success', 'text-white');
    } else {
        toastContainer.classList.add('bg-danger', 'text-white');
    }

    // Contenido del toast
    toastContainer.innerHTML = `
        <div class="toast-body">
            <strong>${type === 'success' ? 'Success: ' : 'Error: '}</strong> ${message}
        </div>
    `;

    document.body.appendChild(toastContainer); // Añade el toast al DOM

    // Oculta el toast después de 2 segundos
    setTimeout(() => {
        toastContainer.classList.remove('show');
        setTimeout(() => {
            toastContainer.remove();
        }, 500);
    }, 2000);
}
