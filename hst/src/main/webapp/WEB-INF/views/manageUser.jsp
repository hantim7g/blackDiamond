<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="navBar.jsp" />

<meta charset="UTF-8">
<title>Admin Table</title>
</head>
<body>

<div class="container mt-5">
    <h2>Admin Table</h2>
    <table id="adminTable" class="table table-bordered table-hover">
        <thead style="background-color: #840840; color: white;">
            <tr>
                <th>Admin Name</th>
                <th>Type</th>
                <th>Email</th>
                <th>Whatsapp NO.</th>
                <th>Contact NO.</th>
                <th>Status</th>
                <th>Update</th>
            </tr>
        </thead>
        <tbody>
            <!-- Sample data using JSTL (replace with your actual data) -->
            <c:forEach items="${mktJson}" var="admin">
                <tr>
                    <td>${admin.firstName}</td>
                    <td>${admin.role}</td>
                    <td>${admin.loginMail}</td>
                    <td>${admin.whatsappNumber}</td>
                    <td>${admin.whatsappNumber}</td>
                    <td>
                    
                        <!-- Button with dynamic color based on status -->
                         <button data-id="${admin.profileDtlsId}" class="status-btn btn ${admin.status == 'Active' ? 'btn-success' : 'btn-danger'}">
                            ${admin.status}
                        </button> 
                    </td>
                    <td><button type="button" class="btn btn-primary " style="font-weight: bold;" onclick="updateProfile('${admin.profileDtlsId}')">Update</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


<script>

$('.status-btn').click(function(event) {
    
    var id = $(this).data('id'); 
    var currentStatus = $(this).text().trim(); 
    var updateStatus="Inactive";
    if (currentStatus === 'Inactive') {
    	 updateStatus="Active";
    }
    if (currentStatus === 'Active') {
        $(this).removeClass('btn-success').addClass('btn-danger').text('Inactive');
      } else {
        $(this).removeClass('btn-danger').addClass('btn-success').text('Active');
      }
    var requestData = {
    		profileDtlsId: id, 
            status: updateStatus 
        };

        $.ajax({
            url: "/updateStatus",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(requestData),
            success: function(response) {
                console.log("Status updated successfully:", response);
                if (currentStatus === 'Active') {
                    $(this).removeClass('btn-success').addClass('btn-danger').text('Inactive');
                  } else {
                    $(this).removeClass('btn-danger').addClass('btn-success').text('Active');
                  }

            },
            error: function(error) {
            	
                console.error("Error updating status:", error);
                window.location.href = "/manageUser";
                
            }
        });

});


function updateStatusOld(status,id) {
    var requestData = {
        id: id, 
        status: status 
    };

    $.ajax({
        url: "/updateStatus",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(requestData),
        success: function(response) {
            console.log("Status updated successfully:", response);
            var buttonElement = $(`button.status-btn[data-id="${id}"]`);
            if (status === 'Active') {
                buttonElement.removeClass('btn-success').addClass('btn-danger').text('Inactive');
            } else {
                buttonElement.removeClass('btn-danger').addClass('btn-success').text('Active');
            }
            // Handle the response as needed
        },
        error: function(error) {
            console.error("Error updating status:", error);
            // Handle errors as needed
        }
    });
}
    $(document).ready(function() {
        // Initialize DataTable
      //  $('#adminTable').DataTable();
        $('#adminTable').DataTable({
			dom: 'Bfrtip',
			paging : true,
			searching : true,
	        "pageLength": 10,
	        "scrollX": true,
		    buttons: [{
		  		 extend: 'excel',
		  		title: 'export',
		        exportOptions: {
		        columns: "thead th:not(.noExport)"
		  	 }}]
		});
       
    });

    <!-- Your jQuery script -->
        var updateProfile=function(profileId){
            // jQuery click event handler for the Update button
          
                // Redirect to a new view with the Profile ID as a parameter
                window.location.href = "/fetchProfile?profileId=" + profileId;
          
        };

    
    </script>


</body>
</html>
