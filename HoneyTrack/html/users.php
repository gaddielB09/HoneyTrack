<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users</title>
    <link rel="stylesheet" href="../css/users.css">
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
                        <form action="../php/insertUser.php" method="post">
                            <h1 class="home">Add Users</h1>
                            <section class="data">
                                <div class="addUsers">
                                    <h2 class="subtittle">Personal Data</h2>
                                    <div class="personalData">

                                    
                                        <div class="input-container">
                                            <input type="text" id="name" name="name" class="onlyLetters" placeholder="Name" autocomplete="off" required>
                                            <span id="error-name" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="text" id="ap" name="ap" class="onlyLetters" placeholder="Last Name (Paternal)" autocomplete="off" required>
                                            <span id="error-ap" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="text" id="am" name="am" class="onlyLetters" placeholder="Last Name (Maternal)" autocomplete="off" required>
                                            <span id="error-am" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="text" id="rfc" name="rfc" placeholder="RFC" autocomplete="off" required>
                                            <span id="error-rfc" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="tel" id="phone" name="phone" placeholder="Contact Number" autocomplete="off" required>
                                            <span id="error-phone" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="email" id="email" name="email" placeholder="Email" autocomplete="off" required>
                                            <span id="error-email" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                    </div>

                                    <h2 class="subtittle2">User Data</h2>
                                    <div class="userData">
                                    <div class="input-container">
                                        <input type="text" id="username" name="username" placeholder="Username" autocomplete="off" required>
                                            <span id="error-username" class="error" style="display: none; color: red;">Error message</span>
                                        </div>

                                        <div class="input-container">
                                            <input type="password" id="password" name="password" placeholder="Password" autocomplete="off" required>
                                            <span id="error-password" class="error" style="display: none; color: red;">Error message</span>
                                            
                                        </div>

                                        <select class="roles" id="role" name="role" required>
                                            <option value="" disabled selected>Role</option>
                                            <option value="ADMIN">Administrator</option>
                                            <option value="ANAIN">Analyst</option>
                                            <option value="GRDMP">Item Manager</option>
                                            <option value="RECEP">Receptionist</option>
                                        </select>

                                        <button type="submit" id="add" class="submit-button" disabled>Submit</button>
                                    </div>
                                </div>
                            </section>
                        </form>
                        <div id="message-container" style="display: none;">
                            <p id="message-text"></p>
                        </div>
                    </div>
                <div id="format2" class="format" style="display: block;">
                    <form action="searchUsersForm">
                    <h2 class="home">Search Users</h2>
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
                                    <th>Name</th>
                                    <th>Alias</th>
                                    <th>Password</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>RFC</th>
                                    <th>Role</th>
                                    <th>State</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                                <tbody id="activityTableBody">
                                    <!-- Aquí se agregarán las filas dinámicamente -->
                                    <?php 
                                        include "../php/selectUsers.php";
                                        
                                        while($row = mysqli_fetch_assoc($response)) {?>
                                        <tr>
                                            <td><?php echo $row["num"] ?></td>
                                            <td><?php echo $row["nombre"] ?></td>
                                            <td><?php echo $row["alias"] ?></td>
                                            <td><?php echo $row["contraseña"] ?></td>
                                            <td><?php echo $row["numCont"] ?></td>
                                            <td><?php echo $row["correoElectronico"] ?></td>
                                            <td><?php echo $row["rfc"] ?></td>
                                            <td><?php echo $row["descripcion"] ?></td>
                                            <td><?php echo $row["estado"] ?></td>
                                            <td class="buttons">

                                            <button class="btn-edit" id="btn-edit"><i class="fa-solid fa-pencil"></i></button>
                                            <button class="btn-x" ><i class="fa-solid fa-user-xmark"></i></button>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>  
                        </div>
                    </div>
                    
                </div>

                    <!-- Formulario Edit Users -->
                    <div id="editUserForm" style="display: none;" class="format">
                        <form id="updateForm" action="#" method="post">
                        <button id="backToSearchBtn" type="button" onclick="backToSearch()">Back to Search</button>
                            <h1 class="home">Edit User</h1>
                            <input type="hidden" id="userId" name="userId">
                            
                            <section class="data">
                            <div class="addUsers">
                                
                                <h2 class="subtittle">Personal Data</h2>
                                
                                <div class="personalData">
                                    
                                    <div class="input-container">
                                        <input type="text" id="name" name="name" class="onlyLetters" placeholder="Name" autocomplete="off" required>
                                        <span id="error-name" class="error">Only Letters are Allowed</span>
                                    </div>
                                    
                                    <div class="input-container">
                                        <input type="text" id="ap" name="ap" class="onlyLetters" placeholder="Last Name (Paternal)" autocomplete="off" required>
                                        <span id="error-ap" class="error">Only Letters are Allowed</span>
                                    </div>
                                    
                                    <div class="input-container">
                                        <input type="text" id="am" name="am" class="onlyLetters" placeholder="Last Name (Maternal)" autocomplete="off" required>
                                        <span id="error-am" class="error">Only Letters are Allowed</span>
                                    </div>
                                    
                                    <div class="input-container">
                                        <input type="text" id="rfc" name="rfc" placeholder="RFC" autocomplete="off" required>
                                        <span id="error-rfc" class="error">RFC Format is not Allowed</span>
                                    </div>
                                    
                                        <div class="input-container">
                                            <input type="email" id="email" name="email" placeholder="Email" autocomplete="off" required>
                                            <span id="error-email" class="error">Email Format is not Allowed</span>
                                        </div>
                                        
                                        <div class="input-container">
                                            <input type="tel" id="phone" name="phone" placeholder="Contact Number" autocomplete="off" required>
                                            <span id="error-phone" class="error" style="display: none;">Contact Number not Valid</span>
                                        </div>
                                    </div>
                                    
                                    <h2 class="subtittle2">User Data</h2>
                                    <div class="userData">
                                        <input type="text" id="username" name="username" placeholder="Username" autocomplete="off" required>
                                        
                                        <input type="password" id="password" name="password" placeholder="Password" autocomplete="off" required>
                                        
                                        <select class="roles" id="role" name="role" required>
                                            <option value="">Role</option required>
                                            <option value="ADMIN">Administrator</option required>
                                            <option value="ANAIN">Analyst</option required>
                                            <option value="GRDMP">Item Manager</option required>
                                            <option value="RECEP">Receptionist</option required>
                                        </select>
                                        
                                        <input type="submit" class="submit-button" value="Update">
                                    </div>
                            </div>
                        </section>
                        </form>
                    </div>

                    <div id="successMessage" style="display: none;" class="success-message">
                        <p>User has been successfully updated!</p>
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