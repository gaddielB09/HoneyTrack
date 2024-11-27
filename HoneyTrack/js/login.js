const signInButton = document.getElementById('signInButton');
const container = document.getElementById('container');

const signInForm = document.getElementById('signInForm');


const usernameInput = document.getElementById('username');
const passwordInput = document.getElementById('password');

signInForm.addEventListener('submit', function (event) {
    event.preventDefault(); // Prevenir el comportamiento por defecto del formulario

    const username = usernameInput.value;
    const password = passwordInput.value;

    // Hacer la petición AJAX
    const xhr = new XMLHttpRequest();
    xhr.open('POST', '../php/validateLogin.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function () {
        const response = JSON.parse(xhr.responseText); // Respuesta del servidor
        const msg = response.msg;  // Mensaje que retorna el SP

        // Crear el toast dinámicamente
        let toast = document.createElement('div');
        toast.classList.add('toast', 'fade', 'show');
        toast.setAttribute('role', 'alert');
        toast.setAttribute('aria-live', 'assertive');
        toast.setAttribute('aria-atomic', 'true');

        // Añadir el contenido del toast
        toast.innerHTML = `
            <div class="toast-header">
                <strong class="me-auto">${msg === "Login Successfully" ? "Success" : "Error"}</strong>
            </div>
            <div class="toast-body">
                ${msg}
            </div>
        `;

        if (msg === "Login Successfully") {
            toast.classList.add('toast-success');
            toast.style.maxWidth = '400px'; 
            toast.style.backgroundColor = '#28a745'; 
        } else {
            toast.classList.add('toast-error');
            toast.style.maxWidth = '700px';
            toast.style.backgroundColor = '#dc3545'
        }

        // Añadir el toast al contenedor
        const toastContainer = document.getElementById('toast-container');
        toastContainer.appendChild(toast);

        // Mostrar el toast durante 2 segundos y luego redirigir
        setTimeout(function () {
            toast.classList.remove('show');
            toast.classList.add('hide'); // Esto hace que el toast se desvanezca

            // Redirigir a la página adecuada después de 2 segundos si el login fue exitoso
            if (msg === "Login Successfully") {
                switch (response.role) {
                    case 'USCSC':
                        window.location.href = '../html/adminMain.php';
                        break;
                    case 'UMINV':
                        window.location.href = '../html/analystMain.php';
                        break;
                    case 'RRVIN':
                        window.location.href = '../html/managerMain.php';
                        break;
                    case 'PARRM':
                        window.location.href = '../html/receptionistMain.php';
                        break;
                    default:
                        window.location.href = '../html/login.php?msg=error';
                        break;
                }
            }
        }, 2000); // Duración de 2 segundos para el toast
    };

    xhr.send(`username=${username}&password=${password}`);
});

