<?php

require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$inseratID = $_POST["inseratID"];

$sql = "DELETE FROM inserat WHERE user = ? AND ID = ?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$userID, $inseratID]);

 
if ($erfolg) {

    loescheAlteHashtags($inseratID);

} else {

    print_r($erfolg);
};

function loescheAlteHashtags($inseratID){

    require('config.php');

    // lösche die alten hashtags
    $sql = "DELETE FROM inserat_hat_hashtag WHERE inserat_id = ?";
    $stmt = $pdo->prepare($sql);

    $erfolg = $stmt->execute([$inseratID]);

    if($erfolg){
       echo "Inserat und Hashtags wurden gelöscht!";
    } else {
        $erfolg;
    }



}
