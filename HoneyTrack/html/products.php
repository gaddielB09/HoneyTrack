<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
    
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Products</title>
        <link rel="stylesheet" href="../css/products.css">
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
    
                    <nav class="userOption">
                        
                        <button onclick="showFormat(format1)">
                            <i class="fas fa-user-plus"></i>
                        </button>
                        <!-- Button 2 -->
                        <button onclick="showFormat(format2)">
                            <i class="fas fa-user-edit"></i>
                        </button>
                    </nav>
                
                    <div id="format1" class="format" style="display: none;">
                        
                        <!-- users forms -->
                        <form action="../php/insertProduct.php" method="post">
                            <h1 class="home">Add Product</h1>
                            
                            <section class="data">
                                <div class="addUsers">
                                    
                                    <h2 class="subtittle">Product Data</h2>
                                    
                                    <div class="personalData">
                                        
                                        <div class="input-container">
                                            <input type="text" id="code" name="code" placeholder="Code" autocomplete="off" maxlength="5" required>
                                            <span id="error-code" class="error">Code Format is not Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="text" id="name" name="name" placeholder="Name" autocomplete="off" maxlength="64" required>
                                            <span id="error-name" class="error">Name Format is not Allowed</span>
                                        </div>
                                        
                                        <div class="input-container">
                                            <input type="text" id="description" name="description" placeholder="Description" autocomplete="off" maxlength="256" required>
                                            <span id="error-description" class="error">Description Format is not Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="number" step="0.01" id="lenght" name="lenght" class="onlyNumbers" placeholder="Lenght (cm)" autocomplete="off" required>
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
                                            <input type="number" step="0.01" id="weight" name="weight" class="onlyNumbers" placeholder="Weight (gr)" autocomplete="off" required>
                                            <span id="error-cost" class="error">Only Numbers are Allowed</span>
                                        </div>
                                            <input type="submit" class="submit-button" value="Send">
                                    </div>
                                </div>
                            </section>
                            
                        </form>
                    </div>
                    <div id="format2" class="format" style="display: block;"> <!-- Formulario para buscar Materia prima -->
                        <h2 class="home">Search Products</h2>
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
                                        <th>Code</th>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>Net Cost</th>
                                        <th>Lenght</th>
                                        <th>Height</th>
                                        <th>Width</th>
                                        <th>Volume</th>
                                        <th>Weight</th>
                                        <th>Stock</th>
                                        <th>Action</th>

                                    </tr>
                                </thead>
                                    <tbody id="activityTableBody">
                                        <!-- Aquí se agregarán las filas dinámicamente -->
                                        <?php 
                                            include "../php/selectProducts.php";
                                            
                                            while($row = mysqli_fetch_assoc($response)) {?>
                                            <tr>
                                                <td><?php echo $row["codigo"] ?></td>
                                                <td><?php echo $row["nombre"] ?></td>
                                                <td><?php echo $row["descripcion"] ?></td>
                                                <td><?php echo $row["costoNeto"] ?></td>
                                                <td><?php echo $row["largo"] ?></td>
                                                <td><?php echo $row["alto"] ?></td>
                                                <td><?php echo $row["ancho"] ?></td>
                                                <td><?php echo $row["volumen"] ?></td>
                                                <td><?php echo $row["peso"] ?></td>
                                                <td><?php echo $row["stock"] ?></td>
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