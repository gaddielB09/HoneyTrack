<?php
require "../php/connection.php";
session_start();
$db = connectdb();

if ($_POST) {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $query = "CALL validateUser('$username', '$password',@role, @msg)";
    $response = mysqli_query($db, $query);

    $query = "SELECT @role AS role, @msg AS msg";
    $response = mysqli_query($db, $query);

    $msg = "";
    $role = "";

    while ($row = mysqli_fetch_assoc($response)) {
        $msg = $row["msg"];
        $role = $row["role"];

        if ($msg == "Login Successfully") {
            $_SESSION['user'] = $username;
            $_SESSION['role'] = $role;
        }

        echo json_encode(['msg' => $msg, 'role' => $role]); // Retornar JSON
        exit;
    }
} else {
    echo json_encode(['msg' => 'Invalid request']);
}
?>
