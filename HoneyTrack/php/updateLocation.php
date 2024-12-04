<?php
// Recibe los datos del formulario
/*$code = $_POST['code']; // Este es el código que no cambiarás, solo es usado para identificar la fila
$aisle = $_POST['aisle'];
$side = $_POST['side'];
$bay = $_POST['bay'];
$level = $_POST['level'];
$position = $_POST['position'];
$length = $_POST['length'];
$height = $_POST['height'];
$width = $_POST['width'];
$container = $_POST['container'];
$area = $_POST['area'];*/

$code = $_POST['code']; // Este es el código que no cambiarás, solo es usado para identificar la fila
$length = $_POST['length'];
$height = $_POST['height'];
$width = $_POST['width'];
$container = $_POST['container'];

// Conexión a la base de datos
include_once '../php/connection.php'; // Asegúrate de que tu archivo de conexión esté correctamente incluido
$db = connectdb();

// Consulta SQL para actualizar los datos (sin actualizar stock)
/*$query = "UPDATE LOCATION SET 
          containerName = ?,
          aisle = ?, 
          side = ?, 
          bay = ?, 
          level = ?, 
          position = ?, 
          length = ?,
          height = ?,
          width = ?,
          area = ?
          WHERE code = ?";*/


// Consulta SQL para actualizar los datos (sin actualizar stock)
$query = "UPDATE LOCATION SET 
          containerName = ?,
          length = ?,
          height = ?,
          width = ?
          WHERE code = ?";

// Preparar la consulta para evitar inyecciones SQL
$stmt = mysqli_prepare($db, $query);

// Vincula los parámetros de la consulta (sin stock)
/*mysqli_stmt_bind_param($stmt, 
"sdsdsddddss", 
$container, 
$aisle, 
$side, 
$bay, 
$level, 
$position, 
$length, 
$height, 
$width, 
$area, 
$code);*/


// Vincula los parámetros de la consulta (sin stock)
mysqli_stmt_bind_param($stmt, 
"sddds", 
$container, 
$length, 
$height, 
$width,
$code);

// Ejecutar la consulta
if (mysqli_stmt_execute($stmt)) {
    echo "Record updated successfully";
    header("Location: ../html/locations.php");
} else {
    echo "Error updating record: " . mysqli_error($db);
}

// Cerrar la conexión
mysqli_stmt_close($stmt);
mysqli_close($db);
?>
