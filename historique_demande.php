<?php
include('includes/includes_theme/includes_up.php');


// Partie SQL pour le contenu du tableau (Liste des historiques de dérogation)
//          Exécution de la requête SQL
$query = "  SELECT date_etude_de_validation, nom_etat, prenom_personne, nom_personne 
            FROM historique_etude_de_validation 
            INNER JOIN personne ON historique_etude_de_validation.personne_id_personne = personne.id_personne
            INNER JOIN type_etat_validation ON historique_etude_de_validation.type_etat_validation_id_type_etat_validation = type_etat_validation.id_type_etat_validation
            WHERE demande_de_derogation_id_demande_de_derogation = $_GET[id_demande]";
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while($data_historique_demande[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_historique_demande);


?>

<div id="content-wrapper">

  <div class="container-fluid">

    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Dérogations</a>
      </li>
      <li class="breadcrumb-item active">Affichage de l'historique pour une demande de dérogation d'activité exceptionnelle</li>
    </ol>


    <!-- Page Content -->
    <h1>Liste des étapes de validation</h1>
    <hr>
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Historique des études de validation</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Etat de l'étude</th>
                    <th>Date de modification</th>
                  </tr>
                </thead>
                <tbody>

				<?php
				  if ($data_historique_demande) {
				    foreach($data_historique_demande as $demande)
				    { ?>  
				      
					<tr>
	                    <td><?=$demande[nom_personne]?></td>
	                    <td><?=$demande[prenom_personne]?></td>
	                    <td><?=$demande[nom_etat]?></td>
	                    <td><?=$demande[date_etude_de_validation]?></td>
                  	</tr>

				    <?php
				    }
				  }
				  ?>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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