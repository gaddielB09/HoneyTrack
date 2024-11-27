<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="../../php/updateVerification.php" method="POST">
        <label for="lot">Lot #<?php echo $_GET["lot"] ?></label>
        <input type="hidden" name="lot" id="lot" value="<?php echo $_GET["lot"] ?>">
        
        <label for="raw">Raw Material: <?php echo $_GET["raw"] ?></label>
        <label for="received">Quantity Received: <?php echo $_GET["received"] ?></label>

        <input type="hidden" name="num" id="num" value="<?php echo $_GET["num"] ?>">
        <input type="hidden" name="received" id="received" value="<?php echo $_GET["received"] ?>">
        <input type="number" name="accepted" id="accepted" placeholder="Accepted Quantity" value="<?php echo $_GET["accepted"] ?>">
        <input type="number" name="defective" id="defective" placeholder="Defective Quantity" value="<?php echo $_GET["defective"] ?>">
        <input type="text" name="observations" id="observations" placeholder="Observations" value="<?php echo $_GET["observations"] ?>">
        <button>Validate</button>
    </form>
</body>
</html>