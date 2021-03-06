<?php
//Connexion à la BDD
$dbconn = pg_connect("host=localhost dbname=projet user=postgres password='Miage123'")
  or die('Connexion impossible : ' . pg_last_error());

//S'il y a une demande de connexion (formulaire)
if ($_POST) {

  // SEL pour le mot de passe
  $sel = "EiHqBPuoTCW0BszhQamuxOwsBIDO6ZZUSeR5WhhqKxQKUFMrUgQAXYc2STrlkF9dSTleOMLTFSX2bgoty9JALP0rC5uoaiz7HUm4cPNN63NLfMPmhhvww1STBWAZ1ASTUJK2kRe9mLX9udguDx3Bt4bzN9jatM5o";
  $pwdSel = $_POST['mdp'] . $sel; // Concaténation du mot de passe
  $mdp = hash('sha512', $pwdSel); // HASH

  // On va chercher dans la BDD l'utilisateur
  $query = "SELECT * FROM utilisateur WHERE mail = '$_POST[adresseEmail]' AND motdp = '$mdp'";
  $result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());

  // on recupere le resultat de la requete dans un tableau associatif. 
  // La fonction array_pop permet de supprimer le dernier element insere, lie a l'affectation qui a interrompu la boucle while. 
  while ($data_user[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); 
  array_pop($data_user); 

  $verif = count($data_user); // nombre de lignes obtenues

  if ($verif == 0) { 
?>
    <div class="alert alert-warning">
      Impossible de trouver un compte avec les identifiants que vous avez donnés. Merci de réessayer.
    </div>
<?php
  } else { 

    session_start(); // On démarre le système de session PHP

    print_r($data_user);
    // On enregistre les données de l'utilisateur dans la variables $_SESSION
    $_SESSION['iduser'] = $data_user[0]['iduser'];
    $_SESSION['nom'] = $data_user[0]['nom'];
    $_SESSION['prenom'] = $data_user[0]['prenom'];
    $_SESSION['mail'] = $data_user[0]['mail'];
    $_SESSION['metier'] = $data_user[0]['metier'];
    $_SESSION['idhp'] = $data_user[0]['idhp'];

    header('Location: /index.php'); // On redirige l'utilisateur sur la page d'accueil.
  }
}

?>



<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Projet CSI - Connexion</title>

  <!-- Custom fonts for this template-->
  <link href="includes/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="includes/css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Connexion</div>
      <div class="card-body" style="margin-bottom: 13px">
        <form method="post" action="/connexion.php">
          <div class="form-group">
            <div class="form-label-group">
              <input name="adresseEmail" type="email" id="inputEmail" class="form-control" placeholder="Votre adresse e-mail" required="required" autofocus="autofocus">
              <label for="inputEmail">Adresse E-mail</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input name="mdp" type="password" id="inputPassword" class="form-control" placeholder="Mot de passe" required="required">
              <label for="inputPassword">Mot de passe</label>
            </div>
          </div>
          <button style="height: 40px;" type="submit" class="btn btn-primary btn-block" href="/connexion.php">Connexion</a>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="inscription.php">Inscription</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="includes/vendor/jquery/jquery.min.js"></script>
  <script src="includes/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="includes/vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>