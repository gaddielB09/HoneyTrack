<?php
require_once "../php/connection.php";
$db = connectdb();

$response = [];
$query = "SELECT code, name FROM vw_RawMaterial";
$result = mysqli_query($db, $query);

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $response[] = [
            'code' => htmlspecialchars($row['code']),
            'name' => htmlspecialchars($row['name'])
        ];
    }
    mysqli_free_result($result);
}

mysqli_close($db);

header('Content-Type: application/json');
echo json_encode($response);
?>
