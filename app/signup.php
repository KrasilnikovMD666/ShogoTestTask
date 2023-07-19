<?php
    session_start();
    require_once("connect.php");

    $login = $_POST['login'];
    $password = $_POST['password'];

    $sql = mysqli_query($connect, "SELECT * FROM `accounts` WHERE `login` = '$login' AND `password` = '$password'");
    $sql = mysqli_fetch_all($sql);
    if($sql != null)
    {
        $_SESSION['username'] = 'admin';
        header('Location: ../index.php');
    }
    else {
        header('Location: auth.php');
        echo 'Неверное имя пользователя или пароль';
    }


?>