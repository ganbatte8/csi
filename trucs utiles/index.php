<?php
include('includes/includes_theme/includes_up.php');


function get_lundi_dimanche_from_week($week, $year) {
  $week = sprintf('%02d',$week);
  $start = strtotime($year.'W'.$week);
  return array(
         strtotime('Monday',$start),
         strtotime('Sunday',$start)
  );
}

// différence entre 2 dates
function datediff($date1, $date2) {
  $datetime1 = new DateTime($date1);
  $datetime2 = new DateTime($date2);
  $interval = $datetime1->diff($datetime2);
  return $interval->format('%R%a') + 1;
}


  $lundi_dimanche = get_lundi_dimanche_from_week(date('W'), date('Y'));
  $dateToDay_str = date("Y-m-d");
  if(!$_POST) {
      $date1 = $dateToDay_str;
      $date2 = $dateToDay_str;
      $checked['j'] = "checked"; 
    $checked['modules'] = -1;
  }
  // V?rifications des param?tres pass?s
  if($_POST['heure1'] != "") {    
      $heure1 = $_POST['heure1'];
  } else {
      $heure1 =  "00:00";
  }
  if($_POST['heure2'] != "") {    
      $heure2 = $_POST['heure2'];
  }else {
      $heure2 =  "23:59";
  } 
  if ($_POST) {
      $date1 = $_POST['date1'];
      $date2 = $_POST['date2'];
  }

  
  
  
  // V?rification + 365J
  $diffFour = datediff($date1, $date2);
  if($diffFour > 367) {
      $error = true;
      $error_msg = "Période maximale : 1 an";
  }

  // Gestion des pr?selections J, J+1, S, S+1 etc.
  if($_POST['preselections']) {
      switch($_POST['preselections']) {
    case 'j':
        $date1 = $dateToDay_str;
        $date2 = $dateToDay_str;
        $checked['j'] = "checked"; 
    break;
    case 'j1':
        $date1 = date('Y-m-d', strtotime("-1 day")); 
        $date2 = date('Y-m-d', strtotime("-1 day"));
        $checked['j1'] = "checked"; 
    break;
      
    case 'j2':
        $date1 = date('Y-m-d',strtotime("-2 day"));
        $date2 = date('Y-m-d',strtotime("-2 day"));
        $checked['j2'] = "checked"; 
    break;
      
    case 's':
        $date1 = date('Y-m-d', $lundi_dimanche[0]);
        $date2 = $dateToDay_str;
        $checked['s'] = "checked"; 
    break;
      
    case 's1':
        $date1 = date("Y-m-d", strtotime("-7 day", strtotime(date('Y-m-d', $lundi_dimanche[0]))));
        $date2 = date("Y-m-d", strtotime("-7 day", strtotime(date('Y-m-d', $lundi_dimanche[1]))));
        $checked['s1'] = "checked"; 
    break;
      
    case 's2':
        $date1 = date("Y-m-d", strtotime("-14 day", strtotime(date('Y-m-d', $lundi_dimanche[0]))));
        $date2 = date("Y-m-d", strtotime("-14 day", strtotime(date('Y-m-d', $lundi_dimanche[1]))));
        $checked['s2'] = "checked"; 
    break;
      
    case 's3':
        $date1 = date("Y-m-d", strtotime("-21 day", strtotime(date('Y-m-d', $lundi_dimanche[0]))));
        $date2 = date("Y-m-d", strtotime("-21 day", strtotime(date('Y-m-d', $lundi_dimanche[1]))));
        $checked['s3'] = "checked"; 
    break;
      
    case 's4':
        $date1 = date("Y-m-d", strtotime("-28 day", strtotime(date('Y-m-d', $lundi_dimanche[0]))));
        $date2 = date("Y-m-d", strtotime("-28 day", strtotime(date('Y-m-d', $lundi_dimanche[1]))));
        $checked['s4'] = "checked"; 
    break;
      
    case 'm':
        $date1 = date('Y-m') . '-01';
        $date2 = $dateToDay_str;
        $checked['m'] = "checked"; 
    break;
      
    case 'm1':
        $m = date('m');
        $m--;
        $m = sprintf('%02d', $m);
        $date1 = date('Y-') . $m . '-01';
        $mois = mktime(0,0,0, $m, 1, date('Y'));
        $date2 = date('Y-') . $m . '-' . intval(date("t",$mois));
        $checked['m1'] = "checked";
    break;
      
    case 'm2':
        $m = date('m');
        $m--;
        $m--;
        $m = sprintf('%02d',$m);
        $date1 = date('Y-') . $m . '-01';
        $mois = mktime(0,0,0, $m, 1, date('Y'));
        $date2 = date('Y-') . $m . '-' . intval(date("t",$mois));
        $checked['m2'] = "checked";
    break;
      
    case 'a':
        $date1 = date('Y').'-01-01';
        $date2 = $dateToDay_str;
        $checked['a'] = "checked"; 
    break;
   
      }
  }

  if(!$error) {
      $date1_forSQL = $date1 . " ". $heure1 .":00";
      $date2_forSQL = $date2 . " ". $heure2 .":59";
  }
    

