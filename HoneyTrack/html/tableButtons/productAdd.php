<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="../../php/insertRawProduct.php" method="POST">
        <label for="produc">Product <?php echo $_GET["product"] ?></label>
        <input type="text" name="raw" id="raw" placeholder="Raw Material Code">
        <input type="number" name="quantity" id="quantity" placeholder="Quantity">
        <input type="hidden" name="product" id="product" value="<?php echo $_GET["product"] ?>">
        <button>Add Raw Material</button>
    </form>
</body>
</html>