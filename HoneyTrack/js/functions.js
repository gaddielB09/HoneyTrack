// Espera a que el contenido del DOM se cargue completamente
document.addEventListener("DOMContentLoaded", function() {
    // Realiza una solicitud para obtener los datos desde el archivo PHP
    fetch('get_data.php') // Ruta a tu archivo PHP que obtiene los datos de la base de datos
        .then(response => {
            // Verifica si la respuesta es exitosa (código de estado 200)
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            // Convierte la respuesta a formato JSON
            return response.json();
        })
        .then(data => {
            // Selecciona el cuerpo de la tabla donde se agregarán las filas
            const tableBody = document.getElementById('activityTableBody');
            // Itera sobre cada objeto en los datos recibidos
            data.forEach(item => {
                // Crea una nueva fila para la tabla
                const row = document.createElement('tr');
                // Agrega el contenido de la fila utilizando los datos de cada objeto
                row.innerHTML = `
                    <td>${item.fecha}</td>
                    <td>${item.tipo}</td>
                    <td>${item.movimiento}</td>
                    <td>${item.articulo}</td>
                    <td>${item.cantidad}</td>
                    <td>${item.destino}</td>
                `;
                // Agrega la fila recién creada al cuerpo de la tabla
                tableBody.appendChild(row);
            });
        })
        .catch(error => {
            // Maneja cualquier error que ocurra durante la solicitud o el procesamiento de datos
            console.error('Error:', error);
        });
});

const searchBar = document.getElementById('search-bar');
const tableBody = document.getElementById('activityTableBody');

searchBar.addEventListener('input', function() {
    const filterText = searchBar.value.toLowerCase();
    const rows = tableBody.getElementsByTagName('tr');

    Array.from(rows).forEach(row => {
        const cells = row.getElementsByTagName('td');
        let match = false;

        Array.from(cells).forEach(cell => {
            if (cell.textContent.toLowerCase().includes(filterText)) {
                match = true;
            }
        });

        row.style.display = match ? '' : 'none';
    });
});