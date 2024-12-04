// Selección de elementos
const buttons = document.querySelectorAll('.userOption button');
const formats = document.querySelectorAll('.format');
const searchBar = document.getElementById('search-bar');
const tableBody = document.getElementById('activityTableBody');
const searchUsersForm = document.getElementById("format2"); 
const editUserForm = document.getElementById("editUserForm");
const historyButton = document.getElementById('format3');
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
const addUsersForm = document.getElementById('addusers');

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

document.querySelectorAll('.btn-edit').forEach(button => {
    button.addEventListener('click', function() {
        // Obtener la fila (tr) de donde proviene el botón
        const row = this.closest('tr');
        
        // Capturar el ID del usuario desde el atributo data-user-id
        const userId = row.getAttribute('data-user-id');
        
        // Obtener los datos de las celdas
        const name = row.cells[1].textContent.trim();
        const ap = row.cells[2].textContent.trim();
        const am = row.cells[3].textContent.trim();
        const rfc = row.cells[8].textContent.trim();
        const email = row.cells[7].textContent.trim();
        const phone = row.cells[6].textContent.trim();
        const username = row.cells[4].textContent.trim();
        const role = row.cells[9].textContent.trim();

        // Ocultar el formulario de búsqueda (format2)
        document.getElementById('format2').style.display = 'none';
        
        // Mostrar el formulario de edición (editUserForm)
        document.getElementById('editUserForm').style.display = 'block';
        
        // Asignar el ID del usuario al campo oculto en el formulario
        document.getElementById('userId-edit').value = userId;
        
        // Rellenar los campos del formulario de edición con los datos obtenidos
        document.getElementById('name-edit').value = name;
        document.getElementById('ap-edit').value = ap;
        document.getElementById('am-edit').value = am;
        document.getElementById('rfc-edit').value = rfc;
        document.getElementById('email-edit').value = email;
        document.getElementById('phone-edit').value = phone;
        document.getElementById('username-edit').value = username;

        const roleSelect = document.getElementById('role');
        Array.from(roleSelect.options).forEach(option => {
            if (option.textContent.trim() === role) {
                option.selected = true;
            }
        });
    });
});

// Mostrar formulario de edición de us  uario
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


document.addEventListener("DOMContentLoaded", function() {
    const btnX = document.querySelectorAll(".btn-x"); // Todos los botones con la clase .btn-x
    
    btnX.forEach(button => {
        button.addEventListener("click", function() {
            const userName = this.closest('tr').querySelector('td:nth-child(2)').textContent; // Obtener el nombre del usuario
            const userId = this.closest('tr').getAttribute('data-id'); // Obtener el ID del usuario

            // Definir el mensaje que quieres mostrar
            const message = `Are you sure you want to continue? You will change the users's status.`; // Ejemplo de mensaje

            // Inserta el mensaje en el modal
            document.getElementById('modalMessage').textContent = message;

            // Muestra el modal
            var myModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
            myModal.show();

            // Cuando el usuario hace clic en "Yes"
            document.getElementById('btn-yes').addEventListener('click', function() {
                // Enviar los datos al PHP para actualizar la base de datos
                fetch('../php/disableUser.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: `num=${userId}`
                })
                .then(response => response.json())
                .then(data => {
                    // Cierra el modal
                    myModal.hide();

                    // Muestra un mensaje en un toast
                    const toastMessage = data.msg || 'User status updated';
                    showToast(toastMessage);
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            });
        });
    });
});

// Función para mostrar el toast
function showToast(message) {
    // Crear el contenedor del toast
    const toastContainer = document.createElement('div');
    toastContainer.classList.add('toast', 'fade', 'show');
    toastContainer.style.position = 'absolute';
    toastContainer.style.top = '20px';
    toastContainer.style.left = '50%';
    toastContainer.style.zIndex = '1050';
    toastContainer.style.transform = 'translateX(-50%)';
    toastContainer.style.backgroundColor = '#4caf50'
    toastContainer.style.color = '#ffffff'

    // Crear el contenido del toast
    toastContainer.innerHTML = `
        <div class="toast-body">${message}</div>
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



// Escuchar el evento de envío del formulario
    document.getElementById('addUsers').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevenir el envío normal del formulario

        // Obtener los datos del formulario
        const formData = new FormData(this);

        // Realizar la solicitud AJAX para enviar el formulario
        fetch('../php/insertUser.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())  // Obtener la respuesta en formato JSON
        .then(data => {
            const message = data.msg;  // El mensaje enviado desde PHP

            // Configurar el mensaje y estilo del Toast según la respuesta
            const toastBody = document.getElementById('toast-body');
            const toastTitle = document.getElementById('toast-title');

            if (message === 'Employee created successfully') {
                toastTitle.textContent = 'Success';
                toastBody.textContent = 'Employee created successfully!';
                document.getElementById('toast-message').classList.remove('bg-danger');
                document.getElementById('toast-message').classList.add('bg-success');
                
                // Recargar la página después de 2 segundos
                setTimeout(() => {
                    window.location.reload();
                }, 2000);
            } else if (message === 'Duplicated username') {
                toastTitle.textContent = 'Error';
                toastBody.textContent = 'Duplicated username';
                document.getElementById('toast-message').classList.remove('bg-success');
                document.getElementById('toast-message').classList.add('bg-danger');
            }

            // Mostrar el Toast
            const toast = new bootstrap.Toast(document.getElementById('toast-message'));
            toast.show();

            // Ocultar el toast después de 2 segundos
            setTimeout(() => {
                const toastElement = document.getElementById('toast-message');
                if (toastElement) {
                    toastElement.classList.remove('show');  // Ocultar el toast después de 2 segundos
                }
            }, 2000);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
