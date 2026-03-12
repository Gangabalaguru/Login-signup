$(document).ready(function(){

$("#saveProfile").click(function(){

let userId = localStorage.getItem("userId");

console.log("UserId:", userId);

$.ajax({

url:"php/profile.php",
type:"POST",

data:{
userId:userId,
age:$("#age").val(),
dob:$("#dob").val(),
contact:$("#contact").val()
},

success:function(res){

console.log("Server response:",res);
alert(res);

},

error:function(err){

console.log("AJAX error:",err);

}

});

});

});