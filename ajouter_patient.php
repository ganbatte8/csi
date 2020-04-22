<?php
//Connexion à la BDD
$dbconn = pg_connect("host=localhost dbname=projet user=postgres password='Miage123'")
    or die('Connexion impossible : ' . pg_last_error());



include('includes/includes_theme/includes_up.php');
if ($_SESSION['metier'] != 0) {
    header('Location: /erreur.php');
}


// $query = "SELECT * FROM patient;";
// $result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());

$query = "";
if (isset($_POST['InputPatient'])) {
    $query =  "INSERT INTO patient(numss, prenom, nom, etatsante, etatsurveillance, datenaissance, genre, numtelephone, adressep, email)
      VALUES ('$_POST[numss]','$_POST[prenom]','$_POST[nom]','aucun symptôme','quarantaine', '$_POST[datenaissance]', '$_POST[genre]', 
      '$_POST[numtelephone]', '$_POST[adressep]', '$_POST[email]');";
    // Prépare une requête pour l'exécution
    $result = pg_prepare($dbconn, "my_query", $query);
    header('Location: listepatients.php');
   
    $result = pg_execute($dbconn, "my_query");

}




?>



<form>
    <div class="form-group">
        <label for="inputState">Genre</label>
        <select id="inputState" class="form-control">
            <option selected>Choisissez le genre</option>
            <option>Homme</option>
            <option>Femme</option>
            <option>Autre</option>
        </select>
    </div>
    <div class="form-group">
        <label for="nom">Nom</label>
        <input type="text" class="form-control" id="nom" name="nom" placeholder="Dujardin">
    </div>
    <div class="form-group">
        <label for="prenom">Prénom</label>
        <input type="text" class="form-control" id="prenom" name="prenom" placeholder="Jean">
    </div>
    <div class="form-group ">
        <label for="numeross">Numéro de sécurité social</label>
        <input type="text" class="form-control" id="numéross" name="nummss" placeholder="0123456789123">
    </div>
    <div class="form-group ">
        <label for="numeross">Date de naissance</label>
        <input type="text" class="form-control" id="numéross" name="datenaissance" placeholder="0123456789123">
    </div>
    <div class="form-group">
        <label for="numtel">Numéro de téléphone</label>
        <input type="text" class="form-control" id="numtel" name="numtelephone" placeholder="0647789856">
    </div>
    <div class="form-group col-md12">
        <label for="adresse">Adresse</label>
        <input type="text" class="form-control" id="adresse" name="adressep" placeholder="102 Rue du Verger Nancy">
    </div>
    <div class="form-group col-md6">
        <label for="email">Adresse mail</label>
        <input type="text" class="form-control" id="email" name="email" placeholder="truc@gmail.com">
    </div>
    <button type="submit" class="btn btn-primary">Ajout patient</button>


</form>



<!-- Sticky Footer -->
<!--
<footer class="sticky-footer">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright © Projet universitaire L3 MIASHS - MIAGE : Conception de Systèmes d'Information 2019</span>
        </div>
    </div>
</footer>
</div> -->
<!-- /.content-wrapper -->

<?php
include('includes/includes_theme/includes_down.php');
?>

<!-- Page level plugin JavaScript-->
<script src="/includes/vendor/datatables/jquery.dataTables.js"></script>
<script src="/includes/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Demo scripts for this page-->
<script src="/includes/js/demo/datatables-demo.js"></script>