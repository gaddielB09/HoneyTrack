const inputLetters = document.querySelectorAll('.onlyLetters');
const buttons = document.querySelectorAll('.userOption button');
const formats = document.querySelectorAll('.format');

                    /* VALIDACIONES DE INPUTS*/
/*Validacion de letras y espacios  */
inputLetters.forEach(input =>{
    const errorMessage = document.getElementById(`error-${input.id}`);
        input.addEventListener('input', function (e){
            let valor = e.target.value;

            if(/[^A-Za-z]/.test(valor)){ /* se quito es \s para evaluar igual los espacios, agregarlo en [^A-Za-z\s]*/
                errorMessage.style.display = 'block';
            }else{
                errorMessage.style.display = 'none';
            }
            e.target.value = valor.replace(/[^A-Za-z]/g, ''); /* se quito de aqui tambien */
        });
});

                /* VISUALIZAR LOS DISTINTOS FORMULARIOS */
/* Mostrar automaticamente el formulario de registrar al ingresar al HTML */
formats[0].style.display = 'block'; 

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




