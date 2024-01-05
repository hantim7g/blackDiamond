<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Table</title>

<!--     Bootstrap CSS
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    DataTables CSS
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.4/css/dataTables.bootstrap4.min.css">

    jQuery library
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    Bootstrap JS
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    DataTables JS
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.4/js/dataTables.bootstrap4.min.js"></script>

 -->    <style>
        /* Add any custom styles here if needed */
        .image-link:hover {
            cursor: pointer;
        }
    </style>
</head>
<body>
<jsp:include page="navBar.jsp" />

<div class="container mt-5">
<form id="searchForm">
<div class="row">
        <!-- First Row -->
            
                <div class="form-group">
                    <label for="brandName" style="font-weight: bold;">Brand :</label>
                    <select id="brandName" class="form-control" style="width: 150px;">
                       	<option value="-1" selected>Please select</option>
                        <c:forEach items="${brands}" var="brand">
                            <option value="${brand}">${brand}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="orderStatus" style="font-weight: bold;">Order Status:</label>
                    <select id="orderStatus" class="form-control">
                    	<option value="-1" selected>Please select</option>
                        <option value="Unchecked">Unchecked</option>
                        <option value="Accepted">Accepted</option>
                        <option value="Rejected">Rejected</option>
                        <option value="Duplicated">Duplicated</option>
                    </select>
                </div>
                <div class="form-group" style="font-weight: bold;">
                    <label for="reviewStatus">Review Status:</label>
                    <select id="reviewStatus" class="form-control">
                    	<option value="-1" selected>Please select</option>
                        <option value="Unchecked">Unchecked</option>
                        <option value="Accepted">Accepted</option>
                        <option value="Rejected">Rejected</option>
                        <option value="Duplicated">Duplicated</option>
                    </select>
                </div>
           
                <div class="form-group" style="font-weight: bold;">
                    <label for="fromDate">Order From:</label>
                    <input type="date" id="fromDate" class="form-control">
                </div>
                
                <div class="form-group" style="font-weight: bold;">
                    <label for="toDate">Order To:</label>
                    <input type="date" id="toDate" class="form-control">
                </div>
        
                <div class="form-group" style="font-weight: bold;">
                    <label for="orderId">Order ID:</label>
                    <input type="text" id="orderId" class="form-control" placeholder="Enter Order ID" style="width: 150px;">
                </div>
                <div class="form-group" style="font-weight: bold;">
                    <label for="productId">Product:</label>
                    <input type="text" id="product" class="form-control" placeholder="Enter Product" style="width: 150px;">
                </div>
             <div class=" align-self-end">
                <div class="form-group" style="font-weight: bold;">
    		 <button type="button" id="searchBtn" class="  btn btn-primary btn-block">Search</button>
        </div>    
        </div>
        </div>
         </form>
<h2>Manage Orders Table</h2>
    <table id="orderTable" class="table table-striped table-bordered" style="width:100%">
        <thead style="background-color: #840840; color: white;">
            <tr>
                <th>Brand</th>
                <th>Product</th>
                <th>Order Date</th>
                <th>Order ID</th>
                <th>Buyer Name</th>
                <th>Order Screenshot</th>
                <th>Review Link</th>
                <th>Review Screenshot</th>
                <th>Seller Feedback Screenshot</th>
                <th>Order Amount</th>
                <th>Refund Amount</th>
                <th>Order Status</th>
                <th>Affiliate Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%-- Assuming orderList is a List<Order> attribute set in your servlet --%>
            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.brandName}</td>
                    <td>${order.product}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.orderId}</td>
                    <td>${order.buyerName}</td>
                    <td><a href="${order.orderScreenshot}" target="_blank" >View</a></td>
                    <td><a href="${order.reviewLink}" target="_blank">${order.reviewLink}</a></td>
                    <td><a href="#" class="image-link" data-path="${order.reviewScreenshot}">View</a></td>
                    <td><a href="#" class="image-link" data-path="${order.sellerFdScreenshot}">View</a></td>
                    <td>${order.orderAmount}</td>
                    <td>${order.refundAmount}</td>
                    <%-- <td><a href="#" class="status-link">${order.orderStatus}</a></td> --%>
                    <td>${order.orderStatus}<br><a href='${order.orderStatus}' target='_blank'>Comment</a></td>
                    <td>${order.affiliateStatus}</td>
                    <td><button class="update-btn btn btn-primary" onClick='update(${order.id})'>Update</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script>
