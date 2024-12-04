
 // Agregar evento para el botón de editar
 document.querySelectorAll('.btn-edit').forEach(button => {
    button.addEventListener('click', function() {
        // Obtener la fila (tr) de donde proviene el botón
        const row = this.closest('tr');
        
        const code = row.cells[0].textContent;
        const container = row.cells[1].textContent;
        const aisle = row.cells[2].textContent;
        const side = row.cells[3].textContent;
        const bay = row.cells[4].textContent;
        const level = row.cells[5].textContent;
        const position = row.cells[6].textContent;
        const length = parseFloat(row.cells[8].textContent);
        const height = parseFloat(row.cells[9].textContent);
        const width = parseFloat(row.cells[10].textContent);
        const area = row.cells[12].textContent;
        // Ocultar el formulario de búsqueda (format2)
        document.getElementById('format2').style.display = 'none';
        
        // Mostrar el formulario de edición (editUserForm)
        document.getElementById('editUserForm').style.display = 'block';
        
        // Rellenar los campos del formulario de edición con los datos obtenidos
        document.getElementById('code-edit').value = code;
        document.getElementById('aisle-edit').value = aisle;
        document.getElementById('side-edit').value = side;
        document.getElementById('bay-edit').value = bay;
        document.getElementById('level-edit').value = level;
        document.getElementById('position-edit').value = position;
        document.getElementById('length-edit').value = length;
        document.getElementById('height-edit').value = height;
        document.getElementById('width-edit').value = width;
        document.getElementById('container-edit').value = container;
        document.getElementById('area-edit').value = area;    
    });
});

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

    const addLocationForm = document.getElementById("addLocation");

    addLocationForm.addEventListener("submit", async function (event) {
        event.preventDefault(); // Prevenir el comportamiento por defecto
    
        const formData = new FormData(this); // Obtener los datos del formulario
        
        try {
            const response = await fetch("../php/insertLocation.php", {
                method: "POST",
                body: formData,
            });
    
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
    
            const data = await response.json();
            console.log(data); // Verifica que el mensaje esté correcto en la consola
    
            // Muestra un toast según el tipo de respuesta
            if (data.status === "success") {
                showToast(data.msg, "success");
                this.reset(); // Limpia el formulario si es necesario
            } else {
                showToast(data.msg, "error");
            }
        } catch (error) {
            console.error("Error:", error);
            showToast("An error occurred while processing the form.", "error");
        }
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
    
    


