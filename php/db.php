<?php

require '../vendor/autoload.php';

$mysqli = new mysqli("localhost","root","root123","internship");

if($mysqli->connect_error){
    die("MySQL connection failed");
}

/* MongoDB */

$mongo = new MongoDB\Client("mongodb://localhost:27017");
$profileCollection = $mongo->userprofile->profiles;

/* Redis */

$redis = new Redis();
$redis->connect("127.0.0.1",6379);

?>