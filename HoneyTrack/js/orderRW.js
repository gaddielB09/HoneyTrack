// Mostrar un formulario específico al cargar la página
document.addEventListener('DOMContentLoaded', () => {
    showFormat('format1'); // Cambia 'format1' al ID del formato que quieras mostrar por defecto
});

function showFormat(formatId) {
    // Ocultar todos los formatos
    const formats = document.querySelectorAll('.format');
    formats.forEach(format => {
        format.style.display = 'none';
    });

    // Mostrar el formato correspondiente
    const selectedFormat = document.getElementById(formatId);
    if (selectedFormat) {
        selectedFormat.style.display = 'block';
    }
}

// Añade event listeners a los botones para asegurar funcionalidad
document.querySelectorAll('.userOption button').forEach((button, index) => {
    button.addEventListener('click', () => {
        const formatId = `format${index + 1}`; // Asumiendo IDs format1, format2, format3
        showFormat(formatId);
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

document.getElementById('add-field-button').addEventListener('click', async function () {
    const container = document.getElementById('fields-container');

    // Crear el nuevo conjunto de campos
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

    // Contenido del nuevo conjunto de campos
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
            <input type="number" min="1" max="999" name="quantity[]" class="onlyNumbers" placeholder="Quantity" autocomplete="off" required>
            <span class="error">Only Numbers are Allowed</span>
        </div>
    `;

    container.appendChild(newFieldSet);
});

document.getElementById('addOrderRMForm').addEventListener('submit', function (e) {
    const selects = document.querySelectorAll('select[name="raw[]"]');
    const quantities = document.querySelectorAll('input[name="quantity[]"]');
    const selectedCodes = new Set();
    let valid = true;

    selects.forEach((select, index) => {
        const code = select.value;
        const quantity = quantities[index].value;

        // Verificar si el código ya fue seleccionado
        if (selectedCodes.has(code)) {
            showToast(`The raw material ${code} is duplicated.`, 'error');
            valid = false;
            return;
        }
        selectedCodes.add(code);

        // Verificar si la cantidad es válida
        if (quantity <= 0 || isNaN(quantity)) {
            showToast(`Invalid quantity for material ${code}.`, 'error');
            valid = false;
            return;
        }
    });

    if (!valid) {
        e.preventDefault(); // Detiene el envío si hay errores
    }
});

