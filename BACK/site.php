<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>a website</title>
</head>
<body>
    
    <?php
    //psql : server=localhost, database=postgres, port=5432, username=postgres, client encoding=SJIS, password=user
    // is the dbname postgres (as shown when logging into the sql shell) or test (the actual database name that has tables) ?
        echo "hi<br>";
        $dbconn = pg_connect("host=localhost port=5432 dbname=test user=postgres password=user");
        if (!$dbconn){
            echo "couldn't connect to the database<br>";
        }
        $result = pg_query($dbconn, "SELECT * FROM person;");
        if (!$result){
            echo "an error occurred during the query<br>";
        }
        // printing the results of the query :
        while ($row = pg_fetch_row($result)){
            for ($i = 0; $i < count($row); $i++){
                echo $row[$i]." ";
            }
            echo "<br>";
        }
        pg_close($dbconn);
        echo "done<br>";
    ?>
    <select id="country" name="country" class="form-control">
</body>
</html>