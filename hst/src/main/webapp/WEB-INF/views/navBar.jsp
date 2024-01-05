<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>hst marketing</title>
<!-- Custom CSS for green menu -->
<!-- Include Bootstrap CSS from MaxCDN -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!-- Include DataTables CSS -->
<link href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" rel="stylesheet">

<style>
    .green-menu .navbar-nav .nav-link {
        color: #fff !important;
    }
    .green-menu .navbar {
        background-color: #840840 !important;
        font-weight: bold;
    }
    /* Dancing animation */
    @keyframes dance {
        0% {
            transform: translateY(0) rotate(0deg);
        }
        25% {
            transform: translateY(-10px) rotate(-5deg);
        }
        50% {
            transform: translateY(0) rotate(0deg);
        }
        75% {
            transform: translateY(10px) rotate(5deg);
        }
        100% {
            transform: translateY(0) rotate(0deg);
        }
    }
    .dancing-text {
        animation: dance 1s infinite;
    }
</style>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body class="green-menu">

<!-- Secondary Navigation Menu -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand dancing-text" href="#">
        <img src="images/logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
        hst Marketing
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#secondaryNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="secondaryNavbar">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="/home">Home</a></li>
            
            <!-- Dropdown for Orders -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="ordersDropdown" role="button" data-toggle="dropdown">
                    Orders
                </a>
                <div class="dropdown-menu" aria-labelledby="ordersDropdown">
                    <a class="dropdown-item" href="/orderForm">New Order</a>
                    <a class="dropdown-item" href="/manageOrderBuyer">Manage Order</a>
                     <% 
                if(session.getAttribute("userRole") != null && session.getAttribute("userRole").equals("Admin")) { 
            %>
                     <a class="dropdown-item" href="/manageOrder">Admin Manage Order</a>
              <%
                }
              %>      
                </div>
            </li>
            <!-- End of Dropdown for Orders -->

            <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
            <!-- <li class="nav-item"><a class="nav-link" href="/product">Product</a></li> -->
             <% 
                if(session.getAttribute("userRole") != null && session.getAttribute("userRole").equals("Admin")) { 
            %>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="pdtDropdown" role="button" data-toggle="dropdown">
                    Product
                </a>
                <div class="dropdown-menu" aria-labelledby="pdtDropdown">
                    <a class="dropdown-item" href="/product">New Product</a>
                    <a class="dropdown-item" href="/managePdt">Manage Product</a>
                </div>
            </li>
            <%
                }
            %>
            <li class="nav-item"><a class="nav-link" href="/howTo">How To</a></li>
            
            <% 
                if(session.getAttribute("login") != null && session.getAttribute("login").equals("1")) { 
            %>
            <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
            <% 
                } else{
                	 %>
                     <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                     <% 	
                }
            %>
        </ul>
    </div>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<script src="scripts/bootbox.js?v=61.44"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.1/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script>

$(document).ready(function() {
    $('.dropdown-toggle').dropdown();
    
});
$('.dropdown-toggle').on('click', function() {
    $(this).next('.dropdown-menu').toggle();
});
    function sendData() {
        var formData = {
            name: "efsd",
            father: "rew"
        };
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/api/endpoint",
            data: JSON.stringify(formData),
            success: function (response) {
                console.log("Response from server:", response);
            },
            error: function (error) {
                console.error("Error:", error);
            }
        });
    }
</script>

</body>
</html>
