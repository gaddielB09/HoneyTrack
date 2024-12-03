<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Storage</title>
        <link rel="stylesheet" href="../css/storage.css">
        <link rel="stylesheet" href="../css/loading.css">
        <link rel="stylesheet" href="../css/sidebar2.css">
        <link rel="stylesheet" href="../css/colors.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/toast.css">
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
                <p class=""><?php if ($_GET) echo $_GET["msg"]; ?></p>
    
                    <nav class="userOption">
                        
                        <!-- Button 1 -->
                        <button onclick="showFormat(format1)">
                        <i class="fas fa-plus"></i>
                        </button>
                        <!-- Button 2 -->
                        <button onclick="showFormat(format2)">
                        <i class="fas fa-pen"></i>
                        </button>
                    </nav>
                
                    <div id="format1" class="format" style="display: none;">
                        
                        <!-- locations forms -->
                        <form action="../php/insertStorage.php" method="post" id="addStorageForm">
                            <h1 class="home">Storage item</h1>
                            
                            <section class="data">
                                <div class="addUsers">
                                    
                                    <h2 class="subtittle">Storage information</h2>
                                    
                                    <div class="personalData">
                                        
                                        <div class="input-container">
                                            <input type="text" id="item" name="item" placeholder="Item code" autocomplete="off" maxlength="5" required>
                                            <span id="error-item" class="error">Item code Format is not Allowed</span>
                                        </div>
                                        
                                        <div class="input-container">
                                            <input type="text" id="location" name="location" placeholder="Location code" autocomplete="off" maxlength="8" required>
                                            <span id="error-location" class="error">Location code Format is not Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="number" min="1" max="999" id="quantity" name="quantity" class="onlyNumbers" placeholder="Quantity" autocomplete="off" required>
                                            <span id="error-quantity" class="error">Only Numbers are Allowed</span>
                                        </div>

                                            <input type="submit" class="submit-button" value="Send">
                                    </div>
                                </div>
                            </section>
                            
                        </form>
                    </div>
                    <div id="format2" class="format" style="display: block;"> <!-- Formulario para buscar Materia prima -->
                        <h2 class="home">Search Storage</h2>
                        <div class="searchPanel">
                            
                            <div class="search-container">
                                <input type="search" id="search-bar" placeholder="Code or..." required>
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
                                        <th>Location</th>
                                        <th>Area</th>
                                        <th>Item</th>
                                        <th>Quantity</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                    <tbody id="activityTableBody">
                                        <!-- Aquí se agregarán las filas dinámicamente -->
                                        <?php 
                                            include "../php/selectStorage.php";
                                            
                                            while($row = mysqli_fetch_assoc($response)) {?>
                                            <tr>
                                                <td><?php echo $row["location"] ?></td>
                                                <td><?php echo $row["area"] ?></td>
                                                <td><?php echo $row["item"] ?></td>
                                                <td><?php echo $row["quantity"] ?></td>
                                                <td><?php echo $row["description"] ?></td>
                                            </tr>
                                        <?php } ?>
                                    </tbody>
                                </table>  
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    <script src="../js/users.js"></script>
    <script src="../js/sidebar.js"></script>
    <script src="../js/loading.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/insertStorage.js"></script>
    </body>
    </html>
    <!--Si intentan entrar directo a esta página, se les enviará al login-->
    <?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>