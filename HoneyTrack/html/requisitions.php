<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/requisition.css">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="../css/sidebar2.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
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
                <img class="tittle" src="../images/HoneyTrack Letras chikita.svg" alt="HoneyTrack" width="600">
            </div>

            <div class="wrapper">
                <h3 class="home">Raw Material per Product</h3>

                <div class="searchPanel">
                        
                        <div class="search-container">
                            <input type="search" id="search-bar" placeholder="Nombre o ID" required>
                            <span id="search-icon" class="icon-search"><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-search" width="20" height="20" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                <path d="M21 21l-6 -6" />
                            </svg></span>
                        </div>
                        <div class="table-container">
                        <table>
                            <thead>
                                <tr>
                                    <th>Finished Product</th>
                                    <th>Raw Material</th>
                                    <th>Quantity</th>
                                    <th>Total Material Cost</th>
                                </tr>
                            </thead>
                                <tbody id="activityTableBody">
                                    <!-- Aquí se agregarán las filas dinámicamente -->
                                    <?php include "../php/selectRW&FP.php";
                                     while($row = mysqli_fetch_assoc($responseRWFP)) {?>
                                        <tr>
                                            <td><?php echo $row["finishedProduct"] ?></td>
                                            <td><?php echo $row["rawMaterial"] ?></td>
                                            <td><?php echo $row["quantity"] ?></td>
                                            <td><?php echo $row["totalMaterialCost"] ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>  
                        </div>
                    </div>
            </div>
        </div>
    </div>

    <script src="../js/functions.js"></script>
</body>
</html>
<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>