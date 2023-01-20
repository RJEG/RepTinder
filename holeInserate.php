<?php

require("config.php");
require("autorisieren.php");


$sql = "
SELECT Inserat.ID, Inserat.titel, Inserat.bild, Inserat.adresse, ST.stadt, Inserat.beschreibung, U.name, U.email, Inserat.status, Inserat.timestamp
FROM inserat Inserat
INNER JOIN user U
ON Inserat.user = U.ID
INNER JOIN stadt ST
ON Inserat.stadt = ST.ID
ORDER BY Inserat.timestamp DESC;
";


$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}






