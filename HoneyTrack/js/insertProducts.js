

    // Agregar evento para el botón de editar
    document.querySelectorAll('.btn-edit').forEach(button => {
        button.addEventListener('click', function() {
            // Obtener la fila (tr) de donde proviene el botón
            const row = this.closest('tr');
            
            const code = row.cells[0].textContent;
            const name = row.cells[1].textContent;
            const description = row.cells[2].textContent;
            const length = parseFloat(row.cells[4].textContent);
            const height = parseFloat(row.cells[5].textContent);
            const width = parseFloat(row.cells[6].textContent);
            const weight = parseFloat(row.cells[8

            ].textContent);
            
            // Ocultar el formulario de búsqueda (format2)
            document.getElementById('format2').style.display = 'none';
            
            // Mostrar el formulario de edición (editUserForm)
            document.getElementById('editUserForm').style.display = 'block';
            
            // Rellenar los campos del formulario de edición con los datos obtenidos
            document.getElementById('code-edit').value = code;
            document.getElementById('name-edit').value = name;
            document.getElementById('description-edit').value = description;
            document.getElementById('length-edit').value = length;
            document.getElementById('height-edit').value = height;
            document.getElementById('width-edit').value = width;
            document.getElementById('weight-edit').value = weight;
            // Si quieres mostrar otros valores puedes hacer lo mismo
            
    
    
        });
    });

document.getElementById("addProduct").addEventListener("submit", function (event) {
    event.preventDefault(); // Prevenir el comportamiento por defecto del formulario
    
    const form = event.target;
    const formData = new FormData(form);

    fetch("../php/insertProduct.php", {
        method: "POST",
        body: formData,
    })
    .then(response => response.json())
    .then(data => {
        // Mostrar el mensaje en un toast según el tipo de respuesta
        if (data.status === 'success') {
            showToast(data.msg, 'success');
            setTimeout(() => {
                window.location.reload();
            },2000)
        } else {
            showToast(data.msg, 'error');
            setTimeout(() => {
                window.location.reload();
            },2000)
        }
    })
    .catch(error => {
        console.error("Error:", error);
        showToast('An error occurred while processing the form', 'error');
    });
});

function showToast(message, type) {
    const toastContainer = document.getElementById("toast-container");
    const toast = document.createElement("div");
    
    // Definir el color y la clase según el tipo de mensaje
    const toastClass = type === 'success' ? 'text-bg-success' : 'text-bg-danger';
    const strongText = type === 'success' ? 'Success' : 'Error';
    
    toast.className = `toast show align-items-center ${toastClass} border-0`;
    toast.role = "alert";
    toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body text-center">
                <strong>${strongText}:</strong> ${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    `;
    
    toastContainer.appendChild(toast);

    // Eliminar el toast después de unos segundos
    setTimeout(() => {
        toast.remove();
    }, 5000);
}

