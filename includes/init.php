<?php
// Connexion, sélection de la base de données
$dbconn = pg_connect("host=localhost dbname=projet user=postgres password='Miage123'")
    or die('Connexion impossible : ' . pg_last_error());
$result = "";
session_start(); // On démarre le système de session PHP


// Si l'utilisateur n'est pas connecté, il doit être redirigé vers la page de connexion
if (!isset($_SESSION['iduser'])) {
		header('Location: /connexion.php');
}
?> 