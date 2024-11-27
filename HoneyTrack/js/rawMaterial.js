// Espera a que el DOM esté completamente cargado
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("#format1 form");
    const inputs = form.querySelectorAll("input[required]");
    const submitButton = form.querySelector(".submit-button");

    // Desactiva el botón de submit inicialmente
    submitButton.disabled = true;

    // Función para verificar si todos los campos están llenos
    function checkInputs() {
        let allFilled = true;

        // Itera sobre los inputs y verifica que no estén vacíos
        inputs.forEach((input) => {
            if (input.value.trim() === "") {
                allFilled = false;
            }
        });

        // Habilita o deshabilita el botón dependiendo del estado
        submitButton.disabled = !allFilled;
    }

    // Agrega un evento de entrada a cada input para validar mientras el usuario escribe
    inputs.forEach((input) => {
        input.addEventListener("input", checkInputs);
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

document.getElementById('addUsers').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevenir el envío normal del formulario

    const formData = new FormData(this);

    fetch('../php/insertRawMaterial.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        const message = data.msg;  // El mensaje enviado desde PHP
        const type = (data.status === 'success') ? 'success' : 'error';  // Lógica para el tipo de mensaje

        // Llamar a la función para mostrar el toast
        showToast(message, type);

        // Recargar la página si es un éxito
        if (type === 'success') {
            setTimeout(() => {
                window.location.reload();
            }, 2000);
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
