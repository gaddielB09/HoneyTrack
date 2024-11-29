<?php session_start(); $_SESSION["user"]=""; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Project</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/loading.css">
    <link rel="stylesheet" href="js/loading.js">
    <link rel="stylesheet" href="css/colors.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/toast.css">
</head>
<body>
    <div id="loadingScreen">
        <h1 class="loadingText">Loading</h1>
    </div>

    <div class="container" id="container">    

    <div class="form-container sign-in-container">
        <form action="php/validateLogin.php" method="post" id="signInForm" autocomplete="off">
            <h1>Sign In</h1>
            <input type="text" id="username" name="username" placeholder="Username" style="margin-bottom: 20px;" required>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <button style="margin-top: 20px;" type="submit">Sign In</button>

        </form>
    </div>


    <!-- Panel de Overlay -->
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-right">
                <img src="images/HoneyTrackicon.svg" alt="HONEY TRACK" width="500">
            </div>
        </div>
    </div>
</div>
<!-- Toast Container -->
<div id="toast-container" class="toast-container position-fixed top-0 start-50 translate-middle-x p-3">    <!-- Toast -->
    <div id="loginToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <strong class="me-auto">Login Success</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            ¡Has iniciado sesión exitosamente!
        </div>
    </div>
</div>


<script src="js/login.js"></script>
<script src="js/loading.js"></script>
</body>
</html>
