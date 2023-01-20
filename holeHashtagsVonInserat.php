<?php


require("config.php");
require("autorisieren.php");

$inseratID = $_POST["inseratID"];

$sql = "
SELECT h.ID, h.hashtag FROM hashtag h 
INNER JOIN inserat_hat_hashtag junc ON h.ID = junc.hashtag_id
WHERE junc.inserat_id = '$inseratID';
";



$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}

