// Selección de elementos
const buttons = document.querySelectorAll('.userOption button');
const formats = document.querySelectorAll('.format');
const searchBar = document.getElementById('search-bar');
const tableBody = document.getElementById('activityTableBody');
const searchUsersForm = document.getElementById("format2"); 
const editUserForm = document.getElementById("editUserForm");
const editButtons = document.querySelectorAll(".btn-edit");
const nameInput = document.getElementById("name");
const apInput = document.getElementById("ap");
const amInput = document.getElementById("am");
const rfcInput = document.getElementById("rfc");
const phoneInput = document.getElementById("phone");
const emailInput = document.getElementById("email");
const usernameInput = document.getElementById("username");
const passwordInput = document.getElementById("password");
const roleSelect = document.getElementById("role");
const submitButton = document.getElementById("add");

// Mostrar automáticamente el formulario de registrar al cargar
formats[1].style.display = 'block'; 

// Mostrar el formulario correspondiente al botón presionado
buttons.forEach((button, index) => {
    button.addEventListener('click', () => {
        formats.forEach(format => format.style.display = 'none');
        formats[index].style.display = 'block';
    });
});

// Filtrar resultados en la tabla
searchBar.addEventListener('input', () => {
    const filterText = searchBar.value.toLowerCase();
    Array.from(tableBody.getElementsByTagName('tr')).forEach(row => {
        const cells = row.getElementsByTagName('td');
        const match = Array.from(cells).some(cell => 
            cell.textContent.toLowerCase().includes(filterText)
        );
        row.style.display = match ? '' : 'none';
    });
});

// Mostrar formulario de edición de usuario
editButtons.forEach(button => {
    button.addEventListener("click", e => {
        e.preventDefault(); 
        searchUsersForm.style.display = "none";
        editUserForm.style.display = "block";
    });
});

// Volver al formulario de búsqueda
function backToSearch() {
    editUserForm.style.display = 'none';
    searchUsersForm.style.display = 'block';
}

// Función para habilitar/deshabilitar el botón de submit
function checkFieldsFilled() {
    const fields = [nameInput, apInput, amInput, rfcInput, phoneInput, emailInput, usernameInput, passwordInput, roleSelect];

    // Verificar si todos los campos requeridos están llenos
    const allFilled = fields.every(input => {
        if (input.tagName === 'SELECT') {
            return input.value.trim() !== '';
        }
        return input.value.trim() !== '';
    });

    // Verificar que el teléfono tenga exactamente 10 dígitos
    const isPhoneValid = phoneInput.value.length === 10;

    // Verificar que el RFC tenga exactamente 13 caracteres
    const isRfcValid = rfcInput.value.length === 13;

    // Habilitar el botón solo si todos los campos están llenos, el teléfono es válido y el RFC es válido
    submitButton.disabled = !(allFilled && isPhoneValid && isRfcValid);
}

// Llamar a la función cada vez que un campo cambie
[nameInput, apInput, amInput, rfcInput, phoneInput, emailInput, usernameInput, passwordInput, roleSelect].forEach(input => {
    input.addEventListener('input', checkFieldsFilled);
});


// Validaciones específicas
function validateLetters(input, errorId, maxLength) {
    const errorMessage = document.getElementById(errorId);
    input.addEventListener("input", () => {
        let value = input.value;
        if (/[^a-zA-ZáéíóúÁÉÍÓÚñÑ]/.test(value) || /\s/.test(value)) {
            errorMessage.textContent = "Only letters are allowed, and no spaces.";
            errorMessage.style.display = "block";
        } else if (value.length > maxLength) {
            errorMessage.textContent = `Maximum ${maxLength} characters allowed.`;
            errorMessage.style.display = "block";
            value = value.substring(0, maxLength);
        } else {
            errorMessage.style.display = "none";
        }
        input.value = value.replace(/[^a-zA-ZáéíóúÁÉÍÓÚñÑ]/g, "").replace(/\s/g, "");
    });
}

function validateField(input, errorId, maxLength, regex, errorMessageText) {
    const errorMessage = document.getElementById(errorId);
    input.addEventListener("input", () => {
        let value = input.value.trim();
        if (!regex.test(value) || value.length > maxLength) {
            errorMessage.textContent = errorMessageText;
            errorMessage.style.display = "block";
            value = value.substring(0, maxLength);
        } else {
            errorMessage.style.display = "none";
        }
        input.value = value; // Actualiza el valor del campo
    });
}

// Validaciones específicas
validateLetters(nameInput, "error-name", 16);
validateLetters(apInput, "error-ap", 24);
validateLetters(amInput, "error-am", 24);
validateField(emailInput, "error-email", 32, /^[^\s@]+@[^\s@]+\.[^\s@]+$/, "Invalid email format.");
validateField(usernameInput, "error-username", 12, /^[^\s]*$/, "Username cannot contain spaces.");

