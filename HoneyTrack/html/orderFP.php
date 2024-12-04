<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/orderFP.css">
    <link rel="stylesheet" href="../css/loading.css">
    <link rel="stylesheet" href="../css/sidebar2.css">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="../css/toast.css">
    <title>Order FP</title>
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

                <nav class="userOption">
                <button onclick="showFormat(format1)">
                        <i class="fas fa-plus"></i>
                        </button>
                    <!-- Button 2 -->
                    <button onclick="showFormat(format2)">
                        <i class="fas fa-pen"></i>
                        </button>
                </nav>

                <div id="format1" class="format" style="display: none;">
                        
                        <!-- users forms -->
                        <form action="../php/insertOrderFP.php" method="post" id="addFPForm">
                            <h1 class="home">Do a Raw Material Requisition</h1>
                            
                            <section class="data">
                                <div class="addUsers">
                                    
                                    <h2 class="subtittle">Requisition Data</h2>
                                    
                                    <div class="personalData">
                                        
                                        <div class="input-container">
                                            <select  id="product" name="product" name="fp" id="fp" style="
                                        width: 100%;
                                        padding: 10px;
                                        font-size: 16px;
                                        height: 40px;
                                        border: 2px solid #ccc;
                                        border-radius: 5px;
                                        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
                                        box-sizing: border-box;
                                        background: transparent;
                                        ">
                                        <option value="" disabled select>Product Code</option>
                                        <?php
                                            require_once "../php/connection.php"; // Asegúrate de tener la conexión correcta
                                            $db = connectdb();

                                            // Consulta para obtener los códigos y nombres de la vista
                                            $query = "SELECT code, name FROM vw_Product";
                                            $response = mysqli_query($db, $query);

                                            // Verificar si la consulta devolvió resultados
                                            if ($response) {
                                                // Iterar sobre los resultados y generar las opciones
                                                while ($row = mysqli_fetch_assoc($response)) {
                                                    $code = htmlspecialchars($row['code']);
                                                    $name = htmlspecialchars($row['name']);
                                                    echo "<option value=\"$code\">$code - $name</option>";
                                                }

                                                // Liberar los recursos de la consulta
                                                mysqli_free_result($response);
                                            } else {
                                                echo "<option value=\"\">No codes available</option>";
                                            }

                                            // Cerrar la conexión a la base de datos
                                            mysqli_close($db);
                                        ?>
                                            </select>
                                        </div>

                                        <div class="input-container">
                                            <input type="number" min="1" max="99" id="quantity" name="quantity" class="onlyNumbers" placeholder="Quantity" autocomplete="off" required>
                                            <span id="error-quantity" class="error">Only Numbers are Allowed</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="number" min="1" max="99" id="line" name="line" class="onlyNumbers" placeholder="Production line" autocomplete="off" required>
                                            <span id="error-line" class="error">Only Numbers are Allowed</span>
                                        </div>
                                        <button type="submit" class="submit-button" value="Send">Submit</button>
                                    </div>
                                </div>
                            </section>
                        </form>
                    </div>
                    <div id="format2" class="format" style="display: block;"> <!-- Formulario para buscar Materia prima -->
                        <h2 class="home">Search Raw Material Requisitions</h2>
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
                                        <th>Number</th>
                                        <th>Date</th>
                                        <th>Description</th>
                                        <th>Quantity</th>
                                        <th>Employee</th>
                                        <th>Production Line</th>
                                        <th>Requisition Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                    <tbody id="activityTableBody">
                                        <!-- Aquí se agregarán las filas dinámicamente -->
                                        <?php 
                                            include "../php/selectRequisitions.php";
                                            
                                            while($row = mysqli_fetch_assoc($response)) {?>
                                            <tr>
                                                <td><?php echo $row["num"] ?></td>
                                                <td><?php echo $row["date"] ?></td>
                                                <td><?php echo $row["description"] ?></td>
                                                <td><?php echo $row["quantity"] ?></td>
                                                <td><?php echo $row["username"] ?></td>
                                                <td><?php echo $row["productionLine"] ?></td>
                                                <td><?php echo $row["status"] ?></td>

                                                <td class="buttons">
                                                    <?php if ($row["status"] != "Approved") { ?>
                                                        <button class="btn-edit" onclick="window.location.href='../php/updateRequisition.php?num=<?php echo $row["num"]?>';">Approve</button>
                                                    <?php } ?>
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
    <script src="../js/orderFP.js"></script>
</body>
</html>

<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>
