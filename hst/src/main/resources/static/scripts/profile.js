$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		/* For Select Box */
		var self_ = $('[name=' + this.name + ']');
		if (self_.is('select')) {
			this.value = common.getSelectBoxObject(this);
		}
		if (self_.hasClass("format-currency")) {
			this.value = self_.currency();
		}
		o[this.name] = this.value || '';
	});
	return o;
};



var viewTab = function(tab) {

	$(".bankId").addClass('d-none')
	$(".walletId").addClass('d-none')
	$(".profileId").addClass('d-none')
	$(".loginId").addClass('d-none')

	if (tab == 1) {
		$(".profileId").removeClass('d-none')
	} else if (tab == 2) {
		$(".bankId").removeClass('d-none')
		$(".walletId").removeClass('d-none')
	} else if (tab == 3) {
		$(".loginId").removeClass('d-none')

	}




}


// Function to make AJAX call when the button is clicked

var saveUserData = function() {
	// Prepare the JSON data
	/*var userData = {
		"id": 1, // Replace with the actual user ID
		"firstName": $("#firstName").val(),
		"lastName": $("#lastName").val(),
		"whatsappNumber": $("#whatsappNumber").val(),
		"profilePicture": $("#profilePicture").val()
	};
*/


	var userData = {

		"profileDtlsId": $("#profileDtlsId").val(),
		"loginMail": $("#loginMail").val().trim(),
		"newPassword": $("#newPassword").val(),
		"firstName": $("#firstName").val(),
		"status": $("#status").val(),
		"role": $("#role").val(),
		"lastName": $("#lastName").val(),
		"whatsappNumber": $("#whatsappNumber").val(),
		"profilePicPath": $("#profilePicPath").val(),
		"joinDate": $("#joinDate").val(),
		"paidOrders": $("#paidOrders").val(),
		"totalOrders": $("#totalOrders").val(),
		"paytm": $("#paytm").val(),
		"upi": $("#upi").val(),
		"qrPicture": $("#qrPicture").val(),
		"accHolderName": $("#accHolderName").val(),
		"accNo": $("#accNo").val(),
		"ifsc": $("#ifsc").val()
	};


	// Make the AJAX call
	$.ajax({
		type: "POST", // or "PUT" depending on your API
		url: "/saveUserData", // Replace with your actual API endpoint
		contentType: "application/json",
		data: JSON.stringify(userData),
		success: function(response) {
			console.log(response);  // Log the response to see what's returned from the server
			// Display success message in the Bootstrap alert box
			//console.log("Data has been updated successfully.");
			bootbox.alert("Data has been updated successfully.");
			bootbox.alert({
				message: "Data has been updated successfully.",
				callback: function() {
					// This code will run after the alert is closed
					window.location.href = "/profile";
				}
			});
			//callBackProfile();

			//$("#successMessage").fadeIn().delay(2000).fadeOut(); // Show for 2 seconds
		},
		error: function(error) {
			console.error("Error saving user data:", error);
			// Handle error, show an error message, etc.
			bootbox.alert("Error saving user data:" );
		}
	});
};
var callBackProfile=function(){
	
//	bootbox.alert('Data has been updated successfully.');
	window.location.href = "/profile";			
};

/*$(document).ready(function() {
	var role=$('#role').val();
	if(role=='Admin'){
        $('#role').prop('hidden', false);
        $('#status').prop('hidden', false);
    }});*/
    
    
    
$(document).ready(function() {
    $("#newPassword, #confirmNewPassword").on("keyup", function() {
        // Get the values of both password fields
        var newPassword = $("#newPassword").val();
        var confirmNewPassword = $("#confirmNewPassword").val();

        // Reset error messages
        $("#newPasswordError, #confirmNewPasswordError").text("");

        // Regular expressions to validate the password
        var uppercaseRegex = /[A-Z]/;
        var lowercaseRegex = /[a-z]/;
        var digitRegex = /[0-9]/;
        var specialCharRegex = /[!@#$%^&*()_+\-=[\]{};':"\\|,.<>/?]/;

        // Check for common password validation
        if (newPassword.length < 8) {
            $("#newPasswordError").text("Password must be at least 8 characters long.");
        } else if (!uppercaseRegex.test(newPassword)) {
            $("#newPasswordError").text("Password must contain at least one uppercase letter.");
        } else if (!lowercaseRegex.test(newPassword)) {
            $("#newPasswordError").text("Password must contain at least one lowercase letter.");
        } else if (!digitRegex.test(newPassword)) {
            $("#newPasswordError").text("Password must contain at least one numeric digit.");
        } else if (!specialCharRegex.test(newPassword)) {
            $("#newPasswordError").text("Password must contain at least one special character.");
        }

        // Check if passwords match
        if (newPassword !== confirmNewPassword) {
            $("#confirmNewPasswordError").text("Passwords do not match.");
        }
    });
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
