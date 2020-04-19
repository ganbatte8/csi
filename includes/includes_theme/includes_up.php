<?php

include('includes/init.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Société Elamron</title>

  <!-- Custom fonts for this template-->
  <link href="includes/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="includes/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="includes/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

  	<button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <a class="navbar-brand mr-1" href="index.php">Société Elamron : dérogations activités exceptionnelles</a>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto mr-0">
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i>
        </a>

        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
           Bonjour <?=$_SESSION['prenom_personne']?> <?=$_SESSION['nom_personne']?> !
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Déconnexion</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="etudes_derogations.php">
          <i class="fas fa-fw fa-table"></i>
          <span>Etude des dérogations</span></a>
      </li>
      <?php if ($_SESSION['membre_comite'] == 1 || $_SESSION['sup_hierarchique'] == 1) { ?>
      <li class="nav-item">
        <a class="nav-link" href="index.php">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Rechercher une demande</span>
        </a>
      </li>
    <?php } ?>
      <li class="nav-item">
        <a class="nav-link" href="derogation_user.php">
          <i class="fas fa-fw fa-table"></i>
          <span>Mes demandes de dérogation</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="faire_derogation.php">
          <i class="fas fa-fw fa-table"></i>
          <span>Faire une demande de dérogation</span></a>
      </li>
    </ul> 