    <?php
        include('../php/connection.php');  // Incluye tu archivo de conexión

        $db = connectdb(); // Conexión a la base de datos

        // Consulta para los productos con mayor y menor cantidad
        $sqlHighStorage = "SELECT COALESCE(rawMaterial, finishedProduct) AS product, SUM(quantity) AS quantity
                        FROM STORAGE 
                        GROUP BY COALESCE(rawMaterial, finishedProduct)
                        ORDER BY SUM(quantity) DESC 
                        LIMIT 3";
        $sqlLowStorage = "SELECT COALESCE(rawMaterial, finishedProduct) AS product, SUM(quantity) AS quantity
                        FROM STORAGE 
                        GROUP BY COALESCE(rawMaterial, finishedProduct)
                        ORDER BY SUM(quantity) ASC 
                        LIMIT 3";

        // Consulta para los 3 materias primas más repetidas
        $sqlTopRawMaterial = "SELECT rawMaterial AS product, COUNT(location) AS location_count 
                            FROM STORAGE 
                            WHERE rawMaterial IS NOT NULL 
                            GROUP BY rawMaterial 
                            ORDER BY location_count DESC 
                            LIMIT 3";

        // Consulta para los 3 productos terminados más repetidos
        $sqlTopFinishedProduct = "SELECT finishedProduct AS product, COUNT(location) AS location_count 
                                FROM STORAGE 
                                WHERE finishedProduct IS NOT NULL 
                                GROUP BY finishedProduct 
                                ORDER BY location_count DESC 
                                LIMIT 3";

        // Consulta para las ubicaciones vacías
        $sqlEmptyLocations = "SELECT COUNT(location) AS empty_locations FROM STORAGE WHERE quantity = 0";

        // Ejecutar las consultas
        $resultHighStorage = mysqli_query($db, $sqlHighStorage);
        $resultLowStorage = mysqli_query($db, $sqlLowStorage);
        $resultTopRawMaterial = mysqli_query($db, $sqlTopRawMaterial);
        $resultTopFinishedProduct = mysqli_query($db, $sqlTopFinishedProduct);
        $resultEmptyLocations = mysqli_query($db, $sqlEmptyLocations);

        // Preparar los datos para retornar en formato JSON
        $data = [
            'highStorage' => mysqli_fetch_all($resultHighStorage, MYSQLI_ASSOC),
            'lowStorage' => mysqli_fetch_all($resultLowStorage, MYSQLI_ASSOC),
            'topRawMaterial' => mysqli_fetch_all($resultTopRawMaterial, MYSQLI_ASSOC),
            'topFinishedProduct' => mysqli_fetch_all($resultTopFinishedProduct, MYSQLI_ASSOC),
            'emptyLocations' => mysqli_fetch_all($resultEmptyLocations, MYSQLI_ASSOC),
        ];

        // Retornar los datos como JSON
        echo json_encode($data);
    ?>
