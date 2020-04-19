<?php
session_start(); // On démarre le système de session PHP

// Suppression des variables de session et de la session
$_SESSION = array();

session_destroy(); // Fin du système de session PHP

header('Location: /connexion.php'); // Redirection vers la page connexion.php
?>