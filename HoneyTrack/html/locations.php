<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Locations</title>
        <link rel="stylesheet" href="../css/locations.css">
        <link rel="stylesheet" href="../css/loading.css">
        <link rel="stylesheet" href="../css/sidebar2.css">
        <link rel="stylesheet" href="../css/colors.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="path/to/font-awesome/css/all.min.css">
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
                        <a href="applications.php">
                            <i class="fas fa-receipt fa-lg"></i>
                            <span>Applications</span>
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
                            <i class="fas fa-receipt fa-lg"></i>
                          <span>Receipts</span>
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
                            <i class="fas fa-user-plus"></i>
                        </button>
                        <!-- Button 2 -->
                        <button onclick="showFormat(format2)">
                            <i class="fas fa-user-edit"></i>
                        </button>
                    </nav>
                
                    <div id="format1" class="format" style="display: none;">
                        
                        <!-- locations forms -->
                        <form action="../php/insertLocation.php" method="post">
                            <h1 class="home">Add a Location</h1>
                            
                            <section class="data">
                                <div class="addUsers">
                                    
                                    <h2 class="subtittle">Location Data</h2>
                                    
                                        
                                    <div class="location">
                                        <div class="input-container">
                                            <input type="text" id="aisle" name="aisle" placeholder="Aisle (03)" autocomplete="off" maxlength="2" required>
                                            <span id="error-aisle" class="error">Aisle Format is not Allowed</span>
                                        </div>
                                        
                                        <div class="input-container">
                                            <input type="text" id="side" name="side" placeholder="Side (A)" autocomplete="off" maxlength="2" required>
                                            <span id="error-side" class="error">Side Format is not Allowed</span>
                                        </div>
                                        
                                        <div class="input-container">
                                            <input type="text" id="bay" name="bay" placeholder="Bay (01)" autocomplete="off" maxlength="2" required>
                                            <span id="error-bay" class="error">Bay Format is not Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="text" id="level" name="level" placeholder="Level (A)" autocomplete="off" maxlength="2" required>
                                            <span id="error-level" class="error">Level Format is not Allowed</span>
                                        </div>
                                        
                                        <div class="input-container">
                                            <input type="text" id="position" name="position" placeholder="Position (01)" autocomplete="off" maxlength="2" required>
                                            <span id="error-position" class="error">Position Format is not Allowed</span>
                                        </div>
                                        </div>
                                        <div class="personalData">

                                        <div class="input-container">
                                            <input type="number" min="0" step="0.01" id="lenght" name="lenght" class="onlyNumbers" placeholder="Lenght (cm)" autocomplete="off" required>
                                            <span id="error-lenght" class="error">Only Numbers are Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="number" step="0.01" id="height" name="height" class="onlyNumbers" placeholder="Height (cm)" autocomplete="off" required>
                                            <span id="error-height" class="error">Only Numbers are Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="number" step="0.01" id="width" name="width" class="onlyNumbers" placeholder="Width (cm)" autocomplete="off" required>
                                            <span id="error-width" class="error">Only Numbers are Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="text" id="container" name="container" placeholder="Container name" autocomplete="off" maxlength="12" required>
                                            <span id="error-container" class="error">Container name Format is not Allowed</span>
                                        </div>

                                        <select class="roles" id="area" name="area" required>
                                            <option value="" disabled selected>Area</option>
                                            <option value="ARDMP">Raw Materials</option>
                                            <option value="ARDPT">Products</option>
                                        </select>

                                            <button type="submit" class="submit-button" value="Send">Submit</button>
                                    </div>
                                </div>
                            </section>
                            
                        </form>
                    </div>
                    <div id="format2" class="format" style="display: block;"> <!-- Formulario para buscar Materia prima -->
                        <h2 class="home">Search Locations</h2>
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
                                        <th>Code</th>
                                        <th>Container</th>
                                        <th>Aisle</th>
                                        <th>Side</th>
                                        <th>Bay</th>
                                        <th>Level</th>
                                        <th>Position</th>
                                        <th>Capacity</th>
                                        <th>Lenght</th>
                                        <th>Height</th>
                                        <th>Width</th>
                                        <th>Volume</th>
                                        <th>Area</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                    <tbody id="activityTableBody">
                                        <!-- Aquí se agregarán las filas dinámicamente -->
                                        <?php 
                                            include "../php/selectLocations.php";
                                            
                                            while($row = mysqli_fetch_assoc($response)) {?>
                                            <tr>
                                                <td><?php echo $row["code"] ?></td>
                                                <td><?php echo $row["container"] ?></td>
                                                <td><?php echo $row["aisle"] ?></td>
                                                <td><?php echo $row["side"] ?></td>
                                                <td><?php echo $row["bay"] ?></td>
                                                <td><?php echo $row["level"] ?></td>
                                                <td><?php echo $row["position"] ?></td>
                                                <td><?php echo $row["capacity"] ?></td>
                                                <td><?php echo $row["lenght"] ?></td>
                                                <td><?php echo $row["height"] ?></td>
                                                <td><?php echo $row["witdh"] ?></td>
                                                <td><?php echo $row["volume"] ?></td>
                                                <td><?php echo $row["area"] ?></td>
                                                <td class="buttons">
    
                                                <button class="btn-edit"><i class="fa-solid fa-pencil"></i></button>
                                                <button class="btn-x"><i class="fa-solid fa-user-xmark"></i></button>
                                                </td>
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
    </body>
    </html>
    <!--Si intentan entrar directo a esta página, se les enviará al login-->
    <?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>