function back(){
    window.location.href = "../html/products.php"
}

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

fetch('../php/insertRawProduct.php', {
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

document.getElementById('add-field-button').addEventListener('click', async function () {
        const container = document.getElementById('fields-container');
        const newFieldSet = document.createElement('div');
        newFieldSet.classList.add('personalData');

            // Petición para obtener los códigos de la base de datos
    const response = await fetch('../php/getRawCodes.php');
    const rawCodes = await response.json();

    // Generar opciones para el select
    let options = '<option value="default" disabled selected>Raw Material Code</option>';
    rawCodes.forEach(code => {
        options += `<option value="${code.code}">${code.code} - ${code.name}</option>`;
    });
        newFieldSet.innerHTML = `
            <select name="raw[]" required style="
                width: 100%;
                padding: 10px;
                font-size: 16px;
                height: 40px;
                border: 2px solid #ccc;
                border-radius: 5px;
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
                box-sizing: border-box;
                background: transparent;">
                ${options}
            </select>
            <div class="input-container">
                <input type="number" min="1" max="999" name="quantity[]" placeholder="Quantity" autocomplete="off" required>
            </div>
        `;
        container.appendChild(newFieldSet);
    });