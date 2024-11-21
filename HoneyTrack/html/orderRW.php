<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="../css/sidebar2.css">
    <link rel="stylesheet" href="../css/orderRW.css">
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
                          <!-- <span>Users</span> -->
                        </a>
                </li>
    
                <li>
                    <a href="areas.php" id="linkUsers">
                        <i class="fas fa-map-marker-alt fa-lg"></i>
                          <!-- <span>Areas</span> -->
                    </a>
                </li>

                <li>
                    <a href="applications.php">
                        <i class="fas fa-receipt fa-lg"></i>
                        <!-- <span>Applications</span> -->
                    </a>
                </li>
    
                <li>
                    <a href="analysis.php">
                        <i class="fas fa-chart-bar fa-lg"></i>
                        <!-- <span>Analysis</span> -->
                    </a>
                </li>
    
                <li>
                    <a href="receipts.php">
                        <i class="fas fa-receipt fa-lg"></i>
                      <!-- <span>Receipts</span> -->
                    </a>
                </li>
    
                <li class="logout">
                    <a href="login.php">
                        <i class="fas fa-sign-out-alt fa-lg"></i>
                          <!-- <span>Logout</span> -->
                    </a>
                </li>
            </ul>
        </nav>

        <div class="content">
            <div class="tittle-container">
            <img class="tittle" src="../images/HoneyTrack Letras chikita.svg" alt="Honey TRACK" width="600">
            </div>

            <div class="wrapper">
                <h3 class="home">ORDER RAW MATERIAL</h3>
                <div class="orderRW">
                    <div class="up-container">

                    <div class="cont">
                        
                        <div class="search-container">
                            <input type="search" id="search-bar" placeholder="Nombre o ID" required>
                            <span id="search-icon" class="icon-search"><svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-search" width="20" height="20" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                <path d="M10 10m-7 0a7 7 0 1 0 14 0a7 7 0 1 0 -14 0" />
                                <path d="M21 21l-6 -6" />
                                </svg></span>

                        </div>  
                                <div>
                                    <button class="addApplication"><i class="fa-solid fa-circle-plus"></i></button>

                                </div>



                    </div>

                            <div class="table-container">

                                <table>
                                    <thead>
                                        <tr>
                                            <th>Application Status</th>
                                            <th>No. Application Purchase</th>
                                            <th>Date Application Purchase</th>
                                            <th>Quantity Raw Material</th>
                                            <th>Subtotal</th>
                                            <th>IVA</th>
                                            <th>Total</th>
                                            <th>Empleado</th>
                                        </tr>
                                    </thead>
                                    <tbody class="orderRWTableBody">
                                        <!-- Aquí se agregarán las filas dinámicamente -->
                                        <?php 
                                        include "../php/selectRawMaterialOrder.php";

                                        while($row = mysqli_fetch_assoc($response)) {?>
                                        <tr>
                                            <td><?php echo $row["descripcion"] ?></td>
                                            <td><?php echo $row["num"] ?></td>
                                            <td><?php echo $row["fecha"] ?></td>
                                            <td><?php echo $row["cant"] ?></td>
                                            <td><?php echo $row["subtotal"] ?></td>
                                            <td><?php echo $row["IVA"] ?></td>
                                            <td><?php echo $row["total"] ?></td>
                                            <td><?php echo $row["alias"] ?></td>

                                        </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>
                            </div>

                </div>
            </div>
        </div>
    </div>
    <script src="../js/sidebar.js"></script>
</body>
</html>