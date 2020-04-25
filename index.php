<?php
include('includes/includes_theme/includes_up.php'); // initialise $dbconn et $result. appeler includes_down.php apres


// $query2 : pour obtenir l'iddep du medecin connecte
/*$query2 = "SELECT iddep FROM hopital WHERE idhp = " . $_SESSION['idhp'] . ";";
$result = pg_query($query2) or die('Échec de la requête : ' . pg_last_error());
while ($iddep[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($iddep);*/

$query = "SELECT * FROM patient;";
$checked['all'] = "checked";
$checked['dep'] = "";
$checked['hop'] = "";


$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while ($data[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($data);


$query = "SELECT testcontamination FROM hospitalisation;";
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while ($test[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($test);

if (!isset($_GET['iddep'])) {
    $_GET['iddep'] = -1;
}

if (!isset($_GET['genre'])) {
    $_GET['genre'] = "tous";
}

if (!isset($_GET['etatsante'] )) {
    $_GET['etatsante'] = "tous";
}

if (!isset( $_GET['test_contamination'])) {
    $_GET['test_contamination'] = "tous";
}

if (!isset($_GET['etat_surveillance'])) {
    $_GET['etat_surveillance'] = "tous";
}


$query = "SELECT patient.*, hospitalisation.testcontamination FROM patient 
LEFT JOIN hospitalisation ON hospitalisation.numss = patient.numss";

$checkMulti = false;

if ($_GET['iddep'] != -1 || $_GET['genre'] != "tous" || $_GET['etatsante'] != "tous" || $_GET['test_contamination'] != "tous" || $_GET['etat_surveillance'] != "tous") {
    $query .= " WHERE ";
    
}


if ($_GET['iddep'] != -1) {
    $query .= " patient.iddep=$_GET[iddep] ";
    $checkMulti = true;
}


if ($_GET['genre'] != "tous") {
    if ($checkMulti) {
        $query .= "AND ";
    }
    $query .= " patient.genre='$_GET[genre]' ";
    $checkMulti = true;
}


if ($_GET['etatsante'] != "tous") {
    if ($checkMulti) {
        $query .= "AND ";
    }
    $query .= " patient.etatsante='$_GET[etatsante]' ";
    $checkMulti = true;
}


if ($_GET['test_contamination'] != "tous") {
    if ($checkMulti) {
        $query .= "AND ";
    }
    $query .= " hospitalisation.testcontamination='$_GET[test_contamination]' ";
    $checkMulti = true;
}

if ($_GET['etat_surveillance'] != "tous") {
    if ($checkMulti) {
        $query .= "AND ";
    }
    $query .= " patient.etatsurveillance='$_GET[etat_surveillance]' ";
    $checkMulti = true;
}


$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while ($arr[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($arr);




$queryN = "SELECT * FROM patient INNER JOIN hospitalisation ON hospitalisation.numss = patient.numss WHERE testcontamination='positif' AND patient.etatsurveillance = 'hospitalisé'";
$res = pg_query($queryN) or die('Échec de la requête : ' . pg_last_error());
while ($n1[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($n1);
$n1 = count($n1);

$queryN = "SELECT * FROM patient WHERE etatsurveillance='guéri'";
$res = pg_query($queryN) or die('Échec de la requête : ' . pg_last_error());
while ($n2[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($n2);
$n2 = count($n2);

$queryN = "SELECT * FROM patient WHERE etatsante='décédé'";
$res = pg_query($queryN) or die('Échec de la requête : ' . pg_last_error());
while ($n3[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($n3);
$n3 = count($n3);

$n4 = $n1 + $n2 + $n3;


$cond = "";
if ($_GET['iddep'] != -1) {
    $cond = " AND patient.iddep = $_GET[iddep]";
}

$queryN = "SELECT * FROM patient INNER JOIN hospitalisation ON hospitalisation.numss = patient.numss WHERE testcontamination='positif' AND patient.etatsurveillance = 'hospitalisé' $cond";
$res = pg_query($queryN) or die('Échec de la requête : ' . pg_last_error());
while ($d1[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($d1);
$d1 = count($d1);

$queryN = "SELECT * FROM patient WHERE etatsurveillance='guéri' $cond";
$res = pg_query($queryN) or die('Échec de la requête : ' . pg_last_error());
while ($d2[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($d2);
$d2 = count($d2);

$queryN = "SELECT * FROM patient WHERE etatsante='décédé' $cond";
$res = pg_query($queryN) or die('Échec de la requête : ' . pg_last_error());
while ($d3[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($d3);
$d3 = count($d3);

$d4 = $d1 + $d2 + $d3;







$queryGraphL = "SELECT * FROM historiqueetatp WHERE historiqueetat='décédé'";
$res = pg_query($queryGraphL) or die('Échec de la requête : ' . pg_last_error());
while ($dataG[] = pg_fetch_array($res, NULL, PGSQL_ASSOC)); 
array_pop($dataG);


$interval = 5;



$resDataG = array();

$tmpdate = date_create($dataG[0]['datehistorique']);
$tmpDATE = $tmpdate->format('Y-m-d');
$tmpNB = 0;

foreach ($dataG as $data) {
    $date = date_create($data['datehistorique']);
    if (date_diff($date, $tmpdate)->format('%a') <= $interval) {
        $tmpNB++;
    } else {
        $resDataG[$tmpDATE] = $tmpNB;
        
        $tmpdate = $date;
        $tmpDATE = $date->format('Y-m-d');
        $tmpNB = 1;
    }
}
$resDataG[$tmpDATE] = $tmpNB;

//print_r($resDataG);

$minDATE = null;
$maxDATE = null;

foreach ($resDataG as $key => $d) {
    if ($minDATE == null) {
        $minDATE = $key;
    }
    if ($maxDATE == null) {
        $maxDATE = $key;
    }

    if ($key > $maxDATE) {
        $maxDATE = $key;
    }

    if ($key < $minDATE) {
        $minDATE = $key;
    }
}

/*
$minDATE = "2020-01-01";
$maxDATE = "2020-05-01";
*/


for ($i = 1; $i <= date_diff(date_create($maxDATE), date_create($minDATE))->format('%a'); $i++) {
    if (!isset($resDataG[date_create($minDATE)->add(new DateInterval('P'.$i.'D'))->format('Y-m-d')])) {
        $resDataG[date_create($minDATE)->add(new DateInterval('P'.$i.'D'))->format('Y-m-d')] = 0;
    }
}

//print_r($resDataG);

ksort($resDataG);





?>


<div id="content-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10">
                <h1 class="page-header">
                    Statistiques

                </h1>
            </div>
        </div>
<hr>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Total</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <center><div><?=$n4?></div></center>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">Positives</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                    <center><?=$n1?></center>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">Guéries</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                    <center><?=$n2?></center>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">Morts</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                    <center><?=$n3?></center>
                    </div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xl-12">
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-chart-area mr-1"></i>Graphique des morts nationaux par jours</div>
                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                </div>
            </div>
        </div>
        



        <div class="row">
            <div class="col-xl-12">
                <form action="/index.php" method="get">
                    <div class="form-group">
                        <label for="iddep">Département</label>
                        <select id="iddep" name="iddep" class="form-control" required="required">
                            <option value=-1 <?php if ($_GET['iddep'] == -1) {echo "selected";} ?>>Tous les départements</option>
                            <?php
                            // query SQL pour recuperer la liste des departements dans la base
                            $query_result = pg_query($dbconn, "SELECT iddep, nomDep FROM departement;");
                            // echo out options :
                            while ($row = pg_fetch_row($query_result)) {
                                $dfpfg = "";
                                if ($_GET['iddep'] == $row[0]) {$dfpfg = "selected";}

                                echo "<option value=" . $row[0] . " ". $dfpfg  .">" . $row[1] . "</option>";
                            }
                            ?>

                        </select>
                    </div>
                    <center>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox1" value="tous" <?php if (isset($_GET['etatsante']) && $_GET['etatsante'] == "tous") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox1" value="aucun symptôme" <?php if (isset($_GET['etatsante']) && $_GET['etatsante'] == "aucun symptôme") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox1">Aucun symptôme</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox2" value="fièvre" <?php if (isset($_GET['etatsante']) && $_GET['etatsante'] == "fièvre") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox2">Fièvre</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox3" value="fièvre et problèmes respiratoires" <?php if (isset($_GET['etatsante']) && $_GET['etatsante'] == "fièvre et problèmes respiratoires") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox3">Fièvre et problèmes respiratoires</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox3" value="inconscient" <?php if (isset($_GET['etatsante']) && $_GET['etatsante'] == "inconscient") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox3">Inconscient</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox3" value="décédé" <?php if (isset($_GET['etatsante']) && $_GET['etatsante'] == "décédé") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox3">Décédé</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox1" value="tous" <?php if (isset($_GET['genre']) && $_GET['genre'] == "tous") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox1" value="H" <?php if (isset($_GET['genre']) && $_GET['genre'] == "H") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox1">Homme</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox2" value="F" <?php if (isset($_GET['genre']) && $_GET['genre'] == "F") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox2">Femme</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox3" value="A" <?php if (isset($_GET['genre']) && $_GET['genre'] == "A") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox3">Autre</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox1" value="tous" <?php if (isset($_GET['test_contamination']) && $_GET['test_contamination'] == "tous") { echo "checked";}?>>
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox1" value="positif" <?php if (isset($_GET['test_contamination']) && $_GET['test_contamination'] == "positif") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox1">Positif</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox2" value="négatif" <?php if (isset($_GET['test_contamination']) && $_GET['test_contamination'] == "négatif") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox2">Négatif</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox2" value="non effectué" <?php if (isset($_GET['test_contamination']) && $_GET['test_contamination'] == "non effectué") { echo "checked";} ?>>
                            <label class="form-check-label" for="inlineCheckbox2">Non effectué</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox1" value="tous"  <?php if (isset($_GET['etat_surveillance']) && $_GET['etat_surveillance'] == "tous") { echo "checked";} ?> >
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox1" value="guéri" <?php if (isset($_GET['etat_surveillance']) && $_GET['etat_surveillance'] == "guéri") { echo "checked";} ?> >
                            <label class="form-check-label" for="inlineCheckbox1">Guéri</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox2" value="quarantaine" <?php if (isset($_GET['etat_surveillance']) && $_GET['etat_surveillance'] == "quarantaine") { echo "checked";} ?> >
                            <label class="form-check-label" for="inlineCheckbox2">Quarantaine</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox2" value="hospitalisé" <?php if (isset($_GET['etat_surveillance']) && $_GET['etat_surveillance'] == "hospitalisé") { echo "checked";} ?> >
                            <label class="form-check-label" for="inlineCheckbox2">Hospitalisé</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox2" value="mort" <?php if (isset($_GET['etat_surveillance']) && $_GET['etat_surveillance'] == "mort") { echo "checked";} ?> >
                            <label class="form-check-label" for="inlineCheckbox2">Mort</label>
                        </div>
                    </div></center>
                    <center><button type="submit" id="sendfeedback" name="sendfeedback" class="btn btn-primary">Valider</button></center>

                    <br>
                    <br><br><br><br>
                </form>
            </div>
        </div>


        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body">Total</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <center><div><?=$d4?></div></center>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body">Positives</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                    <center><?=$d1?></center>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body">Guéries</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                    <center><?=$d2?></center>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body">Morts</div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                    <center><?=$d3?></center>
                    </div>
                </div>
            </div>
        </div>





        <!-- DataTables Example -->
        <div class="card mb-3">
            <div class="card-header">
                <i class="fas fa-table"></i>
                Liste des patients </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Numéro de sécurité social</th>
                                <th>Prénom</th>
                                <th>Nom</th>
                                <th>État santé</th>
                                <th>État de surveillance</th>
                                <th>Date de naissance</th>
                                <th>Genre</th>
                                <th>Numéro de téléphone</th>
                                <th>Adresse</th>
                                <th>Email</th>
                                <th>Département</th>
                                <th>Test de contamination</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($arr) {
                                foreach ($arr as $d) { ?>
                                    <?php
                                    //if ($test) {
                                       // foreach ($test as $t) { ?>
                                            <tr>
                                                <td><?= $d['numss'] ?></td>
                                                <td><?= $d['prenom'] ?></td>
                                                <td><?= $d['nom'] ?></td>
                                                <td><?= $d['etatsante'] ?></td>
                                                <td><?= $d['etatsurveillance'] ?></td>
                                                <td><?= $d['datenaissance'] ?></td>
                                                <td><?= $d['genre'] ?></td>
                                                <td><?= $d['numtelephone'] ?></td>
                                                <td><?= $d['adressep'] ?></td>
                                                <td><?= $d['email'] ?></td>
                                                <td><?= $d['iddep'] ?></td>
                                                <td><?= $d['testcontamination'] ?></td>
                                            </tr>
                            <?php

                                     //   }
                                   // }
                                }
                            }
                            ?>
                        </tbody>
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
                <span>Copyright © Projet universitaire L3 MIASHS - MIAGE : Conception de Systèmes d'Information 2019</span>
            </div>
        </div>
    </footer>
</div>
<!-- /.content-wrapper -->

<?php
include('includes/includes_theme/includes_down.php'); // free $dbconn et $result
?>

<!-- Page level plugin JavaScript-->
<script src="/includes/vendor/datatables/jquery.dataTables.js"></script>
<script src="/includes/vendor/datatables/dataTables.bootstrap4.js"></script>





<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>











<script>
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: [
        <?php   
            $tmpcmpt = 0;
            foreach ($resDataG as $key => $d) {
                $tmpcmpt++;
                if (count($resDataG) == $tmpcmpt) {
                    echo "\"".$key."\"";
                } else {
                    echo "\"".$key."\",";
                }
            }
        ?>
        /*"Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"*/],
    datasets: [{
      label: "Morts",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [
        <?php
            $tmpcmpt = 0;
            foreach ($resDataG as $key => $d) {
                $tmpcmpt++;
                if (count($resDataG) == $tmpcmpt) {
                    echo $d;
                } else {
                    echo $d.",";
                }
            }
        ?>
        /*10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 38451*/],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 10,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
</script>





















<!-- Demo scripts for this page-->
<script src="/includes/js/demo/datatables-demo.js"></script>