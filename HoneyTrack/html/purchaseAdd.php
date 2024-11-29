<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="../../php/insertPurchaseRawMaterial.php" method="POST">
        <label for="produc">Purchase Request #<?php echo $_GET["num"] ?></label>
        <input type="hidden" name="num" id="num" value="<?php echo $_GET["num"] ?>">
        <input type="text" name="raw" id="raw" placeholder="Raw Material Code">
        <input type="number" name="quantity" id="quantity" placeholder="Quantity">
        <button>Add Raw Material</button>
    </form>
</body>
</html>