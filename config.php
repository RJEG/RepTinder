<?php
$host = "localhost";
$user = "491875_3_1";
$password = "wuQfxNAeKXGv";
$dbname = "491875_3_1";

$pdo = new PDO('mysql:host='. $host . '; dbname=' . $dbname . ';charset=utf8', $user, $password);
$pdo->exec("set names utf8");


