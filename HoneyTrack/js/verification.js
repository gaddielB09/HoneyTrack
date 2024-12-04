// Espera a que el contenido del DOM se cargue completamente
document.addEventListener("DOMContentLoaded", function() {
    // // Realiza una solicitud para obtener los datos desde el archivo PHP
    // fetch('get_data.php') // Ruta a tu archivo PHP que obtiene los datos de la base de datos
    //     .then(response => {
    //         // Verifica si la respuesta es exitosa (código de estado 200)
    //         if (!response.ok) {
    //             throw new Error('Network response was not ok');
    //         }
    //         // Convierte la respuesta a formato JSON
    //         return response.json();
    //     })
    //     .then(data => {
    //         // Selecciona el cuerpo de la tabla donde se agregarán las filas
    //         const tableBody = document.getElementById('activityTableBody');
    //         // Itera sobre cada objeto en los datos recibidos
    //         data.forEach(item => {
    //             // Crea una nueva fila para la tabla
    //             const row = document.createElement('tr');
    //             // Agrega el contenido de la fila utilizando los datos de cada objeto
    //             row.innerHTML = `
    //                 <td>${item.numero}</td>
    //                 <td>${item.cantidad_recibida}</td>
    //                 <td>${item.cantidad_aceptada}</td>
    //                 <td>${item.cantidad_defectuosa}</td>
    //                 <td>${item.observaciones}</td>
    //                 <td>${item.fecha_validacion}</td>
    //                 <td>${item.numero_lote}</td>
    //                 <td>${item.cantidad}</td>
    //             `;
    //             // Agrega la fila recién creada al cuerpo de la tabla
    //             tableBody.appendChild(row);
    //         });
    //     })
    //     .catch(error => {
    //         // Maneja cualquier error que ocurra durante la solicitud o el procesamiento de datos
    //         console.error('Error:', error);
    //     });
        showFormat('format1'); // Cambia 'format1' al ID del formato que quieras mostrar por defecto


        function showFormat(formatId) {
            // Ocultar todos los formatos
            const formats = document.querySelectorAll('.format');
            formats.forEach(format => {
                format.style.display = 'none';
            });
        
            // Mostrar el formato correspondiente
            const selectedFormat = document.getElementById(formatId);
            if (selectedFormat) {
                selectedFormat.style.display = 'block';
            }
        }
        
        // Añade event listeners a los botones para asegurar funcionalidad
        document.querySelectorAll('.userOption button').forEach((button, index) => {
            button.addEventListener('click', () => {
                const formatId = `format${index + 1}`; // Asumiendo IDs format1, format2
                showFormat(formatId);
            });
        });

});




