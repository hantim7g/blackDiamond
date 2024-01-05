
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Page</title>
    <!-- Bootstrap CSS -->
    <!-- 
     --><!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-btn {
            cursor: pointer;
        }

        .modal-dialog {
            max-width: 400px;
        }

        .modal-content {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
            background-color: #840840;
            color: #fff;
            border-radius: 15px 15px 0 0;
        }

        .newPassword-error {
            color: #dc3545;
        }
        .login-form{
		 flex: 3;}
		
    </style>
</head>
<body>
<jsp:include page="navBar.jsp" />
<br>
<div class="main-section">
<div class=" row">
<div class="container md6 login-form">

<div id="carouselExample" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/slide1.jpg" class="d-block w-100" alt="Slide 1">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Slide 1 Heading</h5>
                    <p>Some description for slide 1.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/slide2.webp" class="d-block w-100" alt="Slide 2">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Slide 2 Heading</h5>
                    <p>Some description for slide 2.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/slide3.webp" class="d-block w-100" alt="Slide 3">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Slide 3 Heading</h5>
                    <p>Some description for slide 3.</p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExample" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<script>
    // Auto slide every 3 seconds
    $(document).ready(function() {
    	
    	$('#carouselExample').carousel({
            interval: 3000
        });
    });
</script>

<!--  onsubmit="return validateForm()"-->

	<div class="container md-6 login-form">
	
	<form id="loginForm" action="loginSubmit" method="post">
                    <div class="form-group">
                        <label for="loginMail">Username/Mobile</label>
                        <input type="text" class="form-control" id="loginMail" placeholder="Enter your username or mobile" required>
                    </div>
                    <div class="form-group">
                        <label for="newPassword">Password</label>
                        <input type="Password" class="form-control" id="newPassword" placeholder="Enter your Password" required>
                        <small class="form-text newPassword-error" id="newPasswordError"></small>
                    </div>
                    <button type="button" class="btn btn-primary btn-block" onclick="validateLogin()">Login</button>
                </form>
                <div class="text-center mt-3">
                    <a href="#" class="btn btn-link btn-forgot-newPassword forgotPasswordBtn" >Register/Forgot Password?</a>
                </div>
     
     <div class="container mt-3">
    <!-- Success Alert -->
    
    <!-- Error Alert -->
    <div class="d-none lerror alert alert-danger alert-dismissible fade show" role="alert">
        <strong>Error!</strong> Please check your credential and try again.
       
    </div>
    
  
</div>
     
      <div class="modal fade" id="forgotPasswordModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Register/Forgot Password</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <p><i id="infoText">You will receive a login password on this email address.</i></p>
                <input type="email" id="emailInput" placeholder="Enter Email" class="form-control">
            </div>
            
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-success" id="requestPasswordBtn">Request</button>
               </div>
        </div>
    </div>
</div>
                
	</div>
	
	</div></div>

<script>

    $(document).ready(function(){
        $(".forgotPasswordBtn").click(function(){
            $("#forgotPasswordModal").modal('show');
        });

        $("#requestPasswordBtn").click(function(){
            var email = $("#emailInput").val();
            // You can make an AJAX call to send the email and get the autogenerated password
            $.post("/sendEmail", {email: email}, function(response){
            	bootbox.alert(response.view);
                $("#forgotPasswordModal").modal('hide');
            });
        });
    });
</script>
<!-- <script>
    // Auto slide every 3 seconds
    $(document).ready(function() {
    	
    	$('#carouselExample').carousel({
            interval: 3000
        });
    });
</script> -->
<script>

    function validateLogin() {
        var loginMail = $("#loginMail").val();
        var newPassword = $("#newPassword").val();
        $(".lerror").addClass('d-none');
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/loginSubmit", // Replace with your Spring Boot endpoint
            data: JSON.stringify({loginMail: loginMail, newPassword: newPassword}),
            dataType: 'json',
            success: function (response) {
                debugger;
            	// Handle the response from the server
                if (response.valid) {
                    // Form is valid, you can submit it or perform other actions
                	console.log("Validation Successful");
                    window.location.href = "/home";
                  
                } else {
                    // Display error message
                    $(".lerror").removeClass('d-none');
                }
            },
            error: function (error) {
            	  $(".lerror").removeClass('d-none');
                console.log("Error: " + error);
            }
        });
    }

    </script>
<script type="text/javascript">
$(document).ready(function() {
	$('.close').on('click', function() {
        $('#forgotPasswordModal').modal('hide');
    });
	
});
</script>
</body>
</html>
