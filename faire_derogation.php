<?php
include('includes/includes_theme/includes_up.php');


// Partie SQL pour le contenu du formulaire (Liste des activités exceptionnelles)
//          Exécution de la requête SQL
$query = 'SELECT * FROM type_activite_excep';
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while($data_AciviteExcep[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_AciviteExcep);
?>



<div id="content-wrapper">

  <div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Dérogations</a>
      </li>
      <li class="breadcrumb-item active">Faire une demande de dérogation pour une activité exceptionnelle</li>
    </ol>




<?php
// Si l'utilisateur a fait une demande de dérogation 
if ($_POST) {
  // Si le type d'activité n'a pas été sélectionné
  if ($_POST['InputAciviteExcep'] == "NULL") {
    ?>
    <div class="alert alert-warning">
      <strong>Impossible !</strong> Merci de sélectionner une activité valide
    </div>
    <?php
  } else {

    // Gestion des dates
    $d = str_replace('-', ',', $_POST['InputDateDebut']); // Préparation au nouveau format - par ,
    $t = str_replace(':', ',', $_POST['InputHeureDebut']);// Préparation au nouveau format : par ,
    $date = $t.',0,'.$d; // On réuni la date et le l'heure avec un 0 pour les secondes
    $fulldate = explode(',',$date); // on sépare les valeurs dans un tableau
    // On récupere chaque valeur
    $h = $fulldate[0];
    $i = $fulldate[1];
    $s = $fulldate[2];
    $m = $fulldate[4];
    $d =$fulldate[5];
    $y = $fulldate[3];
    $date_debut = mktime($h,$i,$s,$m,$d,$y); // on forme la date et heure

    // on refait les mêmes manipulation pour la date de fin
    $d = str_replace('-', ',', $_POST['InputDateFin']);
    $t = str_replace(':', ',', $_POST['InputHeureFin']);
    $date = $t.',0,'.$d;
    $fulldate = explode(',',$date);
    $h = $fulldate[0];
    $i = $fulldate[1];
    $s = $fulldate[2];
    $m = $fulldate[4];
    $d =$fulldate[5];
    $y = $fulldate[3];
    $date_fin = mktime($h,$i,$s,$m,$d,$y);

    $diff = $date_fin - $date_debut; // on calcule la différence entre les deux date (en s)
    $reste = ($diff%86400);
    $Nombre_heure_diff = floor($diff/60/60); // nombre d'heures
    $Nombre_minutes_diff =  floor($reste%3600); // nombre de minutes

    // on cherche l'index du tableau type d'activité
    $i = 0;
    while ($data_AciviteExcep[$i]['id_type_activite_excep'] != $_POST['InputAciviteExcep']) {
      $i = $i +1;
    }

    if ($date_debut < time()) { // Si les dates sont antérieures
      ?>
      <div class="alert alert-warning">
        <strong>Impossible !</strong> Les dates que vous avez données sont déjà passé !
      </div>
      <?php
    } else {
      //Si l'activité est trop longue
      if ($Nombre_heure_diff > $data_AciviteExcep[$i]['duree_max_type_activite_excep'] || ($Nombre_heure_diff == $data_AciviteExcep[$i]['duree_max_type_activite_excep'] && $Nombre_minutes_diff != 0) ) {
        ?>
        <div class="alert alert-warning">
          <strong>Impossible !</strong> Merci de verifier les dates ! Votre activité est trop longue. (le type d'activité que vous avez sélectionnez doit avoir maximun <?=$data_AciviteExcep[$i]['duree_max_type_activite_excep']?> heures et minimum <?=$data_AciviteExcep[$i]['duree_min_type_activite_excep']?> heures !)
        </div>
        <?php
      } else {
        // SI l'activité est trop courte
        if ($Nombre_heure_diff < $data_AciviteExcep[$i]['duree_min_type_activite_excep']) {
          ?>
          <div class="alert alert-warning">
            <strong>Impossible !</strong> Merci de verifier les dates ! Votre activité est trop courte. (le type d'activité que vous avez sélectionnez doit avoir maximun <?=$data_AciviteExcep[$i]['duree_max_type_activite_excep']?> heures et minimum <?=$data_AciviteExcep[$i]['duree_min_type_activite_excep']?> heures !)
          </div>
          <?php
        } else { // Si tout est bon


          $now = date('Y-m-d H:i:s', time());
          $dd = date('Y-m-d H:i:s', $date_debut);
          $df = date('Y-m-d H:i:s', $date_fin);

          // On ajout la demande dans la BDD
          $query = "INSERT INTO demande_de_derogation (date_demande_de_derogation,date_debut_demande_de_derogation,date_fin_demande_de_derogation , montant_remuneration_demande_de_derogation, personne_qui_demande_id_personne , type_activite_excep_id_type_activite_excep , type_etat_validation_id_type_etat_validation) 
          VALUES('$now','$dd','$df','$_POST[InputRenumeration]','$_SESSION[id_personne]','$_POST[InputAciviteExcep]','1')";
          if (pg_query($dbconn,$query))
          {
            ?>
            <div class="alert alert-success">
              Merci ! Votre demande de dérogation a bien été enregistrée. Vous pouvez suivre l'étude de validation <a href="/derogation_user.php">ici</a>
            </div>
            <?php
          }
          else
          {
            ?>
            <div class="alert alert-warning">
              Impossible d'ajouter votre demande car vous avez passé votre quota pour ce type d'activité.
            </div>
            <?php
          }


        }
      }

    }


  }
}

?>

    <!-- Page Content -->
    <h1>Formulaire de demande</h1>
    <hr>
    <p>Merci de remplir les champs ci-dessous pour complèter votre demande</p>


    <form method="post" action="/faire_derogation.php">

      <div class="form-group">
        <label for="InputAciviteExcep">Activité exceptionnelle</label>
        <select name="InputAciviteExcep" class="form-control" id="InputAciviteExcep" required>
          <option value="NULL"> -- Merci de sélectionner une activité --</option>
          <?php
          if ($data_AciviteExcep) {
            foreach($data_AciviteExcep as $AciviteExcep)
              { ?>  
                <option value="<?=$AciviteExcep['id_type_activite_excep']?>"><?=$AciviteExcep['nom_type_activite_excep']?></option>
                <?php
              }
            }
            ?>
          </select>
        </div>

        <div class="form-group">
          <label for="InputDateDebut">Date de début de l'activité</label>
          <input type="date" min="<?=date("Y-m-d")?>" class="form-control" id="InputDateDebut" name="InputDateDebut" required>
        </div>
        <div class="form-group">
          <label for="InputHeureDebut">Heure de début de l'activité</label>
          <input type="time" class="form-control" id="InputHeureDebut" name="InputHeureDebut" required>
        </div>


        <div class="form-group">
          <label for="InputDateFin">Date de fin de l'activité</label>
          <input type="date" min="<?=date("Y-m-d")?>" class="form-control" id="InputDateFin" name="InputDateFin" required>
        </div>
        <div class="form-group">
          <label for="InputHeureFin">Heure de fin de l'activité</label>
          <input type="time" class="form-control" id="InputHeureFin" name="InputHeureFin" required>
        </div>
        
        <div class="form-group">
          <label for="InputRenumeration">Rémunération (Facultatif) en €</label>
          <input type="number" value="0" class="form-control" id="InputRenumeration" name="InputRenumeration" >
        </div>


        <center><button class="btn btn-info" type="submit" style="float: ">Validation</button></center>
      </form>

    </div>
    <!-- /.container-fluid -->

    <!-- Sticky Footer -->
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
  include('includes/includes_theme/includes_down.php');
  ?>