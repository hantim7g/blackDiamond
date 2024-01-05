<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Form</title>
<!-- 
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<style>
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
	<jsp:include page="navBar.jsp" />
	<div class="container mt-5">
		<h2>Order Form</h2>
		<form id="orderForm" class="shadow p-4 rounded">
			<!-- Hidden Fields -->
		      <input type="text" name="id" id="id" value="${order.id}">
		      <input type="text" name="profileDtlsId" id="profileDtlsId" value="${order.profileDtlsId}">
        <input type="text" name="viewer" id="viewer" value="${order.viewer}">
        <input type="text" name="orderStatus" id="orderStatus" value="${order.orderStatus}">
        <input type="text" name="affiliateStatus" id="affiliateStatus" value="${order.affiliateStatus}">
        			<!-- Buyer Name -->
			<div class="form-group">
				<label for="buyerName">Buyer Name <span class="text-danger">*</span></label>
				<input type="text" class="form-control" id="buyerName"
					name="buyerName"  value="${order.buyerName}" required>
			</div>

			<!-- Platform Dropdown -->
			<div class="form-group">
				<label for="Platform">Platform Name</label> <select name="Platform"
					id="platform" class="form-control">
					<c:forEach items="${PlatformList}" var="item">
						<c:choose>
							<c:when test="${item.platform eq order.platform}">
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
				<label for="brandName">Brand Name</label> <select name="brandName"
					id="brandName" class="form-control">
					<c:forEach items="${brandList}" var="brand">
					<c:choose>
							<c:when test="${brand.brandName eq order.brandName}">
								<option value="${brand.brandName}" selected>${brand.brandName}</option>
							</c:when>
							<c:otherwise>
								<option value="${brand.brandName}">${brand.brandName}</option>
							</c:otherwise>
						</c:choose>
						<%-- <option value="${brand.brandName}"
							${brand.brandName eq order.brandName ? 'selected' : ''}>${brand.brandName}</option> --%>
					</c:forEach>
				</select>
			</div>

			<!-- Product Dropdown -->
			<div class="form-group">
				<label for="product">Product</label> <select id="product" class="form-control">
					<c:forEach var="pdt" items="${productsList}" >
						<!-- Check if the current product is the one we want to preselect -->
						<c:choose>
							<c:when test="${pdt.title eq order.product}">
								<option value="${pdt.title}" selected>${pdt.title}</option>
							</c:when>
							<c:otherwise>
								<option value="${pdt.title}">${pdt.title}</option>
							</c:otherwise>
						</c:choose>
						
						<%-- <option value="${product}"
							${product eq order.product ? 'selected' : ''}>${product}</option> --%>
					</c:forEach>
				</select>

			</div>

			<!-- Deal Type -->
			<div class="form-group">
				<label for="dealType">Deal Type</label> <input type="text"
					class="form-control" id="dealType" name="dealType" value="${order.dealType}" readonly>
			</div>
			<!-- Deal Type -->
			<div class="form-group">
				<label for="dealPrice">Deal Price</label> <input type="text"
					class="form-control" id="dealPrice" name="dealPrice" value="${order.dealPrice}" readonly>
			</div>
			<!-- Order ID -->
			<div class="form-group">
				<label for="orderId">Order ID</label> <input type="text"
					class="form-control" id="orderId" name="orderId"
					onblur="validateOrderId(this.value)" value="${order.orderId}"> <small
					id="orderIdError" class="form-text text-danger"></small>
			</div>

			<!-- Order Date -->
			<div class="form-group">
				<label for="orderDate">Order Date</label> <input type="date"
					class="form-control" id="orderDate" name="orderDate" value="${order.orderDate}" required>
			</div>

			<!-- Order Amount -->
			<div class="form-group">
				<label for="orderAmount">Order Amount</label> <input type="number"
					class="form-control" id="orderAmount" name="orderAmount" value="${order.orderAmount}" required>
			</div>
			<div class="form-group reviewLinkC">
				<label for="reviewLink">Review Link</label> <input type="text"
					class="form-control" id="reviewLink" name="reviewLink" value="${order.reviewLink}" >
			</div>

			<!-- File Upload: Order Screenshot -->
			<div class="form-group orderScreenshotC">
				<label for="orderScreenshot">Order Screenshot</label> <input
					type="file" class="form-control-file" id="orderScreenshot"
					name="orderScreenshot" accept="image/*" value="${order.orderScreenshot}">
				<!-- View Link -->
					 <a class="d-none orderScreenshotView" href="${order.orderScreenshot}" target="_blank" >View</a>

				<a href="javascript:void(0);" id="viewOrderScreenshot"
					>Preview</a>
					<a href="javascript:void(0);" id="deleteOrderScreenshot" style="margin-left: 10px; color: red;">Delete</a>
					<div class="message" id="messageAreaorderScreenshot"></div>
				<!-- Image Preview -->
				<img id="orderScreenshotPreview" src="data:image/jpeg;base64,${order.orderScreenshotPreview}"
					alt="Order Screenshot Preview"
					style="max-width: 200px; display: none;">


			</div>

			<!-- Review Screenshot -->
			<div class="form-group reviewScreenshotC">
				<label for="reviewScreenshot">Review Screenshot</label> <input
					type="file" class="form-control-file" id="reviewScreenshot"
					name="reviewScreenshot" accept="image/*" value="${order.reviewScreenshot}">
					 <a class="d-none reviewScreenshotView" href="${order.reviewScreenshot}" target="_blank" >View</a>
					 <a href="javascript:void(0);" id="viewReviewScreenshot"
					>Preview</a> 
					<a href="javascript:void(0);" id="deleteReviewScreenshot" style="margin-left: 10px; color: red;">Delete</a>
					<div class="message" id="messageAreaorderScreenshot"></div>
					
					<img
					id="reviewScreenshotPreview" src="data:image/jpeg;base64,${order.reviewScreenshotPreview}"
					alt="Review Screenshot Preview"
					style="max-width: 200px; display: none;">
			</div>
			 <div class="form-group sellerFdScreenshotC">
            <label for="sellerFdScreenshot">Seller Feedback Screenshot</label> 
            <input type="file" class="form-control-file" id="sellerFdScreenshot" name="sellerFdScreenshot" accept="image/*" value="${sellerFeedback.sellerFdScreenshot}"> 
					 <a class="d-none sellerFdScreenshotView" href="${order.sellerFdScreenshot}" target="_blank" >View</a>
            
            <!-- Preview and Delete Links for Seller Feedback Screenshot -->
            <a href="javascript:void(0);" id="viewSellerFdScreenShot">Preview</a> 
            <a href="javascript:void(0);" id="deleteSellerFdScreenShot" style="margin-left: 10px; color: red;">Delete</a>
            <div class="message" id="messageAreasellerFdScreenshot"></div>
            <!-- Seller Feedback Screenshot Preview -->
            <img id="sellerFdScreenshotPreview" src="data:image/jpeg;base64,${sellerFeedback.sellerFdScreenshotPreview}" alt="Seller Feedback Screenshot Preview" style="max-width: 200px; display: none;">
        </div>
			<div class="form-group">
            <input type="checkbox" id="disclaimerCheckbox" name="disclaimerCheckbox" ${order.disclaimerCheckbox eq true ? 'checked' : ''}>
            <label for="disclaimerCheckbox">
                I have filled the order with my best knowledge. 
                The review and rating of the product are as per my choice. 
                I have not been forced to do anything in this regard.
            </label>
        </div>
			<!-- Save Button -->
			<button type="submit" class="btn btn-primary saveC">Save</button>
		</form>
	</div>

	<script>


