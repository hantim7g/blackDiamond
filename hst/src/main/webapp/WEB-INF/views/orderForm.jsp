<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="navBar.jsp" />
    <meta charset="UTF-8">
    <title>Order Form</title>
    <!-- Custom CSS for required field -->
    <style>
        .required-field {
            color: red;
            margin-left: 5px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Order Form</h2>
    <form id="orderForm" class="shadow p-4 rounded">
        <!-- Order Status Dropdown -->
        <div class="form-group">
            <label for="orderStatus">Order Status: <span class="required-field">*</span></label>
            <select class="form-control required" id="orderStatus">
                <option value="Placed">Placed</option>
                <option value="Shipped">Shipped</option>
                <option value="Delivered">Delivered</option>
                <option value="Return">Return</option>
            </select>
          <div class="invalid-feedback"></div></div>
        <!-- Refund Status Dropdown -->
        <div class="form-group">
            <label for="refundStatus">Refund Status: <span class="required-field">*</span></label>
            <select class="form-control required" id="refundStatus">
                <option value="Pending">Pending</option>
                <option value="Completed">Completed</option>
                <option value="Canceled">Canceled</option>
            </select>
          <div class="invalid-feedback"></div></div>
        <!-- Deal Type Dropdown -->
        <div class="form-group">
            <label for="dealType">Deal Type: <span class="required-field">*</span></label>
            <select class="form-control required" id="dealType">
                <option value="Free Deal">Free Deal</option>
                <option value="Less Deal">Less Deal</option>
                <option value="Exchange Deal">Exchange Deal</option>
            </select>
          <div class="invalid-feedback"></div></div>
        <!-- Mediator Text Field -->
        <div class="form-group">
            <label for="mediator">Mediator: <span class="required-field">*</span></label>
            <input type="text" class="form-control required" id="mediator">
          <div class="invalid-feedback"></div></div>
        <!-- Reviewer Name Text Field -->
        <div class="form-group">
            <label for="reviewerName">Reviewer Name: <span class="required-field">*</span></label>
            <input type="text" class="form-control required" id="reviewerName">
          <div class="invalid-feedback"></div></div>
        <!-- Order Date -->
        <div class="form-group">
            <label for="orderDate">Order Date: <span class="required-field">*</span></label>
            <input type="date" class="form-control required" id="orderDate">
          <div class="invalid-feedback"></div></div>
        <!-- Order Id -->
        <div class="form-group">
            <label for="orderId">Order Id: <span class="required-field">*</span></label>
            <input type="text" class="form-control required" id="orderId">
          <div class="invalid-feedback"></div></div>
        <!-- Brand Dropdown -->
        <div class="form-group">
            <label for="brand">Brand: <span class="required-field">*</span></label>
            <select class="form-control required" id="brand">
                <option value="Amazon">Amazon</option>
                <option value="Flipkart">Flipkart</option>
                <option value="Meesho">Meesho</option>
                <option value="Nyka">Nyka</option>
            </select>
          <div class="invalid-feedback"></div></div>
        <!-- Product Text -->
        <div class="form-group">
            <label for="product">Product: <span class="required-field">*</span></label>
            <input type="text" class="form-control required" id="product">
          <div class="invalid-feedback"></div></div>
        <!-- Order Amount Text -->
        <div class="form-group">
            <label for="orderAmount">Order Amount: <span class="required-field">*</span></label>
            <input type="number" class="form-control required" id="orderAmount" pattern="[0-9]*" placeholder="Enter order amount" required>
            <div class="invalid-feedback">Please enter a valid numeric amount.</div>
        </div>
        <!-- Refund Amount Text -->
        <div class="form-group">
            <label for="refundAmount">Refund Amount: <span class="required-field">*</span></label>
            <input type="number" class="form-control required" id="refundAmount" pattern="[0-9]*" placeholder="Enter refund amount" required>
            <div class="invalid-feedback">Please enter a valid numeric amount.</div>
            
    
        <!-- Order Image -->
        <div class="form-group">
            <label for="orderImage">Order Image: <span class="required-field">*</span></label>
            <input type="file" class="form-control-file required" id="orderImage">
              <div class="invalid-feedback"></div>
        </div>
        <!-- Refund Image -->
        <div class="form-group">
            <label for="refundImage">Refund Image: <span class="required-field">*</span></label>
            <input type="file" class="form-control-file required" id="refundImage">
              <div class="invalid-feedback"></div>
        </div>
        <!-- Refund Link Text -->
        <div class="form-group">
            <label for="refundLink">Refund Link: <span class="required-field">*</span></label>
            <input type="text" class="form-control required" id="refundLink">
             <div class="invalid-feedback"></div>
        </div>
        <!-- Save Button -->
<button type="button" class="btn btn-primary" onclick="validateAndSave()">Save</button>
    </form>
</div>

<!-- Include jQuery and Bootstrap JS -->

<script>
    function validateAndSave() {
        let isValid = true;

        // List of fields with their IDs and names
        const fields = [
            { id: 'orderStatus', name: 'Order Status' },
            { id: 'refundStatus', name: 'Refund Status' },
            { id: 'dealType', name: 'Deal Type' },
            { id: 'mediator', name: 'Mediator' },
            { id: 'reviewerName', name: 'Reviewer Name' },
            { id: 'orderDate', name: 'Order Date' },
            { id: 'orderId', name: 'Order Id' },
            { id: 'brand', name: 'Brand' },
            { id: 'product', name: 'Product' },
            { id: 'orderAmount', name: 'Order Amount' },
            { id: 'refundAmount', name: 'Refund Amount' },
            { id: 'orderImage', name: 'Order Image' },
            { id: 'refundImage', name: 'Refund Image' },
            { id: 'refundLink', name: 'Refund Link' }
        ];

        // Check each field for value
        fields.forEach(function(field) {
            const value = $("#" + field.id).val();
            if (!value || value.trim() === '') {
                isValid = false;
                $("#" + field.id).addClass('is-invalid'); // Highlight the field
                $("#" + field.id).siblings('.invalid-feedback').text(field.name + ' is required.'); // Show error message
            } else {
                $("#" + field.id).removeClass('is-invalid');
                $("#" + field.id).siblings('.invalid-feedback').text(''); // Clear any previous error message
            }
        });

        // If all fields are valid, proceed to save the form data
        if (isValid) {
            saveFormData();
        }
    }

    function saveFormData() {
        var formData = {
            orderStatus: $("#orderStatus").val(),
            refundStatus: $("#refundStatus").val(),
            dealType: $("#dealType").val(),
            mediator: $("#mediator").val(),
            reviewerName: $("#reviewerName").val(),
            orderDate: $("#orderDate").val(),
            orderId: $("#orderId").val(),
            brand: $("#brand").val(),
            product: $("#product").val(),
            orderAmount: $("#orderAmount").val(),
            refundAmount: $("#refundAmount").val(),
            orderImageUrl: $("#orderImage").val(),
            refundImageUrl: $("#refundImage").val(),
            refundLink: $("#refundLink").val()
        };

        // Convert JSON to string and display it
        console.log(JSON.stringify(formData));

        // AJAX call to save data on the server
        $.ajax({
            url: '/saveOrder', // Replace with your endpoint URL
            type: 'POST',
            data: JSON.stringify(formData),
            contentType: 'application/json',
            success: function(response) {
                // Handle success response
                alert('Data saved successfully!');
            },
            error: function(error) {
                // Handle error response
                alert('Error saving data!');
            }
        });
    }
</script>

</body>
</html>