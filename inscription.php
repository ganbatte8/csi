<?php
$dbconn = pg_connect("host=localhost dbname=projet user=postgres password='Miage123'")
or die('Connexion impossible : ' . pg_last_error());

if (isset($_POST['MdP'])) {
//Vérification mot de passe
if ($_POST['MdP'] != $_POST['confirmerMdP']) { 
	?>
  <div class="alert alert-warning">
    Les mots de passe saisis ne sont pas identiques ! 
  </div>
  <?php
} else {


  $sel = "EiHqBPuoTCW0BszhQamuxOwsBIDO6ZZUSeR5WhhqKxQKUFMrUgQAXYc2STrlkF9dSTleOMLTFSX2bgoty9JALP0rC5uoaiz7HUm4cPNN63NLfMPmhhvww1STBWAZ1ASTUJK2kRe9mLX9udguDx3Bt4bzN9jatM5o";

  $pwdSel = $_POST['MdP'] . $sel;// Concaténation du mot de passe

  $mdp = hash('sha512', $pwdSel); // HASH
  

  $query = "";
  if(isset($_POST['InputHopital'])){
      $query =  "INSERT INTO utilisateur (nom, prenom, mail, metier, motdp, idhp) 
      VALUES ('$_POST[NomDeFamille]','$_POST[Prenom]','$_POST[Email]','$_POST[InputMetier]','$mdp', '$_POST[InputHopital]');";    
  } else{
    $query =  "INSERT INTO utilisateur (nom, prenom, mail, metier, motdp) 
    VALUES ('$_POST[NomDeFamille]','$_POST[Prenom]','$_POST[Email]','$_POST[InputMetier]','$mdp');";
  }
  
  
  
  if(pg_query($dbconn,$query)) {
    header('Location: /connexion.php');
  }

}
}


$query = 'SELECT * FROM hopital';
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while($data_Hopital[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_Hopital);
?>



<!DOCTYPE html>
<html lang="fr">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Inscription</title>

  <!-- Custom fonts for this template-->
  <link href="includes/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="includes/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">Enregistrer un compte</div>
      <div class="card-body" style="margin-bottom: 1px">
        <form method="post" action="/inscription.php">
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input name="Prenom" type="text" id="prenomUtilisateur" class="form-control" placeholder="Prénom" required="required" autofocus="autofocus">
                  <label for="prenomUtilisateur">Prénom</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input name="NomDeFamille" type="text" id="NomDeFamille" class="form-control" placeholder="Nom de famille" required="required">
                  <label for="NomDeFamille">Nom de famille</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
               <select name="InputMetier" class="form-control" id="InputMetier" required style="height: 52px;" required="required">
                 <option value=-1> -- Merci de sélectionner --</option>
                 <option value=0>Médecin</option>
                 <option value=1>Représentant Nationaux/Départementaux</option>
                 <?php 
                 
                 
                 /*
                 foreach($data_TypePers as $TypePers)
                  { ?>
                    <option value="<?=$TypePers['id_type_personne']?>"><?=$TypePers['nom_type_personne']?></option>
                    <?php
                  }

                 */ ?>
                </select>

              </div>
              <div class="col-md-6">
               <select name="InputHopital" class="form-control" id="InputHopital" required style="height: 52px;" required="required">
                 <option value=-1> -- Merci de sélectionner --</option>
                 <?php 
                 
                 
                 
                 foreach($data_Hopital as $Hopital)
                  { ?>
                    <option value="<?=$Hopital['idhp']?>"><?=$Hopital['nom']?> <?=$Hopital['adresseh']?></option>
                    <?php
                  }

                  ?>
                </select>

              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input name="Email" type="email" id="inputEmail" class="form-control" placeholder="Adresse e-mail" required="required">
              <label for="inputEmail">Adresse e-mail</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input name="MdP" type="password" id="inputMdp" class="form-control" placeholder="Mot de passe" required="required">
                  <label for="inputMdp">Mot de passe</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input name="confirmerMdP" type="password" id="confirmerMdP" class="form-control" placeholder="Confirmer mot de passe" required="required">
                  <label for="confirmerMdP">Confirmer mot de passe</label>
                </div>
              </div>
            </div>
          </div>

          <button style="height: 40px;" type="submit" class="btn btn-primary btn-block" href="/connexion.php">S'enregistrer</a>
          </form>
          <div class="text-center">
            <a class="d-block small mt-3" href="connexion.php">Page de connexion</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="includes/vendor/jquery/jquery.min.js"></script>
    <script src="includes/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript"> 
      $(function() {
          $('#InputMetier').on('change', function(e) {
              select_val = $(this).val();
              if(select_val == 0) {
                $('#InputHopital').removeAttr("disabled");
              } else {
                $('#InputHopital').prop('disabled', 'disabled');
              };
          });
      });
    </script>

    <!-- Core plugin JavaScript-->
    <script src="includes/vendor/jquery-easing/jquery.easing.min.js"></script>

    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  </body>

  </html>
