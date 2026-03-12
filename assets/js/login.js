$(document).ready(function(){

    $("#loginBtn").click(function(){

        let email = $("#email").val();
        let password = $("#password").val();

        if(email=="" || password==""){
            alert("Please enter email and password");
            return;
        }

        $.ajax({
            url:"php/login.php",
            type:"POST",

            data:{
                email:email,
                password:password
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

            },

            error:function(err){
                console.log("AJAX Error:", err);
            }

        });

    });

});