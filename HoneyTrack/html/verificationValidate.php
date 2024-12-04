<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sidebar2.css">
    <link rel="stylesheet" href="../css/loading.css">
    <link rel="stylesheet" href="../css/verificationValidate.css">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="../js/verificationValidate.js"></script>
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
            <button class="back" onclick="back()">
             <i class="fas fa-long-arrow-alt-left"></i>
            </button>
            <h3 class="home">Verification</h3>
                <div class="format">
                    <form action="../php/updateVerification.php" method="POST">
                        <section class="data">
                            <div class="addUsers">
                                <h2 class="information">Lot Information</h2>
                                <div class="infoVerif">
                                    <div class="input-container">
                                        <label for="lot">Lot #<?php echo $_GET["lot"] ?></label>

                                    </div>
                                    <div class="input-container">
                                        <input type="hidden" name="lot" id="lot" value="<?php echo $_GET["lot"] ?>">

                                    </div>
                                    <div class="input-container">
                                        <label for="raw">Raw Material: <?php echo $_GET["raw"] ?></label>

                                    </div>

                                    <div class="input-container">
                                        <input type="hidden">
                                    </div>

                                    <div class="input-container">
                                        <label for="received">Quantity Received: <?php echo $_GET["received"] ?></label>

                                    </div>
                                    <div class="input-container">
                                        <input type="hidden" name="num" id="num" value="<?php echo $_GET["num"] ?>">

                                    </div>
                                    <div class="input-container">

                                        <input type="hidden" name="received" id="received" value="<?php echo $_GET["received"] ?>">
                                    </div>
                                    </div>
                                    <div class="personalData">

                                    <div class="input-container">
                                        <label for="accepted">Quantity Accepted:</label>
                                        <input type="number" name="accepted" id="accepted" placeholder="Accepted Quantity" value="<?php echo $_GET["accepted"] ?>">
                                    </div>
                                    <div class="input-container">
                                        <label for="defective">Quantity Defective:</label>
                                        <input type="number" name="defective" id="defective" placeholder="Defective Quantity" value="<?php echo $_GET["defective"] ?>">
                                    </div>
                                    <div class="input-container">
                                        <label for="observations">Observations:</label>
                                        <input type="text" name="observations" id="observations" placeholder="Observations" value="<?php echo $_GET["observations"] ?>">
                                    </div>

                                        <button class="submit-button" style="margin-left: 0">Validate</button>
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
    <script src="../js/verificationValidate.js"></script>
</body>
</html>

<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>