
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

    document.getElementById("addLocation").addEventListener("submit", function (event) {
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
            } else {
                showToast(data.msg, 'error');
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
    
    


