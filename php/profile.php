<?php

include "db.php";

$userId = $_POST['userId'];
$age = $_POST['age'];
$dob = $_POST['dob'];
$contact = $_POST['contact'];

$data = [
"userId"=>$userId,
"age"=>$age,
"dob"=>$dob,
"contact"=>$contact
];

$result = $profileCollection->insertOne($data);

if($result){
echo "Profile saved successfully";
}else{
echo "Error saving profile";
}

?>