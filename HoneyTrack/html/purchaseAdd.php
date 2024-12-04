<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sidebar2.css">
    <link rel="stylesheet" href="../css/loading.css">
    <link rel="stylesheet" href="../css/cart.css">
    <link rel="stylesheet" href="../css/rawMaterials.css">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
    <title>Document</title>
</head>
<body>
    <div id="loadingScreen">
        <h1 class="loadingText">Loading</h1>
    </div>


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

            <h3 class="home">Add a Purchase Request</h3>
                <div class="format">
                    <form action="../php/insertPurchaseRawMaterial.php" method="POST">
                        <section class="data">
                            <div class="addUsers">
                                <div class="personalData">

                                    <input type="hidden" name="num" id="num" value="<?php echo $_GET["num"] ?>">
                                    <input type="text" name="raw" id="raw" placeholder="Raw Material Code">
                                    <input type="number" name="quantity" id="quantity" placeholder="Quantity">
                                    <button class="submit-button" type="submit">Add Raw Material</button>
                                </div>
                            </div>
                        </section>
                    </form>
                </div>
        </div>
    </div>
</div>

    <script src="../js/loading.js"></script>
    <script src="../js/sidebar.js"></script>
    <script src="../js/activity.js"></script>
</body>
</html>

<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>