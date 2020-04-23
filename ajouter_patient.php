<?php

include('includes/includes_theme/includes_up.php'); 
// initialise $dbconn et $result. Il faudra ensuite inclure includes_down.php

if ($_SESSION['metier'] != 0) {
    header('Location: /erreur.php');
}


$query = "";
if (isset($_POST['sendfeedback'])){
    //, $_POST['prenom'],$_POST['nom'], $_POST['datenaissance'], $_POST['genre'], $_POST['numtelephone'], $_POST['adressep'], $_POST['email']
    echo "helloooooooooooooooo";
    echo $_POST['numss'];
    echo $_POST['prenom'];
    echo $_POST['nom'];
    echo $_POST['datenaissance'];
    echo $_POST['genre'];
    echo $_POST['numtelephone'];
    echo $_POST['adressep'];
    echo $_POST['email'];
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
        <input type="text" class="form-control" id="numéross" name="numss" placeholder="0123456789123">
    </div>
    <div class="form-group ">
        <label for="numeross">Date de naissance</label>
        <input type="text" class="form-control" id="numéross" name="datenaissance" placeholder="2020-02-14">
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
    <button type="submit" name= "sendfeedback" class="btn btn-primary">Ajout patient</button>


</form>



<!-- Footer -->

<footer class="">
    <div class="container my-auto position">
        <div class="copyright text-center my-auto">
            <span>Copyright © Projet universitaire L3 MIASHS - MIAGE : Conception de Systèmes d'Information 2020</span>
        </div>
    </div>
</footer>
<!-- /.content-wrapper -->

<?php
// free $result et $dbconn definis dans init.php. init.php est inclus dans includes_up.php
include('includes/includes_theme/includes_down.php'); 
?>

<!-- Page level plugin JavaScript-->
<script src="/includes/vendor/datatables/jquery.dataTables.js"></script>
<script src="/includes/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Demo scripts for this page-->
<script src="/includes/js/demo/datatables-demo.js"></script>