rfcInput.addEventListener("input", () => {
    const errorMessage = document.getElementById("error-rfc");
    let value = rfcInput.value;

    value = value.replace(/[^a-zA-Z0-9]/g, '');

    if(value.length > 13){
        errorMessage.textContent = "RFC can only have 13 characters.";
        errorMessage.style.display = "block";
        value = value.substring(0, 13);
    }else if (!/^[a-zA-Z0-9]*$/.test(value)){
        errorMessage.textContent = "RFC can only contain letters and numbers.";
        errorMessage.style.display = "block";
    }else{
        errorMessage.style.display = "none";
    }

    rfcInput.value = value;
})

// Validación específica para contraseña
passwordInput.addEventListener("input", () => {
    const errorMessage = document.getElementById("error-password");
    let value = passwordInput.value;

    // Eliminar espacios
    value = value.replace(/\s/g, "");

    // Verificar longitud máxima
    if (value.length > 16) {
        errorMessage.textContent = "Password can only have a maximum of 16 characters.";
        errorMessage.style.display = "block";
        value = value.substring(0, 16);
    } else {
        errorMessage.style.display = "none";
    }

    // Actualizar el valor del campo
    passwordInput.value = value;
});


// Validación del select (Role)
roleSelect.addEventListener("change", () => {
    const errorMessage = document.getElementById("error-role");
    if (!roleSelect.value) {
        errorMessage.textContent = "Please select a role.";
        errorMessage.style.display = "block";
    } else {
        errorMessage.style.display = "none";
    }
});

// Validación de teléfono: Solo números y longitud exacta de 10 dígitos
function validatePhone(input, errorId, maxLength) {
    const errorMessage = document.getElementById(errorId);
    input.addEventListener("input", () => {
        let value = input.value;

        // Eliminar cualquier carácter que no sea un número
        value = value.replace(/[^0-9]/g, '');

        // Recortar si el valor excede el máximo permitido
        if (value.length > maxLength) {
            value = value.substring(0, maxLength);
        }

        // Actualizar el valor del campo
        input.value = value;

        // Verificar si el número tiene exactamente 10 dígitos
        if (value.length === maxLength) {
            errorMessage.style.display = "none";
        } else {
            errorMessage.textContent = `Phone number must have exactly ${maxLength} digits.`;
            errorMessage.style.display = "block";
        }
    });
}

// Llamada a la función de validación para el teléfono
validatePhone(phoneInput, "error-phone", 10);

// Inicializar el estado del botón
document.addEventListener("DOMContentLoaded", () => {
    submitButton.disabled = true; // Deshabilitado por defecto
    checkFieldsFilled();          // Comprobar el estado inicial
});

// Selecciona el formulario y el contenedor del mensaje
const form = document.querySelector('#format1 form');
const messageContainer = document.getElementById('message-container');
const messageText = document.getElementById('message-text');

// Intercepta el evento de submit
form.addEventListener('submit', (event) => {
    // Prevenir el envío automático para mostrar el mensaje primero
    event.preventDefault();

    // Mostrar el mensaje de éxito
    messageText.textContent = 'User successfully registered!';
    messageContainer.style.display = 'block';

    // Ocultar el mensaje después de 3 segundos
    setTimeout(() => {
        messageContainer.style.display = 'none';
        // Opcional: envía el formulario después de mostrar el mensaje
        form.submit();
    }, 3000);
});

const deactivateButtons = document.querySelectorAll('.btn-x');
const modal = document.getElementById('confirmation-modal');
const confirmYes = document.getElementById('confirm-yes');
const confirmNo = document.getElementById('confirm-no');
let currentRow = null;

// Mostrar el modal al hacer clic en el botón
deactivateButtons.forEach(button => {
    button.addEventListener('click', (event) => {
        event.preventDefault();
        modal.style.display = 'flex'; // Mostrar el modal
        currentRow = button.closest('tr'); // Guardamos la fila actual
    });
});

// Acción al confirmar (Sí)
confirmYes.addEventListener('click', () => {
    const userId = currentRow.dataset.id;

    // Enviar solicitud al PHP para cambiar el estado a INACT
    const formData = new FormData();
    formData.append('num', userId);

    fetch('../php/disableUser.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.msg === "Usuario desactivado con éxito") {
            // Cambiar el estado en la tabla sin recargar
            currentRow.querySelector('.estado').textContent = 'INACT';

            // Mostrar el mensaje de éxito
            const successMessage = document.getElementById('success-message');
            successMessage.style.display = 'block';  // Mostrar el mensaje

            // Eliminar el mensaje después de 3 segundos
            setTimeout(() => {
                successMessage.style.display = 'none';  // Ocultar el mensaje
            }, 3000);
        }
        modal.style.display = 'none'; // Ocultar el modal
    })
    .catch(error => {
        console.error('Error:', error);
        modal.style.display = 'none'; // Ocultar el modal en caso de error
    });
});

// Acción al cancelar (No)
confirmNo.addEventListener('click', () => {
    modal.style.display = 'none'; // Ocultar el modal
});

