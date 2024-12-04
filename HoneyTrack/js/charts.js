// Obtener los datos desde PHP o tu backend
fetch('../php/get_grafics.php')
    .then(response => response.json())
    .then(data => {
        // Crear las gráficas
        createChart(
            'chart1', 
            data.highStorage.map(item => item.product),  // Cambiado a 'product'
            data.highStorage.map(item => item.quantity), 
            'Products with more quantity'
        );

        createChart(
            'chart2', 
            data.lowStorage.map(item => item.product),  // Cambiado a 'product'
            data.lowStorage.map(item => item.quantity), 
            'Products with less quantity'
        );

        createChart(
            'chart3', 
            data.topRawMaterial.map(item => item.product),  // Cambiado a 'product'
            data.topRawMaterial.map(item => item.location_count), 
            'Most repeated raw material'
        );

        createChart(
            'chart4', 
            data.topFinishedProduct.map(item => item.product),  // Cambiado a 'product'
            data.topFinishedProduct.map(item => item.location_count), 
            'Most repeated Finished Products'
        );
    });

    // Función para crear las gráficas con ajuste de max para cada gráfico
function createChart(chartId, labels, data, title) {
    const ctx = document.getElementById(chartId).getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: title,
                data: data,
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                    max: getMaxValueForChart(chartId), // Establecer el máximo de acuerdo con el gráfico
                    min: 0,
                    ticks: {
                        stepSize: 1
                    }
                }
            }
        }
    });
}

// Función para obtener el máximo para cada gráfico según su id
function getMaxValueForChart(chartId) {
    switch (chartId) {
        case 'chart1': 
            return 200; // Máximo de 100 para chart1
        case 'chart2': 
            return 50;  // Máximo de 60 para chart2
        case 'chart3': 
        case 'chart4': 
            return 10;  // Máximo de 10 para chart3 y chart4
        default: 
            return 100; // Valor por defecto
    }
}

// Función para actualizar los datos
function updateCharts() {
    fetch('../php/get_grafics.php')
        .then(response => response.json())
        .then(data => {
            // Actualizar los gráficos
            updateChart('chart1', data.highStorage.map(item => item.product), data.highStorage.map(item => item.quantity));
            updateChart('chart2', data.lowStorage.map(item => item.product), data.lowStorage.map(item => item.quantity));
            updateChart('chart3', data.topRawMaterial.map(item => item.product), data.topRawMaterial.map(item => item.location_count));
            updateChart('chart4', data.topFinishedProduct.map(item => item.product), data.topFinishedProduct.map(item => item.location_count));
        });
}

// Llamar a la función para actualizar los datos
updateCharts();
    
    
