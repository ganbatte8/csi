
<select id="departement" name="departement" class="form-control">
<?php
    // make an SQL query that fetches all the department names for the HTML select element :
    $query_result = pg_query($dbconn, "SELECT nomDep FROM departement;");
    
    // echo out all the HTML option elements so that the user can choose a department in a dropdown select list :
    while ($row = pg_fetch_row($query_result)){
        echo "<option value=".$row[0].">".$row[0]."</option>";
    }

    // then we want to fetch all the patients in that department (but only the ones we want to contact... ?)
    $query_result = pg_query($dbconn, "SELECT * FROM patient JOIN adresse ON patient.idAdresse = adresse.idAdresse JOIN departement ON department.idDep = adresse.idDep WHERE departement = ".$_GET["departement"].";");
    echo "<ul>";
        while ($row = pg_fetch_row($query_result)){
            echo "<li>";
            for ($i = 0; $i < count($row); $i++){
                echo $row[$i]." ";
            }
            echo "</li>";
        }
    echo "</ul>";
?> 