<?php

include('includes/includes_theme/includes_up.php');
// initialise $dbconn et $result. Il faudra ensuite inclure includes_down.php

if ($_SESSION['metier'] != 0) {
    header('Location: /erreur.php');
}

//ajouter liste des département dans la la liste de choix
$query = 'SELECT * FROM departement';
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while ($data_Departement[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($data_Departement);




$query = "";

if (isset($_POST['sendfeedback'], $_POST['prenom'], $_POST['nom'], $_POST['datenaissance'], $_POST['genre'], $_POST['numtelephone'], $_POST['adressep'], $_POST['email'], $_POST['iddep'])) {
    echo "bonjour";
    echo $_POST['iddep'];
    if ($_POST['genre'] == 'Homme') {
        $_POST['genre'] = 'H';
    } elseif ($_POST['genre'] == 'Femme') {
        $_POST['genre'] = 'F';
    } elseif ($_POST['genre'] == 'Autre') {
        $_POST['genre'] = 'A';
    }
    $query =  "INSERT INTO patient(numss, prenom, nom, etatsante, etatsurveillance, datenaissance, genre, numtelephone, adressep, email, iddep) VALUES ( {$_POST['numss']}, '{$_POST['prenom']}', '{$_POST['nom']}', 'aucun symptôme','quarantaine', '{$_POST['datenaissance']}', '{$_POST['genre']}', {$_POST['numtelephone']}, '{$_POST['adressep']}', '{$_POST['email']}','{$_POST['iddep']}');";

    if (pg_query($dbconn, $query)) {
        header('Location: /listepatients.php');
    }
}




?>
<div id="content-wrapper">
<div class="container-fluid">

<h1>Ajouter un patient</h1>
    <hr>


<form action="/ajouter_patient.php" method="post">
    <div class="form-group">
        <label for="genre">Genre</label>
        <select id="genre" class="form-control" name="genre">
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
        <label for="numss">Numéro de sécurité social</label>
        <input type="text" class="form-control" id="numss" name="numss" placeholder="0123456789123">
    </div>
    <div class="form-group ">
        <label for="datenaissance">Date de naissance</label>
        <input type="text" class="form-control" id="datenaissance" name="datenaissance" placeholder="2020-02-14">
    </div>
    <div class="form-group">
        <label for="numtel">Numéro de téléphone</label>
        <input type="text" class="form-control" id="numtel" name="numtelephone" placeholder="0647789856">
    </div>
    <div class="form-group col-md12">
        <label for="adressep">Adresse</label>
        <input type="text" class="form-control" id="adressep" name="adressep" placeholder="102 Rue du Verger Nancy">
    </div>
    <div class="form-group col-md6">
        <label for="email">Adresse mail</label>
        <input type="text" class="form-control" id="email" name="email" placeholder="truc@gmail.com">
    </div>
    <div class="form-group">
        <label for="iddep">Numéro du Département</label>
        <select id="iddep" name="iddep" class="form-control">
            <?php
            // query SQL pour recuperer la liste des departements dans la base
            $query_result = pg_query($dbconn, "SELECT iddep, nomDep FROM departement;");
            // echo out options :
            while ($row = pg_fetch_row($query_result)) {
                echo "<option value=" . $row[0] . ">" . $row[1] . "</option>";
            }
            ?>

        </select>
    </div>
    <center><button type="submit" id="sendfeedback" name="sendfeedback" class="btn btn-primary">Ajout patient</button></center>

    <br>
    <br><br><br><br>

</form>

</div>
<!-- /.container-fluid -->



<!-- Footer -->

<footer class="sticky-footer">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright © Projet universitaire L3 MIASHS - MIAGE : Conception de Systèmes d'Information 2019</span>
        </div>
    </div>
</footer>


</div>
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