$(document).ready(function() {
    $("#searchBtn").click(function() {
        /* var formData = {
            brandName: $("#brandName").val(),
            orderStatus: $("#orderStatus").val(),
            reviewStatus: $("#reviewStatus").val(),
            fromDate: $("#fromDate").val(),
            toDate: $("#toDate").val(),
            orderId: $("#orderId").val(),
            product: $("#product").val()
        }; */

        const searchCriteria = {
                brandName: document.getElementById("brandName").value || null,
                orderStatus: document.getElementById("orderStatus").value || null,
                reviewStatus: document.getElementById("reviewStatus").value || null,
                fromDate: document.getElementById("fromDate").value || null,
                toDate: document.getElementById("toDate").value || null,
                orderId: document.getElementById("orderId").value || null,
                product: document.getElementById("product").value || null
            };

        
        
        $.ajax({
            url: '/searchOrders',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(searchCriteria),
            success: function(orders) {
                // Clear existing table rows
                $("#orderTable tbody").empty();
                var consumArr =orders;
        		
    			var consudata = [];
    		
    			if (consumArr.length > 0) {
    				
    				for (var consu = 0; consu < consumArr.length; consu++) {
    				    var tr = "<tr>";

    				    tr += "<td>" + (consumArr[consu].brandName || '') + "</td>";
    				    tr += "<td>" + (consumArr[consu].product || '') + "</td>";
    				    tr += "<td>" + (consumArr[consu].orderDate || '') + "</td>";
    				    tr += "<td>" + (consumArr[consu].orderId || '') + "</td>";
    				    tr += "<td>" + (consumArr[consu].buyerName || '') + "</td>";
    				    tr += "<td><a href='" + (consumArr[consu].orderScreenshot || '#') + "' target='_blank'>View</a></td>";
    				    tr += "<td><a href='" + (consumArr[consu].reviewLink || '#') + "' target='_blank'>Click</a></td>";
    				    tr += "<td><a href='#' class='image-link' data-path='" + (consumArr[consu].reviewScreenshot || '#') + "'>View</a></td>";
    				    tr += "<td><a href='#' class='image-link' data-path='" + (consumArr[consu].sellerFdScreenshot || '#') + "'>View</a></td>";
    				    tr += "<td>" + (consumArr[consu].orderAmount || '') + "</td>";
    				    tr += "<td>" + (consumArr[consu].refundAmount || '') + "</td>";
    				    tr += "<td>"+(consumArr[consu].orderStatus || '')+"<br><a href='" + (consumArr[consu].afflicateComment || '#') + "' target='_blank'>Comment</a></td>";
    				    tr += "<td>" + (consumArr[consu].affiliateStatus || '') + "</td>";
    				    tr += "<td><button class='update-btn btn btn-primary' onClick='update("+ consumArr[consu].id+")'>Update</button></td>";

    				    tr += "</tr>";
    				    
    				    consudata.push(tr);
    				}
	$("#orderTable tbody").html(consudata);
    			}
/*                 // Iterate over the orders array using a for loop
                for (let i = 0; i < orders.length; i++) {
                    const order = orders[i];
                    
                    // Format the orderDate
                    const formattedDate = new Date(order.orderDate).toLocaleDateString();

                    // Create a table row string with the formatted data
                    const row = `
                    	<tr>
                        <td>${order.brandName}</td>
                        <td>${order.product}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.orderId}</td>
                        <td>${order.buyerName}</td>
                        <td><a href="${order.orderScreenshot}" target="_blank" >View</a></td>
                        <td><a href="${order.reviewLink}" target="_blank">${order.reviewLink}</a></td>
                        <td><a href="#" class="image-link" data-path="${order.reviewScreenshot}">View</a></td>
                        <td><a href="#" class="image-link" data-path="${order.sellerFdScreenshot}">View</a></td>
                        <td><a href="#" class="status-link">${order.orderStatus}</a></td>
                        <td>${order.affiliateStatus}</td>
                        <td><button class="update-btn btn btn-primary">Update</button></td>
                    </tr>`;

                    // Append the table row to the tbody
                    $("#orderTable tbody").append(row);
                } */
            },
            error: function(error) {
                console.log("Error occurred:", error);
            }
        });
    });
});

$(document).ready(function() {
    $('#orderTable').DataTable({
        "columnDefs": [
            { "type": "date", "targets": [2] },
            { "targets": [5, 6, 7, 8], "orderable": false }
        ],
        "order": [[2, "desc"]]
    });

    // Handle image link clicks
    $('.image-link').click(function(e) {
        e.preventDefault();
        let imagePath = $(this).data('path');
        window.open(imagePath, '_blank');
    });

    // Handle hover for order status
    $('.status-link').hover(function() {
        alert($(this).text());
    });

   
    
    
    // Handle update button click
   /*  $('.update-btn').click(function() {
        alert('Update clicked!');
    }); */
});
var update =function(id){
    window.location.href = '/orderDetailsFetch?id=' + id;
	
	
};

</script>

</body>
</html>
