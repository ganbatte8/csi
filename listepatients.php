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
if (isset($_POST['preselections'])) {
  switch ($_POST['preselections']) {
    case 'all':
      $checked['all'] = "checked";
      break;
    case 'dep':
      $query = "SELECT * FROM patient
            WHERE patient.iddep = " . $iddep[0]['iddep'] . " AND patient.etatsurveillance ='quarantaine' ;";
      $checked['dep'] = "checked";
      break;
    case 'hop':
      $query = "SELECT DISTINCT patient.* FROM patient
            INNER JOIN hospitalisation ON hospitalisation.numss = patient.numss
            WHERE hospitalisation.idhp = " . $_SESSION['idhp'] . " AND patient.etatsurveillance ='hospitalisé' ;";
      $checked['hop'] = "checked";
      break;
  }
} else {
  if (isset($_POST['idhp'])) {
    if ($_POST['idhp'] != -1) {
      $query4 = "select inserer_patient_hopital($_POST[idhp],$_POST[numss]) ";
      $result = pg_query($query4) or die('Échec de la requête : ' . pg_last_error());
    }
    $query5 = "update patient set etatsante = '$_POST[etat]' where numss= $_POST[numss]";
    $result = pg_query($query5) or die('Échec de la requête : ' . pg_last_error());
  }
}

$result = pg_query($query) or die('Échec de la requête : ' . pg_last_error());
while ($data[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($data);

$query3 = "SELECT idhp, nom FROM hopital WHERE iddep = " . $iddep[0]['iddep'] . ";";
$result = pg_query($query3) or die('Échec de la requête : ' . pg_last_error());
while ($data_hop[] = pg_fetch_array($result, NULL, PGSQL_ASSOC));
array_pop($data_hop);
?>

<div id="dom-target" style="display: none;">
  <?php
  echo json_encode($data_hop); /* You have to escape because the result
                                           will not be valid HTML otherwise. */
  ?>
</div>

<!-- Custom fonts for this template-->
<link href="/includes/css/sweetalert2.min.css" rel="stylesheet" type="text/css">
<script src="/includes/js/sweetalert2.min.js"></script>
<script type="application/javascript">
  function post(path, params, method) { //DL INTERNET
    method = method || "post"; // Set method to post by default if not specified.
    // The rest of this code assumes you are not using a library.
    // It can be made less wordy if you use one.
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);

    for (var key in params) {
      if (params.hasOwnProperty(key)) {
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

  function modifPatient(numss) {
    swal({
      title: 'MODIF ?',
      input: 'select',
      inputOptions: {
        'aucun symptôme': 'aucun symptôme',
        'fièvre': 'fièvre',
        'fièvre et problèmes respiratoires': 'fièvre et problèmes respiratoires',
        'décédé': 'décédé',
        'inconscient': 'inconscient'
      },
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Valider !',
      cancelButtonText: "Annuler"
    }).then(function(val) {
      var etat = val
      if (etat == "fièvre et problèmes respiratoires" || etat == "inconscient") {
        alert("TRUE")
        var data_hop = JSON.parse(document.getElementById("dom-target").textContent);
        console.log(data_hop);
        var data = {};
        for (var value of data_hop) {
          data[value.idhp] = value.nom
        }
        swal({
          title: 'Dans quel hôpital ?',
          input: 'select',
          inputOptions: data,
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Valider !',
          cancelButtonText: "Annuler"
        }).then(function(val2) {
          post('/listepatients.php', {
            idhp: val2,
            etat: etat,
            numss: numss
          })
          swal(
            'OK !',
            'Le patient a bien été modifié',
            'success'
          )
        });
      } else {
        post('/listepatients.php', {
          idhp: -1,
          etat: etat,
          numss: numss
        })
        swal(
          'KO !',
          'Le patient a bien été modifié',
          'success'
        )
      }
    })
  }
</script>







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
    <p>Vous pouvez sélectionner des dates pour afiner votre recherche.</p>


    <div class="row" style="width: 1000px; margin: auto;">
      <center>
        <form method="POST">
          <div class="row">
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="all"><input type="radio" name="preselections" value="all" id="all" onClick="this.form.submit();" <?= $checked['all'] ?>>Tous les patients</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="dep"><input type="radio" name="preselections" value="dep" id="dep" onClick="this.form.submit();" <?= $checked['dep'] ?>>A contacter (département)</label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label" for="hop"><input type="radio" name="preselections" value="hop" id="hop" onClick="this.form.submit();" <?= $checked['hop'] ?>>A contacter (hôpital)</label>
            </div>

          </div>

        </form>
      </center>


    </div>


    <script>
      function clearradio() {
        document.getElementById("all").checked = false;
        document.getElementById("dep").checked = false;
        document.getElementById("hop").checked = false;
      }
    </script>



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
                <th>Actions</th>
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
                    <td>
                      <button onClick="javascript:modifPatient('<?= $d['numss'] ?>')" class="btn btn-primary" title="Modification du patient"> <i class="fas fa-pen-square"></i></i></button>
                    </td>
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