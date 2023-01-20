<?php

require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$titel = $_POST["titel"];
$adresse = $_POST["adresse"];
$beschreibung = $_POST["beschreibung"];
$stadt = $_POST["stadt"];
$status = $_POST["status"];

$bild = $_POST["bild"];

$inseratID = $_POST["inseratID"];

$hashtags = json_decode($_POST['hashtags']);

$sql = "UPDATE inserat SET titel=?, bild=?, adresse=?, stadt=?, beschreibung=?, status=? WHERE user=?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$titel, $bild, $adresse, $stadt, $beschreibung, $status, $userID]);

// falls erfolg true bzw. 1 ist
if ($erfolg) {

   loescheAlteHashtags($inseratID);
   insertNeueHashtags($hashtags, $inseratID);

} else {

    print_r($erfolg);

};

function loescheAlteHashtags($inseratID){

    require('config.php');

    // lösche die alten hashtags
    $sql = "DELETE FROM inserat_hat_hashtag WHERE inserat_id = ?";
    $stmt = $pdo->prepare($sql);

    $stmt->execute([$inseratID]);

}

function insertNeueHashtags($hashtags, $inseratID){

require('config.php');

// füge die neuen hashtags ein, wenn überhaupt hashtags angeklickt wurden
if (sizeof($hashtags) > 0) {

    $sql = "INSERT INTO inserat_hat_hashtag (inserat_id, hashtag_id) VALUES (:inserat_id, :hashtag_id)";
    $stmt = $pdo->prepare($sql);

    foreach ($hashtags as $hashtag) {

        $erfolg = $stmt->execute(array('inserat_id' => $inseratID, 'hashtag_id' => $hashtag));
    }

    if ($erfolg) {

        print_r("Dein Inserat wurde aktualisiert.");

    } else {

        // gib die Fehlermeldung aus
        print_r($erfolg);
    }
    
} else {

    print_r("Dein Inserat wurde ohne Hashtags aktualisiert.");
}

}