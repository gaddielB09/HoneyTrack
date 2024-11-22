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


// Espera a que el contenido del DOM se cargue completamente
// document.addEventListener("DOMContentLoaded", function() {
//     // Realiza una solicitud para obtener los datos desde el archivo PHP
//     fetch('selectUsers.php') // Ruta a tu archivo PHP que obtiene los datos de la base de datos
//         .then(response => {
//             // Verifica si la respuesta es exitosa (código de estado 200)
//             if (!response.ok) {
//                 throw new Error('Network response was not ok');
//             }
//             // Convierte la respuesta a formato JSON
//             return response.json();
//         })
//         .then(data => {
//             // Selecciona el cuerpo de la tabla donde se agregarán las filas
//             const tableBody = document.getElementById('activityTableBody');
//             // Itera sobre cada objeto en los datos recibidos
//             data.forEach(item => {
//                 // Crea una nueva fila para la tabla
//                 const row = document.createElement('tr');
//                 // Agrega el contenido de la fila utilizando los datos de cada objeto
//                 row.innerHTML = `
//                     <td>${item.num}</td>
//                     <td>${item.nombrePila}</td>
//                     <td>${item.alias}</td>
//                     <td>${item.contraseña}</td>
//                     <td>${item.numCont}</td>
//                     <td>${item.correoElectronico}</td>
//                     <td>${item.rfc}</td>
//                     <td>${item.role}</td>
//                 `;
//                 // Agrega la fila recién creada al cuerpo de la tabla
//                 tableBody.appendChild(row);
//             });
//         })
//         .catch(error => {
//             // Maneja cualquier error que ocurra durante la solicitud o el procesamiento de datos
//             console.error('Error:', error);
//         });
// });

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
    // Comprobar si todos los campos requeridos están llenos
    const fields = [nameInput, apInput, amInput, rfcInput, phoneInput, emailInput, usernameInput, passwordInput, roleSelect];
    const allFilled = fields.every(input => {
        if (input.tagName === 'SELECT') {
            return input.value.trim() !== '';  // Para el select, verificar si tiene un valor
        }
        return input.value.trim() !== '';  // Para los inputs, verificar si no está vacío
    });

    submitButton.disabled = !allFilled;  // Habilitar el botón si todos los campos están llenos
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
validateField(rfcInput, "error-rfc", 13, /^[a-zA-Z0-9]*$/, "RFC can only contain letters and numbers (no spaces).");
validateField(emailInput, "error-email", 32, /^[^\s@]+@[^\s@]+\.[^\s@]+$/, "Invalid email format.");
validateField(usernameInput, "error-username", 12, /^[^\s]*$/, "Username cannot contain spaces.");
passwordInput.addEventListener("input", () => {
    const errorMessage = document.getElementById("error-password");
    const value = passwordInput.value.trim();
    if (value.length < 8 || value.length > 16) {
        errorMessage.textContent = "Password must be between 8 and 16 characters.";
        errorMessage.style.display = "block";
    } else {
        errorMessage.style.display = "none";
    }
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
        if (value.length < maxLength) {
            errorMessage.textContent = "Phone number must have exactly 10 digits.";
            errorMessage.style.display = "block";
        } else if (/[a-zA-Z]/.test(value)) {
            // Si el número contiene letras
            errorMessage.textContent = "Only numbers are allowed.";
            errorMessage.style.display = "block";
        } else {
            errorMessage.style.display = "none";
        }
    });
}

// Llamada a la función de validación para el teléfono
validatePhone(phoneInput, "error-phone", 10);

// Inicializar el estado del botón
document.addEventListener("DOMContentLoaded", () => {
    submitButton.disabled = true;
    checkFieldsFilled();    
});
