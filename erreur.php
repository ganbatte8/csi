<?php
include('includes/includes_theme/includes_up.php');


?>


<style>
.error-template {padding: 40px 15px;text-align: center;}
.error-actions {margin-top:15px;margin-bottom:15px;}
.error-actions .btn { margin-right:10px;}
</style>


<div id="content-wrapper">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="error-template">
                    <h1>
                        Oops!</h1>
                    <h2>
                        404 Not Found</h2>
                    <div class="error-details">
                        Sorry, an error has occured, Requested page not found!
                    </div>
                    <div class="error-actions">
                        <a href="http://www.jquery2dotnet.com" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                            Take Me Home </a><a href="http://www.jquery2dotnet.com" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-envelope"></span> Contact Support </a>
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