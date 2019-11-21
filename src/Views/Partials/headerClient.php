<?php
include '../Models/models.php';
include '../Running/generalFunction.php';
$session = new Session();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="http://<?= $_SERVER['HTTP_HOST']; ?>/Assets/CSS/cycStyles.css">
    <link rel="stylesheet" href="http://<?= $_SERVER['HTTP_HOST']; ?>/Assets/CSS/general.css">
    <link rel="stylesheet" href="http://<?= $_SERVER['HTTP_HOST']; ?>/Assets/CSS/fidestore.css">
    <title>FideStore</title>
</head>

<body class="body">
    <nav class="nav text-white">
        <a href="http://<?= $_SERVER['HTTP_HOST']; ?>" class="nav-title">FideStore</a>
        <ul class="nav-list">
            <li class="nav-item"><a href="#" class="text-white">Productos</a></li>
            <li class="nav-item"><a href="http://<?= $_SERVER['HTTP_HOST']; ?>/Views/acerca.php" class="text-white">Acerca</a></li>
            <li class="nav-item nav-item-cart"><a href="#" class="text-white">Carrito</a></li>
            <li class="nav-item"><a href="
            <?php
            if (empty($_SESSION['user'])) {
                echo 'http://' . $_SERVER['HTTP_HOST'] . '/Views/login.php';
            } else {
                echo isAccepted($session->getUser(), $session->getPassword()) ? 'http://' . $_SERVER['HTTPS_HOST'] . '/Views/micuenta.php' : 'http://' . $_SERVER['HTTPS_HOST'] . '/Views/login.php';
            } ?>" class="text-white">
                    <?php
                    if (empty($_SESSION['user'])) {
                        echo 'Inciar sesion';
                    } else {
                        echo isAccepted($session->getUser(), $session->getPassword()) ? 'Mi cuenta' : 'Iniciar sesion';
                    } ?></a></li>
        </ul>
        <div class="btn-action">
        </div>
    </nav>