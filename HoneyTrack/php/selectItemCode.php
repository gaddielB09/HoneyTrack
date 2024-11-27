<?php
    require "../php/connection.php";

    $db = connectdb();

    $queryITRW = "SELECT * FROM RAW_MATERIAL";
    $responseITRW = mysqli_query($db, $queryITRW);

    $queryITFP= "SELECT * FROM FINISHED_PRODUCT";
    $responseITFP = mysqli_query($db, $queryITRW);
    ?>