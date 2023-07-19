<?php
    require_once("../index.php");
    require_once("connect.php");
    session_destroy();
    header('Location: ../index.php');
?>
