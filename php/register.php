<?php

include "db.php";

$name = $_POST['name'];
$email = $_POST['email'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT);

$stmt = $mysqli->prepare("INSERT INTO users(name,email,password) VALUES(?,?,?)");

$stmt->bind_param("sss",$name,$email,$password);

if($stmt->execute()){

echo "Registered Successfully";

}else{

echo "Error";

}

?>