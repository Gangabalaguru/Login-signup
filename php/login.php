<?php

include "db.php";

$email = $_POST['email'];
$password = $_POST['password'];

$stmt = $mysqli->prepare("SELECT * FROM users WHERE email=?");
$stmt->bind_param("s",$email);
$stmt->execute();

$result = $stmt->get_result();

if($row = $result->fetch_assoc()){

    if(password_verify($password,$row['password'])){

        $redis->set("session_user_".$row['id'],"active");

        echo json_encode([
            "status"=>"success",
            "userId"=>$row['id']
        ]);

    }else{

        echo json_encode(["status"=>"fail"]);

    }

}else{

    echo json_encode(["status"=>"fail"]);

}

?>