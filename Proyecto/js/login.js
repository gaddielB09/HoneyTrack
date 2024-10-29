const signUpButton = document.getElementById('signUpButton');
const signInButton = document.getElementById('signInButton');
const container = document.getElementById('container');

const recoverUserForm = document.getElementById('recoverUserForm');
const recoverPasswordButton = document.getElementById('recoverPassword');
const signInForm = document.getElementById('signInForm');

// Manejo de eventos para el botón "I Forgot my User"
signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

// Manejo de eventos para el botón "Sign In"
signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

// Manejo de eventos para el formulario de recuperación de usuario
recoverUserForm.addEventListener('submit', (event) => {
    event.preventDefault();

    // Simula el envío del correo electrónico
    alert('A recovery email has been sent.');

    // Regresa al formulario de inicio de sesión inmediatamente después de presionar "OK"
    container.classList.remove("right-panel-active");
});

/*
// Manejo de eventos para el formulario de inicio de sesión
signInForm.addEventListener('submit', (event) => {
    event.preventDefault(); // Prevenir el envío del formulario

    // Aquí podrías agregar validación de usuario si es necesario

    // Redirigir al nuevo HTML
    window.location.href = "../html/adminMain.html"; // Cambia "dashboard.html" a la página de destino
});
*/

