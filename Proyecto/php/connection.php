<?php
    function connectdb() : mysqli{
        $db = mysqli_connect("localhost", "root", "", "HoneyTrack");
        if($db){
            echo "Connected";
        }
        else{
            echo "Connection failed";
        }
        return $db;
    }
?>