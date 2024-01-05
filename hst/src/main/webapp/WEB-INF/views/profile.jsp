

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="navBar.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Profile Page</title>
<c:set value="${mktJson}" var="mktJson" />
<c:set value="${role}" var="userRole" />



<style>
form {
	/* Set a width for the form for demonstration */
	padding: 20px; /* Add padding for spacing */
	border-radius: 8px; /* Add rounded corners for aesthetics */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow effect */
	font-weight: bold;
}

.profile-data {
	flex: 3;
}

.profile-container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	object-fit: cover;
	margin-bottom: 20px;
}

.right-align {
	float: right;
}

.profile-name {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.profile-item {
	margin-bottom: 10px;
	font-weight: bold;
}

.sub-profileItem {
	margin-bottom: 10px;
	font-weight: normal;
	float: right;
	justify-content: flex-end; /* Align content to the end (right) */
}

.data-edit {
	flex: 4;
}

/* .button-container {
	margin-top: 50px;
	text-align: center;
	background-color: #840840;
	padding: 20px;
} */

.data-ceter {
	display: grid;
	place-items: center;
	height: 100vh;
	margin: 0;
}

.btn-white {
	background-color: #fff !important;
	color: #fff !important;
	
}

.btn-pink {
	background-color: #840840 !important;
	
	font-colour: #fff;
}
.newPassword-error {
            color: #dc3545;
        }
    .form-text {
    color: red;
}
.message {
            font-weight: bold;
            margin-top: 10px;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
</style>


</head>
<body>
  
	<div class="row ">
		<div class="md-6 profile-data">

			<div class="container">
				<div class="profile-container">
					<img src="data:image/jpeg;base64,${mktJson.profilePicView}"
						alt="Image" class="profile-image">
					<div class="profile-name">${mktJson.firstName}</div>
					<div class="profile-item">
						Joined On:<span class="sub-profileItem"> ${mktJson.joinDate}</span>
					</div>
					<div class="profile-item">
						Paid/ Total Orders:<span class="sub-profileItem"> 3/3</span>
					</div>
					<div class="profile-item">
						Nov/ Oct/ Dec:<span class="sub-profileItem"> 1/0/0</span>
					</div>
				</div>
			</div>

			
		</div>
		<div class="md-6 data-edit">
			<div class="container">
			<style>
        .button-container {
            text-align: center; /* Centers the buttons horizontally */
        }
        .button-container button {
            width: calc(100% / 4 - 10px); /* Set width to approximately one-third and minus some padding/margin */
            margin: 5px; /* Add some margin to space out the buttons */
            font-weight: bold;
            background-color: #840840;
            color: white;
        }
    </style>

   <div class="button-container">
    <c:if test="${userRole eq 'Admin'}">
		
		 <a class="btn btn-primary btn-pink" href="/manageUser" style="margin-top: 10px;font-weight: bold; flex: 5; float:right;" >Manage Other Profiles</a>
			</c:if> 	
			<br><br>
        <button type="button" class="btn btn-primary btn-pink" onclick="changeColor(this); viewTab(1)">Personal Info</button>
        <button type="button" class="btn btn-primary btn-pink" onclick="changeColor(this); viewTab(2)">Bank Info</button>
        <button type="button" class="btn btn-primary btn-pink" onclick="changeColor(this); viewTab(3)">Settings</button>
    
    </div>
				<!-- <div class="button-container">
					<button type="button" class="btn btn-primary btn-pink" style="font-weight: bold;" onclick="changeColor(this);viewTab(1)">Personal Info</button>
<button type="button" class="btn btn-primary btn-pink" style="font-weight: bold;" onclick="changeColor(this);viewTab(2)">Bank Info</button>
<button type="button" class="btn btn-primary btn-pink" style="font-weight: bold;" onclick="changeColor(this);viewTab(3)">Settings</button>
				</div> -->
				<script>
					function changeColor(clickedButton) {
						// Remove btn-white class from all buttons
						var buttons = document.querySelectorAll('.btn');
						buttons.forEach(function(button) {
							button.classList.remove('btn-white');
						});

						// Add btn-white class to the clicked button
						clickedButton.classList.add('btn-white');
					}
				</script>
			</div>
			<%-- <input   type="text" id="mktJson" value="${mktJson}"/> --%>
			<input type="hidden" class="form-control" id="profileDtlsId"
				value="${mktJson.profileDtlsId}"> <br>
			<div class="profileId container">

				<form action="">
					<div class="form-group">
						<label for="firstName">Name:</label> <input type="text"
							class="form-control" id="firstName" placeholder="Enter Name"
							value="${mktJson.firstName}">
					</div>
					<div class="form-group">
						<label for="lastName">Surname:</label> <input
							value="${mktJson.lastName}" type="text" class="form-control"
							id="lastName" placeholder="Enter Surname">
					</div>
					<div class="form-group">
						<label for="whatsappNumber">Whatsapp Number:</label> <input
							value="${mktJson.whatsappNumber}" type="text"
							class="form-control" id="whatsappNumber"
							placeholder="Enter Whatsapp Number">
					</div>
					<div class="form-group">
						<label for="profilePicPath">Profile Picture:</label> <div class="row"><input
							value="${mktJson.profilePicPath}" type="file"
							class="col-md-6 form-control-file" id="profilePicPath"></div> <input type="button" value="Upload" onclick="uploadFile('profilePicPath');" /><div class="message" id="messageAreaprofilePicPath"></div>
					</div>
 <c:if test="${userRole eq 'Admin'}">					<div class="form-group">
						<label for="role">Role: </label> 
						<select
							class="form-control " id="role" >
							<option value="Pending For Approval" ${mktJson.role == 'Pending For Approval' ? 'selected' : ''} >Pending For Approval</option>
							<option value="Buyer" ${mktJson.role == 'Buyer' ? 'selected' : ''} >Buyer</option>
							<option value="Manager" ${mktJson.role == 'Manager' ? 'selected' : ''} >Manager</option>
							<option value="Seller" ${mktJson.role == 'Seller' ? 'selected' : ''} >Seller</option>
							<option value="Admin"${mktJson.role == 'Admin' ? 'selected' : ''} >Admin</option>
						</select>
					</div>
					<div class="form-group">
						<label for="status">Status:</label> 
						<select
							class="form-control " id="status" >
							<option value="Pending For Approval" ${mktJson.role == 'Pending For Approval' ? 'selected' : ''} >Pending For Approval</option>
							<option value="Active" ${mktJson.status == 'Active' ? 'selected' : ''} >Active</option>
							<option value="Inactive" ${mktJson.status == 'InActive' ? 'selected' : ''} >Inactive</option>
						</select>
						</div>
					</c:if>
					<button type="button" class="btn btn-primary"
						onclick="saveUserData()">Update</button>
				</form>
			</div>
			<div class="alert alert-success" role="alert" style="display: none;"
				id="successMessage">User data saved successfully!</div>

			<div class="walletId d-none container">

				<form action="">
					<div class="form-group">
						<label for="paytm">Paytm:</label> <input value="${mktJson.paytm}"
							type="text" class="form-control" id="paytm"
							placeholder="Enter Paytm No">
					</div>
					<div class="form-group">
						<label for="upi">UPI:</label> <input value="${mktJson.upi}"
							type="text" class="form-control" id="upi"
							placeholder="Enter UPI Id">
					</div>

					<div class="form-group">
						<label for="qrPicture">QR:</label> <input
							value="${mktJson.qrPicture}" type="file"
							class="form-control-file" id="qrPicture"><input type="button" value="Upload" onclick="uploadFile('qrPicture');" /><div class="message" id="messageAreaqrPicture"></div>
					</div>
					<button type="button" class="btn btn-primary"
						onclick="saveUserData()">Update Wallet</button>
				</form>
			</div>
			<div class="bankId d-none container">
				<br>
				<h4>Bank Details</h4>
				<form action="">
					<div class="form-group">
						<label for="accHolderName">Account Holder Name:</label> <input
							value="${mktJson.accHolderName}" type="text" class="form-control"
							id="accHolderName" placeholder="Enter Account Holder Name">
					</div>
					<div class="form-group">
						<label for="accNo">Account No.:</label> <input
							value="${mktJson.accNo}" type="text" class="form-control"
							id="accNo" placeholder="Enter Account No.">
					</div>
					<div class="form-group">
						<label for="ifsc">IFSC:</label> <input value="${mktJson.ifsc}"
							type="text" class="form-control" id="ifsc"
							placeholder="Enter IFSC">
					</div>


					<button type="button" class="btn btn-primary"
						onclick="saveUserData()">Update Bank</button>
				</form>
			</div>
			<div class="loginId d-none container">


				<form action="">
					<div class="form-group">
						<label for="loginMail">Login Email:</label> <input
							value="${mktJson.loginMail}" type="text" class="form-control"
							id="loginMail" placeholder="Enter Login Email Id">
					</div>
					<button type="button" class="btn btn-primary"
						onclick="saveUserData()">Update</button>
					<div class="form-group">
						<label for="newPassword">New Passwword:</label> <input
							value="${mktJson.newPassword}" type="text" class="form-control"
							id="newPassword" placeholder="Enter Password">
							<small class="form-text newPassword-error" id="newPasswordError"></small>
					</div>
					<div class="form-group">
						<label for="confirmNewPassword">Confirm New Passwword</label> <input
							value="${mktJson.newPassword}" type="text" class="form-control"
							id="confirmNewPassword" placeholder="Enter Password">
							<small class="form-text newPassword-error" id="confirmNewPasswordError"></small>
					</div>


					<button type="button" class="btn btn-primary"
						onclick="saveUserData()">Update</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript" src="scripts/profile.js">
	
</script>