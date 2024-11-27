// document.addEventListener("DOMContentLoaded", () => {
// const editButtons = document.querySelectorAll(".btn-edit");
// const editUserForm = document.getElementById("editUserForm");
// const searchUsersForm = document.getElementById("format2"); 

//     // Mostrar formulario de edición de us  uario
//     editButtons.forEach(button => {
//         button.addEventListener("click", e => {
//             e.preventDefault(); 
//             searchUsersForm.style.display = "none";
//             editUserForm.style.display = "block";
//         });
//     });

// });
const buttons = document.querySelectorAll('.userOption button');
const formats = document.querySelectorAll('.format');
const searchUsersForm = document.getElementById("format2"); 
const editUserForm = document.getElementById("editUserForm");
const editButtons = document.querySelectorAll(".btn-edit");
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

    // Mostrar formulario de edición de us  uario
    editButtons.forEach(button => {
        button.addEventListener("click", e => {
            e.preventDefault(); 
            searchUsersForm.style.display = "none";
            editUserForm.style.display = "block";
        });
    });

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

document.getElementById('addLocationForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevenir el envío normal del formulario

    const formData = new FormData(this);

    fetch('../php/insertLocation.php', {
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

