<!--Validar que haya iniciado sesión-->
<?php session_start(); if ($_SESSION["user"]!="") { ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project</title>
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/loading.css">
    <link rel="stylesheet" href="../js/loading.js">
    <link rel="stylesheet" href="../css/colors.css">
    <link rel="stylesheet" href="../css/access.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <div id="loadingScreen">
        <h1 class="loadingText">Loading</h1>
    </div>

    <div class="container" id="container">
    <!-- Formulario de Sign Up (Recuperar Usuario) -->
    <div class="form-container sign-up-container">
        <form id="recoverUserForm" autocomplete="off">
            <h1>Forgot User</h1> <!-- Cambié el título a "Forgot User" -->
            <input type="email" placeholder="Enter your email to recover" required> <!-- Placeholder para ingresar email -->
            <button type="submit">Recover</button>
        </form>
    </div>
    
    <!-- Formulario de Sign In (Iniciar Sesión) -->
    <div class="form-container sign-in-container">
        <form action="../php/validateLogin.php" method="post" id="signInForm" autocomplete="off">
            <h1>Sign In</h1>
            <input type="text" id="username" name="username" placeholder="Username" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button type="submit">Sign In</button>

            <!--Mensaje que indica si hubo un error para iniciar-->
            <p class="error"><?php if ($_GET) echo $_GET["msg"]; ?></p>
        </form>
    </div>

    <button id="mobileRecoverButton">I Forgot my User</button>

    <!-- Panel de Overlay -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Welcome Back</h1>
                <p>To keep connected with us please login with your personal info</p>
                <button class="ghost" id="signInButton">Sign In</button>
            </div>
            <div class="overlay-panel overlay-right">
                <h1 class="honeyTrack">Honey Track</h1>
                <p>It'll be the slogan here</p>
                <button class="ghost" id="signUpButton">I Forgot my User</button> <!-- Cambié el texto del botón -->
            </div>
        </div>
    </div>
</div>


<script src="../js/login.js"></script>
<script src="../js/access.js"></script>
<script src="../js/loading.js"></script>
</body>
</html>
<!--Si intentan entrar directo a esta página, se les enviará al login-->
<?php } else{$msg = "Unvalid user"; header("Location: ../html/login.php?msg=$msg"); } ?>
