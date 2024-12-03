
    // Volver al formulario de búsqueda
    function backToSearch() {
        editUserForm.style.display = 'none';
        searchUsersForm.style.display = 'block';
    }


// Espera a que el DOM esté completamente cargado
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("#format1 form");
    const inputs = form.querySelectorAll("input[required]");
    const submitButton = form.querySelector(".submit-button");
    const editButtons = document.querySelectorAll(".btn-edit");
    const editUserForm = document.getElementById("editUserForm");
    const searchUsersForm = document.getElementById("format2"); 

    // Agregar evento para el botón de editar
document.querySelectorAll('.btn-edit').forEach(button => {
    button.addEventListener('click', function() {
        // Obtener la fila (tr) de donde proviene el botón
        const row = this.closest('tr');
        
        const code = row.cells[0].textContent;
        const name = row.cells[1].textContent;
        const description = row.cells[2].textContent;
        const cost = parseFloat(row.cells[3].textContent.substr(1));
        const length = parseFloat(row.cells[4].textContent);
        const height = parseFloat(row.cells[5].textContent);
        const width = parseFloat(row.cells[6].textContent);
        const volume = parseFloat(row.cells[7].textContent);
        const weight = parseFloat(row.cells[8].textContent);
        const stock = parseInt(row.cells[9].textContent); // En cas
        
        // Ocultar el formulario de búsqueda (format2)
        document.getElementById('format2').style.display = 'none';
        
        // Mostrar el formulario de edición (editUserForm)
        document.getElementById('editUserForm').style.display = 'block';
        
        // Rellenar los campos del formulario de edición con los datos obtenidos
        document.getElementById('code-edit').value = code;
        document.getElementById('name-edit').value = name;
        document.getElementById('description-edit').value = description;
        document.getElementById('cost-edit').value = cost;
        document.getElementById('length-edit').value = length;
        document.getElementById('height-edit').value = height;
        document.getElementById('width-edit').value = width;
        document.getElementById('weight-edit').value = weight;
        // Si quieres mostrar otros valores puedes hacer lo mismo
        


    });
});



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

    // Mostrar formulario de edición de us  uario
editButtons.forEach(button => {
    button.addEventListener("click", e => {
        e.preventDefault(); 
        searchUsersForm.style.display = "none";
        editUserForm.style.display = "block";
    });
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

    fetch('../php/insertRawMaterial.php', {
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