$(document).ready(function() {
	$('#product').change(function() {
	    var selectedProduct = $(this).val();  // Get selected product value
	    var selectedBrandName = $('#brandName').val();  // Assuming you have a select element with id 'brandName' for brand selection
	    var selectedPlatform = $('#platform').val();  // Assuming you have a select element with id 'platform' for platform selection

	    // Make AJAX call to fetch details based on selected product, brandName, and platform
	    $.ajax({
	        url: '/fetchProductDetails',  // Endpoint URL
	        type: 'GET',
	        data: {
	            productName: selectedProduct,
	            brandName: selectedBrandName,
	            platform: selectedPlatform
	        },
	        success: function(response) {
	        	

	        	$('#dealPrice').val(response.dealPrice);  	        },
	        	$('#dealType').val(response.dealType);  	        },
	        error: function() {
	            alert('Error fetching product details!');
	        }
	    });
	});
 
	/*<option value="Unchecked">Unchecked</option>
                        <option value="Accepted">Accepted</option>
                        <option value="Rejected">Rejected</option>
                        <option value="Duplicated">Duplicated</option>  */
  var orderSt=$('#orderStatus').val();	
	if(orderSt=='Unchecked'){
		$('#brandName').prop('disabled', true);
		$('#product').prop('disabled', true);
		$('#orderDate').prop('readonly', true);
		$('#orderId').prop('readonly', true);
		$('#buyerName').prop('readonly', true);
		$('#orderAmount').prop('readonly', true);
		$('#platform').prop('disabled', true);
		$('.reviewLinkC').addClass('d-none');
		$('#orderScreenshot').addClass('d-none');
		$('.orderScreenshotView').removeClass('d-none');
		
		$('#viewOrderScreenshot').addClass('d-none');
		$('.reviewScreenshotC').addClass('d-none');
		$('.sellerFdScreenshotC').addClass('d-none');
		$('.saveC').addClass('d-none');
		$('#disclaimerCheckbox').prop('disabled', true);
		$('#deleteOrderScreenshot').addClass('d-none');
				
		
	} else if(orderSt=='' || orderSt=='Rejected'){
		$('.reviewLinkC').addClass('d-none');
		$('.reviewScreenshotC').addClass('d-none');
		$('.sellerFdScreenshotC').addClass('d-none');
		
	}else if(orderSt=='Duplicated'){
		$('#brandName').prop('disabled', true);
		$('#product').prop('disabled', true);
		$('#orderDate').prop('readonly', true);
		$('#orderId').prop('readonly', true);
		$('#buyerName').prop('readonly', true);
		$('#orderAmount').prop('readonly', true);
		$('#platform').prop('disabled', true);
		$('.reviewLinkC').addClass('d-none');
		$('.orderScreenshotC').addClass('d-none');
		$('.reviewScreenshotC').addClass('d-none');
		$('.sellerFdScreenshotC').addClass('d-none');
		$('.saveC').addClass('d-none');
		$('#disclaimerCheckbox').prop('disabled', true);
				
	}else if(orderSt=='Accepted'){
		$('#brandName').prop('disabled', true);
		$('#product').prop('disabled', true);
		$('#orderDate').prop('readonly', true);
		$('#orderId').prop('readonly', true);
		$('#buyerName').prop('readonly', true);
		$('#orderAmount').prop('readonly', true);
		$('#platform').prop('disabled', true);
		$('.reviewLinkC').addClass('d-none');
		$('#orderScreenshot').addClass('d-none');
		$('.orderScreenshotView').removeClass('d-none');
		$('#viewOrderScreenshot').addClass('d-none');
		$('#disclaimerCheckbox').prop('disabled', true);
		$('#deleteOrderScreenshot').addClass('d-none');
			
	}
	
	
	
	 $('#platform').on('change', function() {
         var selectedPlatform = $(this).val(); // Get the selected platform value

         // Make AJAX call to fetch brands for the selected platform
         $.ajax({
             url: '/activeBrand',
             method: 'GET',
             data: { platform: selectedPlatform }, // Pass the selected platform as data
             success: function(response) {
                 // Clear existing options and populate with new ones
                 $('#brandName').empty();
                 $.each(response, function(index, brand) {
                     $('#brandName').append($('<option>', {
                         value: brand,
                         text: brand
                     }));
                 });
                 
                 
                 $('#brandName').trigger('change');
                 
                 
             },
             error: function(error) {
                 console.error("Error fetching brands:", error);
             }
         });
     });

	 $('#brandName').on('change', function() {
		    var selectedBrandName = $(this).val();  // Get the selected brandName value
		    var selectedPlatform = $('#platform').val();  // Assuming you have a select element with id 'platform' for platform selection

		    // Make AJAX call to fetch products for the selected brandName and platform
		    $.ajax({
		        url: '/activeProduct',  // Endpoint URL
		        method: 'GET',
		        data: {
		            brandName: selectedBrandName,
		            platform: selectedPlatform
		        },
		        success: function(response) {
		            // Clear existing options and populate with new ones
		            $('#product').empty();
		            $.each(response, function(index, product) {
		                $('#product').append($('<option>', {
		                    value: product.title,
		                    text: product.title
		                }));
		            });
		            $('#product').trigger('change');
		        },
		        error: function(error) {
		            console.error("Error fetching products:", error);
		        }
		    });
		});

	 
	 
        function viewReviewImageInPopup() {
            var imageUrl = document.getElementById('reviewScreenshotPreview').src;
           // console.log('reviewScreenshotPreview'+imageUrl);
            if (imageUrl) {
                var blobUrl = dataURLtoBlobUrl(imageUrl);
                window.open(blobUrl, '_blank', 'width=800,height=600');
            }
        }

        // Preview Review Screenshot when user selects a file
        document.getElementById('reviewScreenshot').addEventListener('change', function() {
            var file = this.files[0];
            var reader = new FileReader();

            reader.onload = function(e) {
                // Display image preview for Review Screenshot
                document.getElementById('reviewScreenshotPreview').src = e.target.result;
                
                // Display view link for Review Screenshot
                document.getElementById('viewReviewScreenshot').style.display = 'inline';
            }

            reader.readAsDataURL(file);
            uploadFile('reviewScreenshot');
        }); 

        // Attach click event to view link for Review Screenshot
        document.getElementById('viewReviewScreenshot').addEventListener('click', viewReviewImageInPopup);
     // Function to view Seller Feedback Screenshot in a popup
        function viewSellerFdImageInPopup() {
            var imageUrl = document.getElementById('sellerFdScreenshotPreview').src;
            if (imageUrl) {
                var blobUrl = dataURLtoBlobUrl(imageUrl);
                window.open(blobUrl, '_blank', 'width=800,height=600');
            }
        }

        // Preview Seller Feedback Screenshot when user selects a file
        document.getElementById('sellerFdScreenshot').addEventListener('change', function() {
            var file = this.files[0];
            var reader = new FileReader();

            reader.onload = function(e) {
                // Display image preview for Seller Feedback Screenshot
                document.getElementById('sellerFdScreenshotPreview').src = e.target.result;
                
                // Display view link for Seller Feedback Screenshot
                document.getElementById('viewSellerFdScreenShot').style.display = 'inline';
            }

            reader.readAsDataURL(file);
            uploadFile('sellerFdScreenshot');
        }); 

        // Attach click event to view link for Seller Feedback Screenshot
        document.getElementById('viewSellerFdScreenShot').addEventListener('click', viewSellerFdImageInPopup);

        
        
        
     // Function to convert Data URL to Blob URL
        function dataURLtoBlobUrl(dataUrl) {
        
            var arr = dataUrl.split(',');
            if(arr[0].match(/:(.*?);/)==null){
            	bootbox.alert('Please upload image.');
            }
            var mime = arr[0].match(/:(.*?);/)[1];
            var bstr = atob(arr[1]);
            var n = bstr.length;
            var u8arr = new Uint8Array(n);
            
            while (n--) {
                u8arr[n] = bstr.charCodeAt(n);
            }
            
            var blob = new Blob([u8arr], { type: mime });
            return URL.createObjectURL(blob);
        	
                	
                
        	
        }

        // Function to display image in popup
        function viewImageInPopup() {
            var imageUrl = document.getElementById('orderScreenshotPreview').src;
            if (imageUrl) {
                var blobUrl = dataURLtoBlobUrl(imageUrl);
                window.open(blobUrl, '_blank', 'width=800,height=600');
            }
        }

        // Preview image when user selects a file
        document.getElementById('orderScreenshot').addEventListener('change', function() {
            var file = this.files[0];
            var reader = new FileReader();

            reader.onload = function(e) {
                // Display image preview
                document.getElementById('orderScreenshotPreview').src = e.target.result;
              //  document.getElementById('orderScreenshotPreview').style.display = 'block';
                
                // Display view link
                document.getElementById('viewOrderScreenshot').style.display = 'inline';
            }

            reader.readAsDataURL(file);
            uploadFile('orderScreenshot');
        }); 

        // Attach click event to view link
        document.getElementById('viewOrderScreenshot').addEventListener('click', viewImageInPopup);
    
        
        
    /*     // Preview order screenshot
        $("#orderScreenshot").change(function() {
            readURL(this, '#orderScreenshotPreview');
        });

 */        // Preview review screenshot
   /*      $("#reviewScreenshot").change(function() {
            readURL(this, '#reviewScreenshotPreview');
        });

 */        // Handle form submission
        $('#orderForm').submit(function(e) {
            e.preventDefault();
            

            // Create an empty object to store form data
            var formData = {};

            // Collect data from input fields
            formData.id = $('#id').val();
            formData.viewer = $('#viewer').val();
            formData.orderStatus = $('#orderStatus').val();
            formData.profileDtlsId=$('#profileDtlsId').val();
            formData.affiliateStatus = $('#affiliateStatus').val();
            formData.buyerName = $('#buyerName').val();
            formData.platform = $('#platform').val();
            formData.brandName = $('#brandName').val();
            formData.product = $('#product').val();
            formData.dealType = $('#dealType').val();
            formData. dealPrice=$('#dealPrice').val();
            formData.orderId = $('#orderId').val();
            formData.orderDate = $('#orderDate').val();
            formData.orderAmount = $('#orderAmount').val();
            formData.disclaimerCheckbox=$("#disclaimerCheckbox").is(':checked');
            formData.orderScreenshot = $('#orderScreenshot').val(); 
            formData.reviewScreenshot = $('#reviewScreenshot').val();
            formData.sellerFdScreenshot = $('#sellerFdScreenshot').val();

            $.ajax({
                url: '/ordersSave',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                	 alert('Order saved successfully!');
                },
                error: function(error) {
                	 alert('Error saving order!');
                }
            });
           // var formData = $(this).serialize();
            /* $.post("/ordersSave", jsonData, function(response) {
                alert('Order saved successfully!');
            }).fail(function() {
                alert('Error saving order!');
            }); */
        });
 		if($('#id').val()=='' || $('#id').val()=='undefined' || $('#id').val()==null){
        $('#platform').trigger('change');
        $('#brandName').trigger('change');
        $('#product').trigger('change');}
    });

    function readURL(input, previewElement) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function(e) {
                $(previewElement).attr('src', e.target.result).show();
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }

    function validateOrderId(orderId) {
        if (orderId.length < 5) {
            $('#orderIdError').text('Order ID should be at least 5 characters');
        } else {
            $('#orderIdError').text('');
        }
        var orderId = $('#orderId').val(); // Assuming you have an input field with this ID

        // Make AJAX request to check if order exists
        $.ajax({
            url: '/checkOrder',
            type: 'GET',
            data: {
                orderId: orderId
            },
            success: function(response) {
                if (response) {
                    // Handle logic when order exists
                     $('#orderIdError').text('OrderId already exists.Please try with another.');
                     $('#orderId').val();
                } else {
                    // Handle logic when order does not exist
                    console.log('Order does not exist');
                    
                }
            },
            error: function(error) {
                console.error('Error checking order:', error);
            }
        });
    }
    $('#deleteOrderScreenshot').on('click', function() {
        // Clear the file input
        $('#orderScreenshot').val('');
    });
    
    $('#deleteReviewScreenshot').on('click', function() {
        // Clear the file input
        $('#reviewScreenshot').val('');
    });
    $('#deleteSellerFdScreenShot').on('click', function() {
        // Clear the file input
        $('#sellerFdScreenshot').val('');
    });

    function uploadFile(id) {
            const formData = new FormData();
            const fileInput = document.getElementById(id).files[0];
            
            if (!fileInput) {
                displayMessage('error', 'Please select a file.',id);
                return;
            }

            formData.append('fileUpload', fileInput);

            fetch('/upload', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    displayMessage('success', 'File uploaded successfully!',id);
                } else {
                    displayMessage('error', 'Failed to upload the file.',id);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                displayMessage('error', 'An error occurred while uploading.',id);
            });
        }

        function displayMessage(status, message,id) {
            const messageArea = document.getElementById('messageArea'+id);
            messageArea.innerText = message;
    		messageArea.classList.remove('d-none');
            if (status === 'success') {
                messageArea.classList.add('success');
                messageArea.classList.remove('error');
            } else {
                messageArea.classList.add('error');
                messageArea.classList.remove('success');
            }
             setTimeout(function() {
            messageArea.classList.add('d-none'); // Clear the content
           messageArea.classList.remove('success');  // Remove any classes
                  messageArea.classList.remove('error');  // Remove any classes

        }, 10000);
        }

</script>

</body>
</html>
