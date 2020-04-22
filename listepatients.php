
<?php
//Connexion à la BDD
$dbconn = pg_connect("host=localhost dbname=projet user=postgres password='Miage123'")
    or die('Connexion impossible : ' . pg_last_error());



include('includes/includes_theme/includes_up.php');
if ($_SESSION['metier'] != 0 ) {
    header('Location: /erreur.php');
}


$query = "SELECT * FROM patient;";
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());



?>



<div id="content-wrapper">

    <div class="container-fluid">
    <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header"><i class="fas fa-chart-bar mr-1"></i>Bar Chart Example</div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table mr-1"></i>DataTable Example</div>
                            <div class="card-body">
                                <div class="table-responsive">
                                   <div class="btn btn-success mb-2" id="bloc2" onClick="window.location.href='ajouter_patient.php';">
                                      <label>Ajouter patient</label>
                                  </div>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead class="thead-light">
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
                                            </tr>
                                        </thead>
                                        <!--inserer liste patients-->
                                        <tbody>
                                        <?php
                                        while ($row = pg_fetch_row($result)){
                                          echo '<tr>';
                                          for ($i = 0; $i < count($row); $i++){
                                              echo '<td>'.$row[$i]."</td>";
                                          }
                                          echo "</tr>";
                                        }
                                        ?>
                                        </tbody>
                                        <tfoot class="thead-light">
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
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
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
    include('includes/includes_theme/includes_down.php');
    ?>

      <!-- Page level plugin JavaScript-->
  <script src="/includes/vendor/datatables/jquery.dataTables.js"></script>
  <script src="/includes/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Demo scripts for this page-->
  <script src="/includes/js/demo/datatables-demo.js"></script>