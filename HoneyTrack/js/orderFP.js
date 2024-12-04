document.getElementById("addFPForm").addEventListener("submit", function (e) {
    e.preventDefault(); // Evita el envío normal del formulario

    const formData = new FormData(this);

    fetch("../php/insertOrderFP.php", {
        method: "POST",
        body: formData,
    })
        .then((response) => response.json())
        .then((data) => {
            // Mostrar mensaje en el toast
            showToast(data.msg, data.status === "success" ? "success" : "error");
        })
        .catch((error) => {
            // Manejar errores inesperados
            showToast("An unexpected error occurred.", "error");
        });
});


/// Función para mostrar el toast
function showToast(message, type) {
    const toastContainer = document.createElement('div');
    toastContainer.classList.add('toast', 'fade', 'show');
    toastContainer.style.position = 'absolute';
    toastContainer.style.top = '20px';
    toastContainer.style.left = '50%';
    toastContainer.style.transform = 'translateX(-50%)'; 
    toastContainer.style.zIndex = '1050';
    toastContainer.style.color = '#ffffff'

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
            window.location.reload();
        }, 500); // Tiempo para desaparecer
    }, 2000); // Tiempo que permanece visible
}

