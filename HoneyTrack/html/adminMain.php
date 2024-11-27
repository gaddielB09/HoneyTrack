<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/adminMain.css">
    <link rel="stylesheet" href="../css/loading.css">
    <link rel="stylesheet" href="../css/sidebar.css">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <title>adminMain</title>
</head>
<body>

    <div id="loadingScreen">
        <h1 class="loadingText">Loading</h1>
    </div>
<div class="body-container">

        <nav class="sidebar">
            <div class="logo"> 
                <i id="btn" class="fa-solid fa-bars fa-lg"></i>
            </div>
            
            <ul class="nav-links" style="padding-left: 0">
                <li>
                    <a href="#">
                        <i class="fas fa-home fa-lg"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-comments fa-lg"></i>
                        <span>Message</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="fas fa-user fa-lg"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li class="logout">
                    <a href="../html/login.php">
                        <i class="fas fa-sign-out-alt fa-lg"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </nav>

    <div class="content">

        
        <div class="tittle-container">
            <img class="tittle" src="../images/HoneyTrack Letras chikita.svg" alt="Honey TRACK" width="600">            <!-- <img src="../images/honeytracklogo.svg" alt="HoneyTrack" class="tittle" width="200"> -->
        </div>
        <div class="wrapper">
            
            <h3 class="home">Home</h3>
                    
            <nav class="menu">
                
                <a href="users.php" id="linkUsers">
                    <i class="fas fa-users"></i>
                    <span>Users</span></a>
                    
                <a href="areas.php" id="linkUsers">
                    <i class="fas fa-map-marker-alt"></i>
                    <span> Areas</span></a>
                            
                <!-- <a href="applications.php">
                    <i class="fas fa-receipt"></i>
                    <span>Applications</span></a> -->
                                
                <a href="analysis.php">
                    <i class="fas fa-chart-bar"></i>
                    <span>Analysis</span></a>
                                    
                <a href="receipts.php">
                    <i class="fas fa-truck-loading"></i>
                    <span>Inbound</span></a>
                
                <a href="production.php">
                    <i class="fas fa-microchip"></i>
                    <span>Production</span>
                </a>
            </nav>

        </div>
    </div>
</div>

<script src="../js/sidebar.js"></script>
<script src="../js/loading.js" defer></script>
</body>
</html>

<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>