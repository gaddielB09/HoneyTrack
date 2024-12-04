<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sidebar2.css">
    <link rel="stylesheet" href="../css/orderRW.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../css/toast.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <title>Document</title>
</head>
<body>

<div class="body-container">
<nav class="sidebar">
        <div class="logo"> 
            <i id="btn" class="fas fa-bars fa-lg"></i>
        </div>
        
        <ul class="nav-links">
            <li>
                <a href="adminMain.php">
                    <i class="fas fa-house fa-lg"></i>
                    <!-- <span>Main Menu</span> -->
                </a>
            </li>

            <li>
                <a href="users.php" id="linkUsers">
                    <i class="fas fa-users fa-lg"></i>
                      <span>Users</span>
                    </a>
            </li>

            <li>
                <a href="areas.php" id="linkUsers">
                    <i class="fas fa-map-marker-alt fa-lg"></i>
                      <span>Areas</span>
                </a>
            </li>

            <li>
                <a href="analysis.php">
                    <i class="fas fa-chart-bar fa-lg"></i>
                    <span>Analysis</span>
                </a>
            </li>

            <li>
                <a href="receipts.php">
                    <i class="fas fa-truck-loading fa-lg"></i>
                  <span>Inbound</span>
                </a>
            </li>

            <li>
                <a href="production.php">
                    <i class="fas fa-microchip fa-lg"></i>
                    <span>Production</span>
                </a>
            </li>

            <li class="logout">
                <a href="login.php">
                    <i class="fas fa-sign-out-alt fa-lg"></i>
                      <span>Logout</span>
                </a>
            </li>
        </ul>
    </nav>

    <div class="content">
    <div class="tittle-container">
                    <img class="tittle" src="../images/HoneyTrack Letras chikita.svg" alt="Honey TRACK" width="600">
                    </div>
        <div class="wrapper">
            <button onclick="back()" class="back"><i class="fas fa-long-arrow-alt-left"></i></button>
            <h3 class="home">Add RW</h3>

            <form action="../php/insertRawProduct.php" method="POST" id="addOrderRMForm">
    <section class="data">
        <div class="addUsers">
            <button class="addRW" type="button" id="add-field-button"><i class="fas fa-plus"></i></button>

            <div id="fields-container">
                <div class="personalData">
                    <select name="raw[]" id="code" required style="
                        width: 100%;
                        padding: 10px;
                        font-size: 16px;
                        height: 40px;
                        border: 2px solid #ccc;
                        border-radius: 5px;
                        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
                        box-sizing: border-box;
                        background: transparent;">
                        <option value="default" disabled selected>Raw Material Code</option>
                        <?php
                            require "../php/connection.php";
                            $db = connectdb();

                            $query = "SELECT code, name FROM vw_RawMaterial";
                            $response = mysqli_query($db, $query);

                            if ($response) {
                                while ($row = mysqli_fetch_assoc($response)) {
                                    $code = htmlspecialchars($row['code']);
                                    $name = htmlspecialchars($row['name']);
                                    echo "<option value=\"$code\">$code - $name</option>";
                                }
                                mysqli_free_result($response);
                            } else {
                                echo "<option value=\"\">No codes available</option>";
                            }

                            mysqli_close($db);
                        ?>
                    </select>
                    <div class="input-container">
                        <input type="number" name="quantity[]" id="quantity" placeholder="Quantity" required>
                    </div>
                </div>
            </div>
            <input type="hidden" name="product" id="product" value="<?php echo $_GET["product"]; ?>">
            <button type="submit" class="submit-button">Add Raw Materials</button>
        </div>
    </section>
</form>
        </div>
    </div>
</div>
<script src="../js/addRawToAProduct.js"></script>

</body>
</html>

<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>