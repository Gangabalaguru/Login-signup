<?php

require '../vendor/autoload.php';

/* MySQL */

$mysqli = new mysqli(
    $_ENV['MYSQLHOST'],
    $_ENV['MYSQLUSER'],
    $_ENV['MYSQLPASSWORD'],
    $_ENV['MYSQLDATABASE'],
    $_ENV['MYSQLPORT']
);

if ($mysqli->connect_error) {
    die("MySQL connection failed: " . $mysqli->connect_error);
}


/* MongoDB */

$mongo = new MongoDB\Client($_ENV['MONGODB_URI']);
$profileCollection = $mongo->userprofile->profiles;


/* Redis */

$redis = new Redis();
$redis->connect(
    $_ENV['REDISHOST'],
    $_ENV['REDISPORT']
);
$redis->auth($_ENV['REDISPASSWORD']);

?>
