<?php
require "../php/connection.php";
header('Content-Type: application/json'); // Asegura que la respuesta sea JSON
$db = connectdb();

if ($_POST) {
    $name = $_POST["name"];
    $ap = $_POST["ap"];
    $am = $_POST["am"];
    $rfc = $_POST["rfc"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $role = $_POST["role"];

    $query = "CALL insertEmployee('$name','$ap','$am','$phone','$email','$rfc','$role','$username','$password',@msg)";
    mysqli_query($db, $query);

    $result = mysqli_query($db, "SELECT @msg AS msg");
    $row = mysqli_fetch_assoc($result);

    echo json_encode(['msg' => $row['msg']]);
}
?>
