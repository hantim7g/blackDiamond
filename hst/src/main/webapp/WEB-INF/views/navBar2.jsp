<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
<c:set value="${mktJson}" var="mktJson"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/logo.jpg"
	type="image/vnd.microsoft.icon">
<title>hst marketing</title>


<!-- <link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"> -->
<link type="text/css" href="css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap.min.css?v=61.44">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;display=swap"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/chosen.min.css?v=61.44">
<link rel="stylesheet" href="css/dataTables.bootstrap4.min.css?v=61.44">
<link rel="stylesheet" href="css/responsive.bootstrap4.min.css?v=61.44">

<link rel="stylesheet" href="css/bootstrap-datepicker.min.css?v=61.44">
<link href="css/digitalSignature.css?v=61.44" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="css/jquery.scrollbar.css?v=61.44">
<link rel="stylesheet" type="text/css" href="css/style.css?v=61.44">

<link rel="stylesheet" href="css/jquery-ui.min.css?v=61.44">
<link rel="stylesheet" type="text/css"
	href="css/jquery_Feedback.css?v=61.44">
<link rel="stylesheet" type="text/css" href="css/anno.css?v=61.44">
<link href="css/ProjectMain.css?v=61.44" rel="stylesheet">
<link rel="stylesheet" href="css/chatbot.css?v=61.44">

<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" href="css/statusbar.css" type="text/css">

<script type="text/javascript" src="scripts/jquery.min.js?v=61.44">
	
</script>


<script type="text/javascript" src="scripts/popper.min.js?v=61.44"></script>
<script type="text/javascript" src="scripts/bootstrap.min.js?v=61.44"></script>

<script src="scripts/jquery.scrollbar.min.js?v=61.44"></script>

<script src="scripts/jquery-ui.min-1.12.js?v=61.44"></script>
<script type="text/javascript" src="scripts/jquery_Feedback.js?v=61.44"></script>
<script src="scripts/chosen.jquery.min.js?v=61.44"></script>
<script src="scripts/anno.js?v=61.44"></script>
<script src="scripts/jquery.dataTables.min.js?v=61.44"></script>
<script src="scripts/dataTables.bootstrap4.min.js?v=61.44"></script>
<script src="scripts/dataTables.responsive.min.js?v=61.44"></script>
<script src="scripts/responsive.bootstrap4.min.js?v=61.44"></script>
<script src="scripts/bootstrap-datepicker.min.js?v=61.44"></script>
<script src="scripts/bootbox.js?v=61.44"></script>



<script type="text/javascript" src="scripts/frmUtils.js?v=61.44"></script>
<script type="text/javascript" src="scripts/statusbar.js?v=61.44"></script>

<script src="scripts/appMin.js?v=61.44"></script>
<script type="text/javascript"
	src="scripts/newCommonValidation.js?v=61.44"></script>
<script type="text/javascript"
	src="scripts/sessionExpiryAlert.js?v=61.44"></script>
<script src="scripts/leaflet.js?v=61.44"></script>
<script src="scripts/proj4-compressed.js?v=61.44"></script>

<script src="scripts/proj4leaflet.js?v=61.44"></script>

<script src="scripts/leaflet_awesome_markers.js?v=61.44"></script>
<script type="text/javascript" src="scripts/mostfunctions.js?v=61.44"></script>
<script type="text/javascript"
	src="scripts/jquery.binarytransport.js?v=61.44"></script>
<!-- new UI design css -->
<script type="text/javascript" src="scripts/declaration.js?v=61.44"></script>
<script type="text/javascript" src="scripts/multislider.js?v=61.44"></script>

<script type="text/javascript" src="scripts/main.js?v=61.44"></script>

<script src="scripts/appSummary.js?v=61.44"></script>


<link href="css/buttons.dataTables.min.css">
<script type="text/javascript" src="scripts/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="scripts/vfs_fonts.js"></script>
<script type="text/javascript" src="scripts/buttons.html5.min.js?v=2"></script>
<script type="text/javascript" src="scripts/buttons.print.min.js"></script>
<script src="scripts/bootbox.js?v=61.44"></script>
<script type="text/javascript" src="scripts/jszip.min.js"></script>


<script type="text/javascript" src="scripts/dgltContent.js?v=44461.44"></script>
<style>
        .green-menu .navbar-nav .nav-link {
            color: #fff !important;
        }
        .green-menu .navbar {
            background-color: #28a745; /* Green color */
        }
    </style>

</head>

</head>

