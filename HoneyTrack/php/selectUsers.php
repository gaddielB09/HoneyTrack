<?php
    require_once "../php/connection.php";
    $db = connectdb();

    //Consulta todos los usuarios con su información
    $query = "SELECT * FROM vw_EmployeeXUser";
    $response = mysqli_query($db, $query);

    //Consulta todos los Job Positions
    $queryJP = "SELECT * FROM vw_JobPosition";
    $responseJP = mysqli_query($db, $queryJP);
?>