<?php
require 'connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $conn = connectDB();

    // Recuperar los datos enviados por el formulario
    $userId = $_POST['userId'] ?? null;
    $name = $_POST['name'] ?? '';
    $ap = $_POST['ap'] ?? '';
    $am = $_POST['am'] ?? '';
    $rfc = $_POST['rfc'] ?? '';
    $email = $_POST['email'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $username = $_POST['username'] ?? '';
    $role = $_POST['role'] ?? '';

    // Validar que el userId esté presente
    if (empty($userId)) {
        header("Location: ../html/users.php"); // Redirigir si no se encuentra el userId
        exit();
    }

    try {
        // Obtener el employeeId asociado al userId
        $sql = "SELECT employee FROM USER WHERE num = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $employeeId = $row['employee'];

            if (is_null($employeeId)) {
                header("Location: ../html/users.php"); // Redirigir si no hay employee asociado
                exit();
            }
        } else {
            header("Location: ../html/users.php"); // Redirigir si no se encuentra el usuario
            exit();
        }

        // Actualizar la tabla EMPLOYEE
        $sql1 = "UPDATE EMPLOYEE SET 
            firstName = ?, 
            lastName = ?, 
            middleName = ?, 
            phone = ?, 
            email = ?, 
            taxId = ? 
            WHERE num = ?";
        $stmt1 = $conn->prepare($sql1);
        $stmt1->bind_param("ssssssi", $name, $ap, $am, $phone, $email, $rfc, $employeeId);
        if (!$stmt1->execute()) {
            header("Location: ../html/users.php"); // Redirigir si falla la actualización
            exit();
        }

        // Actualizar la tabla USER
        $sql2 = "UPDATE USER SET 
            username = ?
            WHERE num = ?";
        $stmt2 = $conn->prepare($sql2);
        $stmt2->bind_param("si", $username, $userId);
        if (!$stmt2->execute()) {
            header("Location: ../html/users.php"); // Redirigir si falla la actualización
            exit();
        }

    } catch (Exception $e) {
        header("Location: ../html/users.php"); // Redirigir si ocurre una excepción
        exit();
    } finally {
        // Cerrar conexiones
        $stmt->close();
        if (isset($stmt1)) $stmt1->close();
        if (isset($stmt2)) $stmt2->close();
        $conn->close();
    }

    // Redirigir a users.php después de la actualización exitosa
    header("Location: ../html/users.php");
    exit();
}
?>
