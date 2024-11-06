const inputLetters = document.querySelectorAll('.onlyLetters');
const buttons = document.querySelectorAll('.userOption button');
const formats = document.querySelectorAll('.format');

                    /* VALIDACIONES DE INPUTS*/
inputLetters.forEach(input =>{
    const errorMessage = document.getElementById(`error-${input.id}`);
        input.addEventListener('input', function (e){
            let valor = e.target.value;

            if(/[^A-Za-z]/.test(valor)){ /* Se quito es \s para evaluar igual los espacios, agregarlo en [^A-Za-z\s]*/
                errorMessage.style.display = 'block';
            }else{
                errorMessage.style.display = 'none';
            }
            e.target.value = valor.replace(/[^A-Za-z]/g, ''); /* Se quito de aqui tambien */
        });
});

                /* VISUALIZAR LOS DISTINTOS FORMULARIOS */
/* Mostrar automaticamente el formulario de registrar al ingresar al HTML */
formats[1].style.display = 'block'; 

/* Mostrar el formulario correspondiente al boton que se presiono */
buttons.forEach((button, index) => {
    button.addEventListener('click', () => {
        // Oculta todos los formularios
        formats.forEach(format => {
            format.style.display = 'none';
        });

        // Muestra el formulario correspondiente
        formats[index].style.display = 'block';
    });
});


//Copia de la tabla en lots
document.addEventListener("DOMContentLoaded", function() {
    // Realiza una solicitud para obtener los datos desde el archivo PHP
    fetch('selectUsers.php') // Ruta al archivo PHP que obtiene los datos de la base de datos
        .then(response => {

            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
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
                    <td>${item.num}</td>
                    <td>${item.nombrePila}</td>
                    <td>${item.alias}</td>
                    <td>${item.contraseña}</td>
                    <td>${item.numCont}</td>
                    <td>${item.correoElectronico}</td>
                    <td>${item.rfc}</td>
                    <td>${item.role}</td>
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