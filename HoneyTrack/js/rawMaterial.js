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
