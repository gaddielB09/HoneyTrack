<?php
    function connectdb() : mysqli{
        $host = "localhost";
        $user = "cisco";
        $password = "class";
        $database = "En_HoneyTrack";

        $db = mysqli_connect($host,$user,$password,$database);
        if(!$db){
            echo "Connection failed";
        }
        return $db;
    }
?>