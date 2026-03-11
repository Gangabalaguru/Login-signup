$(document).ready(function(){

$("#loginBtn").click(function(){

console.log("Button clicked");

$.ajax({
url:"php/login.php",
type:"POST",

data:{
email:$("#email").val(),
password:$("#password").val()
},

success:function(res){

console.log("Server response:", res);

let data = JSON.parse(res);

if(data.status=="success"){

localStorage.setItem("userId",data.userId);
window.location="profile.html";

}else{

alert("Invalid Login");

}

}

});

});

});