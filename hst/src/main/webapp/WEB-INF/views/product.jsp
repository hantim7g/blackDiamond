
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Product</title>
<c:set value="${mktJson}" var="product" />
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Custom header background color */
.custom-header-bg {
	background-color: #840840;
	font-weight:bold;
	color: #ffffff; /* white text color for better visibility */
}

.shadow-card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	padding: 20px;
}
button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #840700;
}
/* Modal Styles */
/* Modal Styles */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-content {
    background-color: #fefefe;
    margin: auto; /* Center vertically and horizontally */
    padding: 20px;
    border: 1px solid #888;
    width: 60%; /* Set width to 60% of the viewport width */
    max-width: 500px; /* Maximum width of the modal */
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
}

/* Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>

	<jsp:include page="navBar.jsp" />
<div id="addNewBrands">
	<!-- Add this in addBrandModal.jsp -->
<div id="addBrandModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Add New Brand</h2>
        
        <form id="brandForm">
            <div class="form-group">
                <label for="newBrand">New Brand:</label>
                <input type="text" id="newBrand" name="newBrand" required>
            </div>
            
            <input class="custom-header-bg"  style="float:right;" type="button" value="Add new brand" onclick="addBrand()">
        </form>
    </div>
</div>
<!-- modal for platform  -->
<div id="addPlatformModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Add New Platform</h2>
        
        <form id="PlatformForm">
            <div class="form-group">
                <label for="newPlatform">New Platform:</label>
                <input type="text" id="newPlatform" name="newPlatform" required>
            </div>
            
            <input class="custom-header-bg"  style="float:right;" type="button" value="Add new Platform" onclick="addPlatform()">
        </form>
    </div>
</div>




<script>
// Function to display the modal
function showAddBrandModal() {
    var modal = document.getElementById('addBrandModal'); // Get the modal element by its ID
    modal.style.display = 'block'; // Set the modal display style to block to make it visible
}

function showAddPlatformModal() {
    var modal = document.getElementById('addPlatformModal'); // Get the modal element by its ID
    modal.style.display = 'block'; // Set the modal display style to block to make it visible
}

// Close the modal when the close button (x) is clicked
var closeButtons = document.getElementsByClassName('close');
for (var i = 0; i < closeButtons.length; i++) {
    closeButtons[i].onclick = function() {
        var modal = this.parentElement.parentElement; // Get the modal's parent element
        modal.style.display = 'none'; // Hide the modal
    };
}

// Close the modal when clicked outside of it
window.onclick = function(event) {
    var modals = document.getElementsByClassName('modal');
    for (var i = 0; i < modals.length; i++) {
        if (event.target == modals[i]) {
            modals[i].style.display = 'none'; // Hide the modal
        }
    }
}

    function addBrand() {
        var brandName = $("#newBrand").val();
        console.log(JSON.stringify({ brandName: brandName }));
        // AJAX call to save brand using Spring Boot controller
        $.ajax({
            url: '/saveBrand', 
            type: 'POST',
            contentType: 'application/json',  // Specify the content type as JSON
            data: JSON.stringify({ brandName: brandName }),  // Convert the data to JSON string
            dataType: 'json',  // Expected data type from the server
            success: function(response) {
                alert('Brand added successfully!');
                // Close the modal or refresh the page if needed
                window.location.href = '/product';
                
            },
            error: function(error) {
                alert('Failed to add brand. Please try again.');
            }
        });
    }
    
    
    function addPlatform() {
        var Platform = $("#newPlatform").val();
        console.log(JSON.stringify({ platform: Platform }));
        // AJAX call to save brand using Spring Boot controller
        $.ajax({
            url: '/saveplatform', 
            type: 'POST',
            contentType: 'application/json',  // Specify the content type as JSON
            data: JSON.stringify({ platform: Platform }),  // Convert the data to JSON string
            dataType: 'json',  // Expected data type from the server
            success: function(response) {
                alert('Platform added successfully!');
                // Close the modal or refresh the page if needed
                window.location.href = '/product';
            },
            error: function(error) {
                alert('Failed to add Platform. Please try again.');
            }
        });
    }
</script>
	
	</div>

		<div class="container mt-5">
		<div class="card shadow-card">
			<div class="card-body">
			<button onclick="showAddBrandModal()" class="custom-header-bg" style="float:right;">Add Brands</button>
			<button onclick="showAddPlatformModal()" class="custom-header-bg" style="float:right;">Add Platform</button>
			<input type="hidden" id="id" value='${product.id}'>
				<h2>Add Product</h2>

				<!-- Product Form -->
				<form id="productForm">

					<div class="form-group">
						<label for="Platform">Platform Name:</label> <select
							name="Platform" id="platform" class="form-control">
							<c:forEach items="${PlatformList}" var="item">
								<c:choose>
									<c:when test="${item.platform eq product.platform}">
										<option value="${item.platform}" selected>${item.platform}</option>
									</c:when>
									<c:otherwise>
										<option value="${item.platform}">${item.platform}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
		
		
		
		
		
					<div class="form-group">
						<label for="brandName">Brand Name:</label> <select
							name="brandName" id="brandName" class="form-control">
							<c:forEach items="${brandList}" var="brand">
								<c:choose>
									<c:when test="${brand.brandName eq product.brandName}">
										<option value="${brand.brandName}" selected>${brand.brandName}</option>
									</c:when>
									<c:otherwise>
										<option value="${brand.brandName}">${brand.brandName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="title">Product Title:</label> <input type="text"
							class="form-control" id="title" name="title"
							value="${product.title}" required>
					</div>

					<!-- Product Image URL -->
					<div class="form-group">
						<label for="imageURL">Product Image URL:</label> <input
							type="text" class="form-control" id="imageURL" name="imageURL"
							value="${product.imageURL}">
					</div>
					<div class="form-group">
						<label for="dealType">Deal Type:</label> <select class="form-control "
							id="dealType">
							<option value="Review"
								${product.dealType == 'Review' ? 'selected' : ''}>Review</option>
							<option value="Rating"
								${product.dealType == 'Rating' ? 'selected' : ''}>Rating</option>
							<option value="Only Order"
								${product.dealType == 'Only Order' ? 'selected' : ''}>Only Order</option>
							<option value="Exchange Deal"
								${product.dealType == 'Exchange Deal' ? 'selected' : ''}>Exchange Deal</option>
						</select>
					</div>
					<!-- Product Price -->
					<div class="form-group">
						<label for="price">Deal Price:</label> <input type="number"
							step="0.01" class="form-control" id="price" name="price"
							value="${product.price}" required>
					</div>

					<!-- Description Property Table -->
					<div class="form-group">
						<label>Product Description: </label>
<p>						<button type="button" class="btn btn-primary mb-3" id="addRowBtn">Add Property</button>
						<table id="descriptionTable"
							class="table table-bordered table-striped">
							<thead class="custom-header-bg">
								<tr>
									<th>Property</th>
									<th>Value</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${product.description}" var="pairDataDto">
									<tr>
										<td>${pairDataDto.property}</td>
										<td>${pairDataDto.value}</td>
										<td>
											<button type="button" class="btn btn-warning btn-sm editBtn">Edit</button>
											<button type="button" class="btn btn-danger btn-sm deleteBtn">Delete</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>

					<!-- BuyNow URL -->
					<div class="form-group">
						<label for="buyNowUrl">BuyNow URL:</label> <input type="text"
							class="form-control" id="buyNowUrl" name="buyNowUrl"
							value="${product.buyNowUrl}">
					</div>

					<!-- ASIN -->
					<div class="form-group">
						<label for="asin">ASIN:</label> <input type="text"
							class="form-control" id="asin" name="asin"
							value="${product.asin}">
					</div>

					<div class="form-group">
						<label for="asin">Seller:</label> <input type="text"
							class="form-control" id="seller" name="seller"
							value="${product.seller}" readonly>
					</div>
					<div class="form-group">
						<label for="slots">Available Slots:</label> <input type="number"
							class="form-control" id="slots" name="slots"
							value="${product.slots}">
					</div>
					<div class="form-group">
						<label for="totalSlots">Total Slots:</label> <input type="number"
							class="form-control" id="totalSlots" name="totalSlots"
							value="${product.totalSlots}">
					</div>
					<!-- Campaign Start Date Field -->
					<div class="row">
					<div class="col-md-4">
					<div class="form-group">
						<label for="cmpStartDt">Campaign Start Date:</label> <input
							type="date" id="cmpStartDt" name="cmpStartDt"
							class="form-control" value="${product.cmpStartDt}">
					</div>
					</div>
					<!-- Campaign End Date Field -->
					<div class="col-md-4">
					<div class="form-group">
						<label for="cmpEndDt">Campaign End Date:</label> <input
							type="date" id="cmpEndDt" name="cmpEndDt" class="form-control"value="${product.cmpEndDt}">
					</div>
					</div>
					</div>
					<!-- Save Button -->
					<button type="button" class="btn btn-success" id="saveProductBtn">Save</button>

				</form>
			</div>
		</div>
	</div>


	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 -->
	<script>
		$(document)
				.ready(
						function() {
							let table = $('#descriptionTable').DataTable();

							$('#addRowBtn')
									.click(
											function() {
												table.row
														.add(
																[
																		'<input type="text" class="form-control propertyInput" value="">',
																		'<input type="text" class="form-control valueInput" value="">',
																		'<button type="button" class="btn btn-success btn-sm saveBtn">Save</button>' ])
														.draw(false);
											});

							$(document)
									.on(
											'click',
											'.editBtn',
											function() {
												let row = $(this).closest('tr');
												let property = row.find(
														'td:eq(0)').text();
												let value = row
														.find('td:eq(1)')
														.text();

												row
														.find('td:eq(0)')
														.html(
																'<input type="text" class="form-control" value="' + property + '">');
												row
														.find('td:eq(1)')
														.html(
																'<input type="text" class="form-control" value="' + value + '">');
												row
														.find('td:eq(2)')
														.html(
																'<button type="button" class="btn btn-primary btn-sm updateBtn">Update</button>');
											});

							$(document).on(
									'click',
									'.deleteBtn',
									function() {
										table.row($(this).closest('tr'))
												.remove().draw(false);
									});

							$(document)
									.on(
											'click',
											'.saveBtn',
											function() {
												let row = $(this).closest('tr');
												let property = row.find(
														'.propertyInput').val();
												let value = row.find(
														'.valueInput').val();

												row.find('td:eq(0)').text(
														property);
												row.find('td:eq(1)')
														.text(value);
												row
														.find('td:eq(2)')
														.html(
																'<button type="button" class="btn btn-warning btn-sm editBtn">Edit</button> <button type="button" class="btn btn-danger btn-sm deleteBtn">Delete</button>');
											});

							$(document)
									.on(
											'click',
											'.updateBtn',
											function() {
												let row = $(this).closest('tr');
												let property = row.find(
														'input:eq(0)').val();
												let value = row.find(
														'input:eq(1)').val();

												row.find('td:eq(0)').text(
														property);
												row.find('td:eq(1)')
														.text(value);
												row
														.find('td:eq(2)')
														.html(
																'<button type="button" class="btn btn-warning btn-sm editBtn">Edit</button> <button type="button" class="btn btn-danger btn-sm deleteBtn">Delete</button>');
											});
							$('#saveProductBtn')
									.click(
											function() {
												// Capture product details
												let product = {
														id:$('#id').val(),
													title : $('#title').val(),
													imageURL : $('#imageURL')
															.val(),
													price : $('#price').val(),
													dealType:$('#dealType').val(),
													buyNowUrl : $('#buyNowUrl')
															.val(),
													asin : $('#asin').val(),
													seller : $('#seller').val(),
													slots : $('#slots').val(),
													brandName : $('#brandName')
															.val(),
													platform : $('#platform')
															.val(),
													totalSlots : $(
															'#totalSlots')
															.val(),
													cmpStartDt : $(
															'#cmpStartDt')
															.val(),
													cmpEndDt : $('#cmpEndDt')
															.val(),
													description : []
												};

												// Capture product description (property-value pairs)
												$('#descriptionTable tbody tr')
														.each(
																function() {
																	let property = $(
																			this)
																			.find(
																					'td:eq(0)')
																			.text();
																	let value = $(
																			this)
																			.find(
																					'td:eq(1)')
																			.text();
																	product.description
																			.push({
																				"property" : property,
																				"value" : value
																			});
																});

												console.log(JSON
														.stringify(product)); // For debugging

												// Make AJAX call
												$
														.ajax({
															url : '/saveproduct',
															type : 'POST',
															contentType : 'application/json',
															data : JSON
																	.stringify(product),
															success : function(
																	response) {
																bootbox
																		.alert({
																			title : 'Success',
																			message : 'Product Added Successfully.',
																			callback : function() {
																				window.location.href = '/home';
																			}
																		});
															},
															error : function(
																	error) {
																bootbox
																		.alert({
																			title : 'Error',
																			message : 'Failed to add product. Please try again.'
																		});
															}
														});
											});

						});
	</script>