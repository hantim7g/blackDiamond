<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Product Details</title>
     <style>
        /* Define a height for the scrollable container */
        #productTableContainer {
            max-height: 400px;  /* Adjust the height as needed */
            overflow-y: auto;   /* Enable vertical scroll */
        }
/* Style the button */
.buttons-excel {
    background-color: #840840;
    color: white; /* Text color */
    border: none; /* Remove border */
    padding: 8px 16px; /* Add some padding */
    border-radius: 4px; /* Add border-radius for rounded corners */
}

/* Hover effect for the button */
.buttons-excel:hover {
    background-color: #6e066e; /* Darken the color slightly on hover */
}

    </style>
</head>
<body>
<jsp:include page="navBar.jsp" />

<div class="container mt-5">
 <h2>Manage Products</h2>
    <table id="productTable" class="table table-striped table-bordered">
        <thead>
            <tr  style="background-color: #840840; color: white;">
                <th>Platform Type</th>
                <th>Brand Name</th>
                <th>Product Title</th>
                <th>Deal Type</th>
                <th>Deal Price</th>
                <th>Buy Now Link</th>
                <th>Campaign Start Date</th>
                <th>Campaign End Date</th>
                <th>Status</th>
                <th class="noExport">Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- JSTL Loop for products -->
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.platform}</td>
                    <td>${product.brandName}</td>
                    <td>${product.title}</td>
                    <td>${product.dealType}</td>
                    <td>${product.price}</td>
                    <td><a href="${product.buyNowUrl}" target="_blank">Click to Open</a></td>
                    <td>${product.cmpStartDt}</td>
                    <td>${product.cmpEndDt}</td>
                    <td>
                    
                    <%--  <button  onclick="updateStatus(${product.id}, this)" class="status-btn btn ${product.stopOrder == 0 ? 'btn-success' : 'btn-danger'}">
                            ${admin.status}
                        </button> 
                     --%>
                        <c:choose>
                            <c:when test="${product.stopOrder == 0}">
                                <button class=" btn btn-success" onclick="updateStatus(${product.id}, this)">On</button>
                            </c:when>
                            <c:otherwise>
                                <button class=" btn btn-danger" onclick="updateStatus(${product.id}, this)">Off</button>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td><button class="btn btn-primary" onclick="openProduct(${product.id})">Update</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

    <script type="text/javascript">$(document).ready(function() {
    	$('#productTable').DataTable({
    		
					dom : "Bfrtip",
					searching : true,
					scroll:true,
					info : true,
					serverSide: false,
					processing: true,
					 "scrollX": true,
					buttons : [
						{
							extend: 'excel',
							exportOptions: {
		                                    columns: "thead th:not(.noExport)"
		                         },
		                    text: function ( dt, button, config ) {
				                return dt.i18n( 'buttons.excel', 'Excel' );
				            },
				            filename: 'testExcel',
				            title: 'testExcel',
				            text: 'Export Excel',
						}]
    	});
    });

    function updateStatus(productId, buttonElement) {
        // AJAX call to update the status and refresh the table
        $.ajax({
            url: '/updateStatus/' + productId,
            method: 'PUT',
            success: function(response) {
                // Update button text and style based on the updated status
                if (response.stopOrder === 0) {
                    $(buttonElement).text('On').removeClass('btn-danger').addClass('btn-success');
                } else {
                    $(buttonElement).text('Off').removeClass('btn-success').addClass('btn-danger');
                }
            },
            error: function(error) {
                console.error('Error updating status:', error);
            }
        });
    }

    function openProduct(productId) {
        // Redirect to product detail page or open a modal
        window.location.href = '/productDetail?id=' + productId;
    }
</script>

</body>
</html>
