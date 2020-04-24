<?php
include('includes/includes_theme/includes_up.php'); // initialise $dbconn et $result. appeler includes_down.php apres

// si l'utilisateur n'est pas connecte en tant que medecin alors on redirige vers la page d'erreur :
if ($_SESSION['metier'] != 0) {
    header('Location: /erreur.php');
}

// $query2 : pour obtenir l'iddep du medecin connecte
$query2 = "SELECT iddep FROM hopital WHERE idhp = " . $_SESSION['idhp'] . ";";
$result = pg_query($query2) or die('Échec de la requête : ' . pg_last_error());
while ($iddep[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($iddep);

$query = "SELECT * FROM patient;";
$checked['all'] = "checked";
$checked['dep'] = "";
$checked['hop'] = "";


$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while ($data[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($data);





if (isset($_GET['iddep'], $_GET['genre'], $_GET['etatsante'], $_GET['test_contamination'], $_GET['etat_surveillance'])) {
    print_r($_GET);
    $query = "SELECT * FROM patient 
    WHERE iddep = {$_GET['iddep']} 
    AND genre = '{$_GET['genre']}' 
    AND etatsante = '{$_GET['etatsante']}'
    AND etatsurveillance = '{$_GET['etat_surveillance']}'
    AND testcontamination = '{$_GET['test_contamination']}'";

    $result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
    while ($arr[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
    array_pop($arr);
}

?>


<div id="content-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-10">
                <h1 class="page-header">
                    Liste des patients

                </h1>
            </div>
            <div class="col-lg-2">
                <a href="/ajouter_patient.php" style="float: right"><button type="button" class="btn btn-info">Ajouter un patient</button> </a>
            </div>
        </div>


        <hr>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-chart-area mr-1"></i>Area Chart Example</div>
                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>Bar Chart Example</div>
                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                </div>
            </div>
        </div>


        <div class="row">
            <div class="col-xl-12">
                <form action="/index.php" method="get">
                    <div class="form-group">
                        <label for="iddep">Département</label>
                        <select id="iddep" name="iddep" class="form-control" required="required">
                            <option value=-1>Tous les départements</option>
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
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox1" value="tous">
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox1" value="aucun symptôme">
                            <label class="form-check-label" for="inlineCheckbox1">Aucun symptôme</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox2" value="fièvre">
                            <label class="form-check-label" for="inlineCheckbox2">Fièvre</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox3" value="fièvre et problèmes respiratoires">
                            <label class="form-check-label" for="inlineCheckbox3">Fièvre et problèmes respiratoires</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox3" value="inconscient">
                            <label class="form-check-label" for="inlineCheckbox3">Inconscient</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etatsante" id="inlineCheckbox3" value="décédé">
                            <label class="form-check-label" for="inlineCheckbox3">Décédé</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox1" value="tous">
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox1" value="H">
                            <label class="form-check-label" for="inlineCheckbox1">Homme</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox2" value="F">
                            <label class="form-check-label" for="inlineCheckbox2">Femme</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="genre" id="inlineCheckbox3" value="A">
                            <label class="form-check-label" for="inlineCheckbox3">Autre</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox1" value="tous">
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox1" value="positif">
                            <label class="form-check-label" for="inlineCheckbox1">Contaminé</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="test_contamination" id="inlineCheckbox2" value="négatif">
                            <label class="form-check-label" for="inlineCheckbox2">Non contaminé</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox1" value="tous">
                            <label class="form-check-label" for="inlineCheckbox1">Tous</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox1" value="guéri">
                            <label class="form-check-label" for="inlineCheckbox1">Guéri</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox2" value="quarantaine">
                            <label class="form-check-label" for="inlineCheckbox2">Quarantaine</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox2" value="hospitalisé">
                            <label class="form-check-label" for="inlineCheckbox2">Hospitalisé</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="etat_surveillance" id="inlineCheckbox2" value="mort">
                            <label class="form-check-label" for="inlineCheckbox2">Mort</label>
                        </div>
                    </div>
                    <center><button type="submit" id="sendfeedback" name="sendfeedback" class="btn btn-primary">Ajout patient</button></center>

                    <br>
                    <br><br><br><br>
                </form>
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
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            if ($data) {
                                foreach ($data as $d) { ?>
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
                                    </tr>
                            <?php
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

<!-- Demo scripts for this page-->
<script src="/includes/js/demo/datatables-demo.js"></script>