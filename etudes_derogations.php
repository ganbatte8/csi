<?php
include('includes/includes_theme/includes_up.php');

// Si l'utilisateur a fait la demande de modification de l'etat d'une demande
if ($_POST) {
	$now = date('Y-m-d H:i:s', time());

	$query = "UPDATE demande_de_derogation SET type_etat_validation_id_type_etat_validation = '$_POST[id_type_etat_validation]' WHERE id_demande_de_derogation = $_POST[id_demande_de_derogation]";
	pg_query($dbconn,$query);
}


// On va chercher la liste des etats d'activités possibles pour pouvoir les afficher quand l'utilisateur veut changer cet état
$query = 'SELECT * FROM type_etat_validation';
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while($data_type_etat_validation[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_type_etat_validation); // On organise les données dans un tableau


// La liste des demande de dérogation est divisée en deux,
// 1er  = la liste des demandes de dérogation qui peuvent être étudiés par un supérieur hierarchique
// 2eme = la liste des demandes de dérogation qui peuvent être étudiés par l'utilisateur connecté

// 1er partie
if ($_SESSION['sup_hierarchique'] == 1) {
	// Partie SQL pour le contenu du tableau (Liste des demandes de dérogation)
	//          Exécution de la requête SQL
	$query = "	SELECT 	id_demande_de_derogation, date_demande_de_derogation,date_debut_demande_de_derogation,
						date_fin_demande_de_derogation , montant_remuneration_demande_de_derogation , 
						id_type_etat_validation, nom_etat, nom_type_activite_excep, personne_id_personne, nom_personne, prenom_personne
				FROM demande_de_derogation 
				INNER JOIN type_etat_validation ON demande_de_derogation.type_etat_validation_id_type_etat_validation = type_etat_validation.id_type_etat_validation
				INNER JOIN personne ON demande_de_derogation.personne_qui_demande_id_personne = personne.id_personne
				INNER JOIN type_activite_excep ON demande_de_derogation.type_activite_excep_id_type_activite_excep = type_activite_excep.id_type_activite_excep
				WHERE personne_id_personne IS NULL;";
	$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
	while($data_demandes_derogations[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_demandes_derogations); 

} 


// 2eme partie
$query = "	SELECT 	id_demande_de_derogation, date_demande_de_derogation,date_debut_demande_de_derogation,
					date_fin_demande_de_derogation , montant_remuneration_demande_de_derogation , id_type_etat_validation, 
					nom_etat, nom_type_activite_excep, personne_id_personne, nom_personne, prenom_personne
			FROM demande_de_derogation 
			INNER JOIN type_etat_validation ON demande_de_derogation.type_etat_validation_id_type_etat_validation = type_etat_validation.id_type_etat_validation
			INNER JOIN personne ON demande_de_derogation.personne_qui_demande_id_personne = personne.id_personne
			INNER JOIN type_activite_excep ON demande_de_derogation.type_activite_excep_id_type_activite_excep = type_activite_excep.id_type_activite_excep
			WHERE personne_id_personne = '$_SESSION[id_personne]';";
$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while($data_demandes_derogations2[] = pg_fetch_array($result, NULL, PGSQL_ASSOC)); array_pop($data_demandes_derogations2);
?>





<!-- Custom fonts for this template-->
<link href="/includes/css/sweetalert2.min.css" rel="stylesheet" type="text/css">
<script src="/includes/js/sweetalert2.min.js"></script>



<script type="application/javascript">
	$(document).ready(function() {
		$('#listeModules').DataTable();
	} );
	
	function post(path, params, method) { //DL INTERNET
	    method = method || "post"; // Set method to post by default if not specified.
	    // The rest of this code assumes you are not using a library.
	    // It can be made less wordy if you use one.
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);

	    for(var key in params) {
	    	if(params.hasOwnProperty(key)) {
	    		var hiddenField = document.createElement("input");
	    		hiddenField.setAttribute("type", "hidden");
	    		hiddenField.setAttribute("name", key);
	    		hiddenField.setAttribute("value", params[key]);

	    		form.appendChild(hiddenField);
	    	}
	    }
	    document.body.appendChild(form);
	    form.submit();
	}
	
	function modifier(id_demande_de_derogation) {
		swal({
			title: 'Vous êtes sur le point d\'annuler votre demande de dérogation',
			text: "Une fois la dérogation annuler il est impossible de la réactiver",
			type: 'warning',
			input: 'select',
			inputOptions: {
				<?php
				foreach ($data_type_etat_validation as $type_validation) { // ON affiche la liste des états possibles
					echo "'$type_validation[id_type_etat_validation]': '$type_validation[nom_etat]',";
				}
				?>
			},
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Oui, abandonner la demande!',
			cancelButtonText: "Annuler",
			inputValidator: (value) => {
				post('/etudes_derogations.php', {id_demande_de_derogation: id_demande_de_derogation, id_type_etat_validation: value});
			}
		})
	}
	
</script>

<div id="content-wrapper">

	<div class="container-fluid">

		<!-- Breadcrumbs-->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="index.html">Dérogations</a>
			</li>
			<li class="breadcrumb-item active">Affichage de la liste de vos demandes de dérogation pour des activités exceptionnelles</li>
		</ol>


		<!-- Page Content -->
		<h1>Liste des demandes</h1>
		<hr>
		<!-- DataTables Example -->
		<div class="card mb-3">
			<div class="card-header">
				<i class="fas fa-table"></i>
			Vos demandes de dérogation</div>
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
												<?php if ($demande[id_type_etat_validation] == 1 || $demande[id_type_etat_validation] == 3) {  ?>
												<button onClick="javascript:modifier('<?=$demande['id_demande_de_derogation']?>')" class="btn btn-warning" title="Modifier">Modifier</button><?php } ?>
												<a href="/historique_demande.php?id_demande=<?=$demande['id_demande_de_derogation']?>"><button class="btn btn-info" title="Historique">Historique</button></a>
											</td>
										</tr>

										<?php
									}
								}


								if ($data_demandes_derogations2) {
									foreach($data_demandes_derogations2 as $demande)
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
													<?php if ($demande[id_type_etat_validation] == 1 || $demande[id_type_etat_validation] == 3) {  ?>
													<button onClick="javascript:modifier('<?=$demande['id_demande_de_derogation']?>')" class="btn btn-warning" title="Voir">Modifier</button>
													<?php } ?>
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