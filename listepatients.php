
<?php
include('includes/includes_theme/includes_up.php');
if ($_SESSION['metier'] != 0 ) {
    header('Location: /erreur.php');
}

?>



<div id="content-wrapper">

    <div class="container-fluid">
        
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