$query = "    SELECT  id_demande_de_derogation, date_demande_de_derogation,date_debut_demande_de_derogation,
                      date_fin_demande_de_derogation , montant_remuneration_demande_de_derogation , 
                      id_type_etat_validation, nom_etat, nom_type_activite_excep, personne_id_personne, nom_personne, prenom_personne
              FROM demande_de_derogation 
              INNER JOIN type_etat_validation ON demande_de_derogation.type_etat_validation_id_type_etat_validation = type_etat_validation.id_type_etat_validation
              INNER JOIN personne ON demande_de_derogation.personne_qui_demande_id_personne = personne.id_personne
              INNER JOIN type_activite_excep ON demande_de_derogation.type_activite_excep_id_type_activite_excep = type_activite_excep.id_type_activite_excep
              WHERE date_demande_de_derogation BETWEEN '$date1_forSQL' AND '$date2_forSQL'";
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while($data_demandes_derogations[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_demandes_derogations);

?>

<div id="content-wrapper">

  <div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Dashboard</a>
      </li>
      <li class="breadcrumb-item active">Affichage des demandes de dérogation</li>
    </ol>

    <!-- Page Content -->
    <h1>Liste des demandes</h1>
    <hr>
    <p>Vous pouvez sélectionner des dates pour afiner votre recherche.</p>



    <div class="row" style="width: 1000px; margin: auto;">
      <center>
        <form method="POST">
          <div class="row">
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="j"><input type="radio" name="preselections" value="j" id="j" onClick="this.form.submit();" <?=$checked['j']?>>Aujourd'hui</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="j1"><input type="radio" name="preselections" value="j1" id="j1" onClick="this.form.submit();" <?=$checked['j1']?>>Hier</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="j2"><input type="radio" name="preselections" value="j2" id="j2" onClick="this.form.submit();" <?=$checked['j2']?>>Avant hier</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="s"><input type="radio" name="preselections" value="s" id="s" onClick="this.form.submit();" <?=$checked['s']?>>Cette semaine</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="s1"><input type="radio" name="preselections" value="s1" id="s1" onClick="this.form.submit();" <?=$checked['s1']?>>Semaine dernière</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="s2"><input type="radio" name="preselections" value="s2" id="s2" onClick="this.form.submit();" <?=$checked['s2']?>>S-2</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="s3"><input type="radio" name="preselections" value="s3" id="s3" onClick="this.form.submit();" <?=$checked['s3']?>>S-3</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="s4"><input type="radio" name="preselections" value="s4" id="s4" onClick="this.form.submit();" <?=$checked['s4']?>>S-4</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="m"><input type="radio" name="preselections" value="m" id="m" onClick="this.form.submit();" <?=$checked['m']?>>Mois en cours</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="m1"><input type="radio" name="preselections" value="m1" id="m1" onClick="this.form.submit();" <?=$checked['m1']?>>M-1</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="m2"><input type="radio" name="preselections" value="m2" id="m2" onClick="this.form.submit();" <?=$checked['m2']?>>M-2</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="a"><input type="radio" name="preselections" value="a" id="a" onClick="this.form.submit();" <?=$checked['a']?>>Cette Année</label>
            </div>

          </div>
          <div class="row">

            <center>

              <input onchange="javascript:clearradio()" type="date" name="date1" id="date1" value="<?=$date1?>"/>
              <input onchange="javascript:clearradio()" type="time" name="heure1" value="<?=$heure1?>"/>
              <input onchange="javascript:clearradio()" type="date" name="date2" id="date2" value="<?=$date2?>"/>
              <input onchange="javascript:clearradio()" type="time" name="heure2" value="<?=$heure2?>"/>
              <input onClick="javascript:clearradio()" type="submit"/>
              <script>
                function clearradio() {
                  document.getElementById("j").checked = false;
                  document.getElementById("j1").checked = false;
                  document.getElementById("j2").checked = false;
                  document.getElementById("s").checked = false;
                  document.getElementById("s1").checked = false;
                  document.getElementById("s2").checked = false;
                  document.getElementById("s3").checked = false;
                  document.getElementById("s4").checked = false;
                  document.getElementById("m").checked = false;
                  document.getElementById("m1").checked = false;
                  document.getElementById("m2").checked = false;
                  document.getElementById("a").checked = false;

                }
              </script></center>
            </div>
          </form>   
        </center>


      </div>



      <!-- DataTables Example -->
      <div class="card mb-3">
        <div class="card-header">
          <i class="fas fa-table"></i>
        Demandes de dérogation</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Numéro de dérogation</th>
                  <th>Type d'activité</th>
                  <th>Date de demande</th>
                  <th>Date de début d'activité</th>
                  <th>Date de fin d'activité</th>
                  <th>Montant de rénumération</th>
                  <th>Personne</th>
                  <th>Etat</th>
                  <th style="width: 200px;">Action</th>
                </tr>
              </thead>
              <tbody>

                <?php
                if ($data_demandes_derogations) {
                  foreach($data_demandes_derogations as $demande)
                    { ?>  

                      <tr>
                        <td><?=$demande[id_demande_de_derogation]?></td>
                        <td><?=$demande[nom_type_activite_excep]?></td>
                        <td><?=$demande[date_demande_de_derogation]?></td>
                        <td><?=$demande[date_debut_demande_de_derogation]?></td>
                        <td><?=$demande[date_fin_demande_de_derogation]?></td>
                        <td><?=$demande[montant_remuneration_demande_de_derogation]?></td>
                        <td><?=$demande[nom_personne]?> <?=$demande[prenom_personne]?></td>
                        <td><?=$demande[nom_etat]?></td>
                        <td>
                          <a href="/historique_demande.php?id_demande=<?=$demande['id_demande_de_derogation']?>"><button class="btn btn-info" title="Historique">Historique</button></a>
                        </td>
                      </tr>

                      <?php
                    }
                  }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>















      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Projet universitaire L3 MIASHS - MIAGE : Conception de Systèmes d'Information 2020</span>
          </div>
        </div>
      </footer>
    </div>
    <!-- /.content-wrapper -->

    <?php
    include('includes/includes_theme/includes_down.php');
    ?>

      <!-- Page level plugin JavaScript-->
  <script src="/includes/vendor/datatables/jquery.dataTables.js"></script>
  <script src="/includes/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Demo scripts for this page-->
  <script src="/includes/js/demo/datatables-demo.js"></script>