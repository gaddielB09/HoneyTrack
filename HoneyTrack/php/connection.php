<?php
    function connectdb() : mysqli{
        $host = "localhost";
        $user = "root";
        $password = "";
        $database = "HoneyTrack";

        $db = mysqli_connect($host,$user,$password,$database);
        if(!$db){
            echo "Connection failed";
        }
        return $db;
    }
?>