<body><%-- 
<input type="text" id="mktJson" value="${mktJson}"/>
<input type="text" id="name" value="${mktJson.name}"/>
<input type="text" id="father" value="${mktJson.father}"/>
<input type="text" id="mother" value="${mktJson.mother}"/>
<input type="text" id="brother" value="${mktJson.brother}"/>
	 --%><nav
		class="navbar navbar-expand-xl navbar-expand-md bg-dark navbar-dark text-white py-0 px-3 d-flex">

		<div class="mainherder-logo">
			<ul>

				<li class="ministry"><span class="responsive_minis_hi"
					lang="hi"> <a target="_blank" href="http://abc.in/"
						class="text-decoration-none">hst</a>
				</span> <span class="li_eng responsive_minis_eng"> <a
						target="_blank" href="http://abc.in/" class="text-decoration-none"
						title="hst marketing home">Marketing</a>
				</span></li>
			</ul>

		</div>

		<button class="navbar-toggler" data-target="#topHeaderNav"
			data-toggle="collapse" type="button">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="topHeaderNav">
			<ul class="navbar-nav ml-auto align-items-center font-12">
				<li class="nav-item"><a
					class="nav-link opacity-1 font-12 skip-cont" href="#skipmain">
						Skip to main content </a></li>

				<!-- <li class="nav-item"><a
					class="nav-link opacity-1 font-14 font-weight-semi-bold"
					id="fontDecrease" href="javascript:;">A-</a></li>
				<li class="nav-item"><a
					class="nav-link opacity-1 font-14 font-weight-semi-bold"
					id="fontOrig" href="javascript:;">A</a></li>
				<li class="nav-item"><a
					class="nav-link opacity-1 font-14 font-weight-semi-bold"
					id="fontIncrease" href="javascript:;">A+ |</a></li> -->
				<li class="nav-item d-flex"><a class="nav-link opacity-1"
					href="tel:1800-572-1550"> <span class="font-12 pr-1">
							Helpline </span> <span class="font-14">1800-1234</span> <span
						class="pl-1"> / </span></a> <a class="nav-link opacity-1 font-14 pr-1"
					href="tel:1800-111-550"><span>1800-1234</span> |</a></li>

			</ul>



			<a class="opacity-1 font-12 text-white px-1 login-btn"
				data-toggle="modal" data-target="#loginModal"> <i
				class="fa fa-user-o"> </i> Login
			</a>

			<li class="nav-item"><a class="nav-link opacity-1 font-12"
				href="#" id="skip"
				onclick="javascript:loginPopup.openPopup();$('#Reg-main').trigger('click')">Register
			</a></li>


		</div>
	</nav>

	<div class="menu-navbar">
		<nav
			class="navbar navbar-expand-md bg-dark navbar-dark text-white px-2 d-flex">
			<!-- Brand -->
			<div class="menulogo">
				<a href="javascript:;" title="Home" rel="home" style=""
					class="home-logo"
					onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=Temp&amp;screenId=114&amp;menuCode=200925&amp;auditUSFlag=true');">
					<img src="images/logo.jpg" alt="logo" title="logo" height="50"
					width="50" padding="100">

				</a><br> <span class="mainlogotrade">hst marketing</span>
			</div>


			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler " type="button" data-toggle="collapse"
				data-target="#mainHeaderNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links -->
			<div class="collapse navbar-collapse" id="mainHeaderNav">
				<ul class="navbar-nav ml-auto align-items-center font-14 flex-wrap">



					<li id="200925" class="nav-item"><a tabindex="1"
						class="nav-link  opacity-1 target-link" href="javascript:;"
						onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=Temp&amp;screenId=114&amp;menuCode=200925&amp;auditUSFlag=true');">Home</a>
					</li>
					<li id="200925" class="nav-item"><a tabindex="1"
						class="nav-link  opacity-1 target-link" href="javascript:;"
						onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=Temp&amp;screenId=114&amp;menuCode=200925&amp;auditUSFlag=true');">New Order</a>
					</li>
					<li id="200925" class="nav-item"><a tabindex="1"
						class="nav-link  opacity-1 target-link" href="javascript:;"
						onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=Temp&amp;screenId=114&amp;menuCode=200925&amp;auditUSFlag=true');">Profile</a>
					</li>
					<li id="200925" class="nav-item"><a tabindex="1"
						class="nav-link  opacity-1 target-link" href="javascript:;"
						onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=Temp&amp;screenId=114&amp;menuCode=200925&amp;auditUSFlag=true');">Samples</a>
					</li>
					<li id="200925" class="nav-item"><a tabindex="1"
						class="nav-link  opacity-1 target-link" href="javascript:;"
						onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=Temp&amp;screenId=114&amp;menuCode=200925&amp;auditUSFlag=true');">How To</a>
					</li>
<!--use for drop down 					<li id="adminMenu" class="dropdown nav-item"><a tabindex="1"
						class="nav-link dropdown-toggle opacity-1" href="javascript:;"
						title="" data-toggle="dropdown">Admins</a>

						<ul class="dropdown-menu custom-dropdown-menu p-0">
							<li id="90000754" class="border-bottom"><a tabindex="1"
								class="dropdown-item font-12 target-link" href="javascript:;"
								onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=preview&amp;screenId=90000552&amp;Flag=true&amp;tmpltId=308000168&amp;cat=201&amp;menuCode=90000754&amp;auditUSFlag=true');">Manage</a></li>




							<li id="90000768" class="border-bottom"><a tabindex="1"
								class="dropdown-item font-12 target-link" href="javascript:;"
								onclick="menuAct('web?requestType=ApplicationRH&amp;actionVal=preview&amp;screenId=90000552&amp;Flag=true&amp;tmpltId=247&amp;cat=201&amp;menuCode=90000768&amp;auditUSFlag=true');">Add
									New</a></li>-->		
					</ul>
			</div>
		</nav>
	</div>
</body>
</html>
<%-- 
	<jsp:include page="login.jsp" /> --%>

<script>
function sendData() {
    // Prepare JSON payload from form data
    var formData = {
        name: "efsd",//$("#name").val(),
        father:"rew"//$("#age").val()
    };

    // Make AJAX request
    $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/api/endpoint", // Replace with your actual endpoint
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