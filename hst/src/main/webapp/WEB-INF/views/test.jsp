<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Cable Table</title>
    Include DataTables CSS and JS
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
</head>
<body>

<table id="data-table" class="display">
    <thead>
        <tr>
            <th>Name</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
        Sample row, you can add more dynamically
        <tr>
            <td contenteditable="true">John</td>
            <td>
                <select class="category-dropdown">
                    <option value="SC">SC</option>
                    <option value="ST">ST</option>
                    <option value="General">General</option>
                    <option value="OBC">OBC</option>
                </select>
            </td>
        </tr>
    </tbody>
</table>

<button id="fetch-data">Fetch Data</button>

<script>
    $(document).ready(function() {
        $('#data-table').DataTable();

        // Add more rows dynamically (if needed)
        // $('#data-table').DataTable().row.add([name, category]).draw(false);
        
        // Fetch data and create a key-value pair
        $('#fetch-data').click(function() {
            let data = {};
            $('#data-table tbody tr').each(function() {
                let name = $(this).find('td:first').text();
                let category = $(this).find('.category-dropdown').val();
                data[name] = category;
            });
            console.log(data); // This will print the key-value pairs
        });
    });
</script>

</body>
</html>
 -->
 
 <!--  Best soln for in line dropdown-->
 <!-- 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Cable Table</title>
    Include DataTables CSS and JS
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
</head>
<body>

<table id="data-table" class="display">
    <thead>
        <tr>
            <th>Name</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
        Sample row, you can add more dynamically
        <tr>
            <td contenteditable="true">Himanshu</td>
            <td>
                <select class="category-dropdown">
                    <option value="1">SC</option>
                    <option value="2">ST</option>
                    <option value="3">General</option>
                    <option value="4">OBC</option>
                </select>
            </td>
        </tr>
        <tr>
            <td contenteditable="true">Ram</td>
            <td>
                <select class="category-dropdown">
                    <option value="1">SC</option>
                    <option value="2">ST</option>
                    <option value="3">General</option>
                    <option value="4">OBC</option>
                </select>
            </td>
        </tr>
    </tbody>
</table>

<button id="fetch-data">Fetch Data</button>

<script>
    $(document).ready(function() {
        $('#data-table').DataTable();

        // Fetch data and create JSON structure
        $('#fetch-data').click(function() {
            let dataArray = [];
            $('#data-table tbody tr').each(function() {
                let name = $(this).find('td:first').text();
                let categoryId = $(this).find('.category-dropdown').val();
                let categoryText = $(this).find('.category-dropdown option:selected').text();
                
                let categoryObj = {
                    key: categoryId,
                    value: categoryText
                };

                let dataObj = {
                    name: name,
                    category: categoryObj
                };

                dataArray.push(dataObj);
            });

            console.log(JSON.stringify(dataArray)); // This will print the JSON structure
        });
    });
</script>

</body>
</html>
  -->
<!--   
  
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Cable Table with Bootstrap</title>
    Bootstrap CSS CDN
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    DataTables CSS and JS
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Data Cable Table</h2>

    <table id="data-table" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Category</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td contenteditable="true">Himanshu</td>
                <td>
                    <select class="form-control category-dropdown">
                        <option value="1">SC</option>
                        <option value="2">ST</option>
                        <option value="3">General</option>
                        <option value="4">OBC</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td contenteditable="true">Ram</td>
                <td>
                    <select class="form-control category-dropdown">
                        <option value="1">SC</option>
                        <option value="2">ST</option>
                        <option value="3">General</option>
                        <option value="4">OBC</option>
                    </select>
                </td>
            </tr>
        </tbody>
    </table>

    <button id="fetch-data" class="btn btn-primary">Fetch Data</button>
</div>

<script>
    $(document).ready(function() {
        $('#data-table').DataTable();

        // Fetch data and create JSON structure
        $('#fetch-data').click(function() {
            let dataArray = [];
            $('#data-table tbody tr').each(function() {
                let name = $(this).find('td:first').text();
                let categoryId = $(this).find('.category-dropdown').val();
                let categoryText = $(this).find('.category-dropdown option:selected').text();
                
                let categoryObj = {
                    key: categoryId,
                    value: categoryText
                };

                let dataObj = {
                    name: name,
                    category: categoryObj
                };

                dataArray.push(dataObj);
            });

            console.log(JSON.stringify(dataArray)); // This will print the JSON structure
        });
    });
</script>

</body>
</html>
   -->
   <!-- 
   
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Cable Table with Bootstrap</title>
    Bootstrap CSS CDN
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    DataTables CSS and JS
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    
    Custom CSS for table headers
    <style>
        #data-table th {
            background-color: #840840;
            color: white; /* Set text color to white for better visibility */
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Data Cable Table</h2>

    <table id="data-table" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Name</th>
                <th>Category</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td contenteditable="true">Himanshu</td>
                <td>
                    <select class="form-control category-dropdown">
                        <option value="1">SC</option>
                        <option value="2">ST</option>
                        <option value="3">General</option>
                        <option value="4">OBC</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td contenteditable="true">Ram</td>
                <td>
                    <select class="form-control category-dropdown">
                        <option value="1">SC</option>
                        <option value="2">ST</option>
                        <option value="3">General</option>
                        <option value="4">OBC</option>
                    </select>
                </td>
            </tr>
        </tbody>
    </table>

    <button id="fetch-data" class="btn btn-primary">Fetch Data</button>
</div>

<script>
    $(document).ready(function() {
        $('#data-table').DataTable();

        // Fetch data and create JSON structure
        $('#fetch-data').click(function() {
            let dataArray = [];
            $('#data-table tbody tr').each(function() {
                let name = $(this).find('td:first').text();
                let categoryId = $(this).find('.category-dropdown').val();
                let categoryText = $(this).find('.category-dropdown option:selected').text();
                
                let categoryObj = {
                    key: categoryId,
                    value: categoryText
                };

                let dataObj = {
                    name: name,
                    category: categoryObj
                };

                dataArray.push(dataObj);
            });

            console.log(JSON.stringify(dataArray)); // This will print the JSON structure
        });
    });
</script>

</body>
</html>
    -->
    
    <!-- 
    
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Cable Table</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <style>
        #data-table th { background-color: #840840; color: white; }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Data Cable Table</h2>
    <table id="data-table" class="table table-striped table-bordered">
        <thead><tr><th>Name</th><th>Category</th></tr></thead>
        <tbody>
            <tr><td contenteditable="true">Himanshu</td><td><select class="form-control"><option value="1">SC</option><option value="2">ST</option><option value="3">General</option><option value="4">OBC</option></select></td></tr>
            <tr><td contenteditable="true">Ram</td><td><select class="form-control"><option value="1">SC</option><option value="2">ST</option><option value="3">General</option><option value="4">OBC</option></select></td></tr>
        </tbody>
    </table>
    <button id="fetch-data" class="btn btn-primary">Fetch Data</button>
</div>

<script>
    $(document).ready(function() {
        $('#data-table').DataTable();
        $('#fetch-data').click(function() {
            let data = [];
            $('#data-table tbody tr').each(function() {
                let name = $(this).find('td:first').text();
                let category = $(this).find('select').val();
                data.push({ name: name, category: { key: category, value: $(this).find('select option:selected').text() } });
            });
            console.log(JSON.stringify(data));
        });
    });
</script>

</body>
</html>
 -->    
 
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Data Cable Table</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    
<script type="text/javascript"
	src="scripts/newCommonValidation.js?v=61.44"></script>
    <style>
        #data-table th { background-color: #840840; color: white; }
        #data-table tbody tr td { padding: 0.25rem; } /* Adjusted padding to reduce row height */
    </style>
</head>
<body>

<div class="container mt-5">
    <h2>Data Cable Table</h2>
    <table id="data-table" class="table table-striped table-bordered">
        <thead><tr><th>Name</th><th>Category</th></tr></thead>
        <tbody>
            <tr><td contenteditable="true">Himanshu</td><td><select class="form-control"><option value="1">SC</option><option value="2">ST</option><option value="3">General</option><option value="4">OBC</option></select></td></tr>
            <tr><td contenteditable="true">Ram</td><td><select class="form-control"><option value="1">SC</option><option value="2">ST</option><option value="3">General</option><option value="4">OBC</option></select></td></tr>
        </tbody>
    </table>
    <button id="fetch-data" class="btn btn-primary">Fetch Data</button>
</div>

<script>
    $(document).ready(function() {
        $('#data-table').DataTable();
        $('#fetch-data').click(function() {
            let data = [];
            $('#data-table tbody tr').each(function() {
                let name = $(this).find('td:first').text();
                let category = $(this).find('select').val();
                data.push({ name: name, category: { key: category, value: $(this).find('select option:selected').text() } });
            });
            console.log(JSON.stringify(data));
        });
    });
</script>

</body>
</html>
<!--end  --> 
 
 
   <!-- Start of function on button -->
   
   
   
<!--    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Button Click Example</title>
    <style>
        /* Style for buttons and background */
        body { background-color: #f4f4f4; }
        .btn-container { display: flex; justify-content: center; align-items: center; height: 100vh; background-color: #840840; }
        .custom-btn {
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #840840;
            border: none;
            color: white;
            cursor: pointer;
            outline: none;
            transition: background-color 0.3s;
        }
        .custom-btn:focus, .custom-btn.active { background-color: #6b066b; } /* Lighter shade on click */
    </style>
</head>
<body>

<div class="btn-container">
    Three buttons with unique IDs and onclick events
    <button id="personalBtn" class="custom-btn" onclick="viewTab(1, 'personalBtn')">Personal Info</button>
    <button id="bankBtn" class="custom-btn" onclick="viewTab(1, 'bankBtn')">Bank Info</button>
    <button id="settingsBtn" class="custom-btn" onclick="viewTab(1, 'settingsBtn')">Settings</button>
</div>

<script>
    // Function to handle button click and call viewTab(1)
    function viewTab(tabId, btnId) {
        // Reset all buttons to default state
        const btns = document.querySelectorAll('.custom-btn');
        btns.forEach(btn => btn.classList.remove('active'));

        // Highlight the clicked button
        document.getElementById(btnId).classList.add('active');

        // Call viewTab(1) function (for demonstration, log to console)
        console.log("viewTab(1) function called for: " + btnId);
    }
</script>

</body>
</html>
    -->
    
<!--     
    
    
    <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>
  <iframe src="https://www.example.com/" frameborder="0"></iframe>
      <iframe src='https://www.amazon.in/dp/B0C9QS5G2R' X-Frame-Options: 'DENY'></iframe>
  
</body>
</html> -->
<!-- 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Beautiful Table Example</title>
Include Bootstrap CSS
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
Include jQuery library
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
  /* Custom CSS for table header background color */
  .table-header-bg {
    background-color: #840840;
    color: white;
  }
</style>
</head>
<body>

<div class="container mt-5">
  <table class="table table-bordered">
    <thead>
      <tr class="table-header-bg">
        <th>Admin Name</th>
        <th>Type</th>
        <th>Email</th>
        <th>Whatsapp NO.</th>
        <th>Contact NO.</th>
        <th>Active</th>
      </tr>
    </thead>
    <tbody>
      Sample data rows, you can dynamically generate these rows from your backend
      <tr>
        <td>John Doe</td>
        <td>Admin</td>
        <td>johndoe@example.com</td>
        <td>1234567890</td>
        <td>0987654321</td>
        <td><button class="btn btn-danger toggle-btn">Inactive</button></td>
      </tr>
      Add more rows as needed
    </tbody>
  </table>
</div>

Custom JavaScript to toggle button color
<script>
  $(document).ready(function() {
    $('.toggle-btn').click(function() {
      var btn = $(this);
      if (btn.hasClass('btn-danger')) {
        btn.removeClass('btn-danger').addClass('btn-success').text('Active');
      } else {
        btn.removeClass('btn-success').addClass('btn-danger').text('Inactive');
      }
    });
  });
</script>

Include Bootstrap JS
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
 -->
 
<%--  <jsp:include page="navBar.jsp" />
 
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Beautiful Table Example with DataTables</title>
<!-- Include Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Include DataTables CSS -->
<link href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<!-- Include jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Include DataTables JS -->
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

<style>
  /* Custom CSS for table header background color */
  .table-header-bg {
    background-color: #840840;
    color: white;
  }
</style>

</head>
<body>

<div class="container mt-5">
  <table id="adminTable" class="table table-bordered table-hover">
    <thead>
      <tr class="table-header-bg">
        <th>Admin Name</th>
        <th>Type</th>
        <th>Email</th>
        <th>Whatsapp NO.</th>
        <th>Contact NO.</th>
        <th>Active</th>
      </tr>
    </thead>
    <tbody>
      <!-- Sample data rows, you can dynamically generate these rows from your backend -->
      <tr>
        <td>John Doe</td>
        <td>Admin</td>
        <td>johndoe@example.com</td>
        <td>1234567890</td>
        <td>0987654321</td>
        <td><button class="btn btn-danger toggle-btn">Inactive</button></td>
      </tr>
      <!-- Add more rows as needed -->
    </tbody>
  </table>
</div>

<!-- Custom JavaScript to toggle button color -->
<script>
  $(document).ready(function() {
    // Initialize DataTable
    $('#adminTable').DataTable();

    // Toggle button functionality
    $('.toggle-btn').click(function() {
      var btn = $(this);
      if (btn.hasClass('btn-danger')) {
        btn.removeClass('btn-danger').addClass('btn-success').text('Active');
      } else {
        btn.removeClass('btn-success').addClass('btn-danger').text('Inactive');
      }
    });
  });
</script>.


<!-- Include Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
  --%>
  
<%--   <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>hst marketing</title>
<!-- Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS for green menu -->
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
            <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
            
            <!-- Dropdown for Orders -->
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="ordersDropdown" role="button" data-toggle="dropdown">
                    Orders
                </a>
                <div class="dropdown-menu" aria-labelledby="ordersDropdown">
                    <a class="dropdown-item" href="/orderForm">New Order</a>
                    <a class="dropdown-item" href="/manageOrder">Manage Order</a>
                </div>
            </li>
            <!-- End of Dropdown for Orders -->

            <li class="nav-item"><a class="nav-link" href="/profile">Profile</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Samples</a></li>
            <li class="nav-item"><a class="nav-link" href="/howTo">How To</a></li>
            
            <% 
                if(session.getAttribute("login") != null && session.getAttribute("login").equals("1")) { 
            %>
            <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
            <% 
                } 
            %>
        </ul>
    </div>
</nav>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Your script for AJAX call -->
<script>
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
   --%>
<!--    
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
        <button type="button" class="btn btn-primary btn-pink" onclick="changeColor(this); viewTab(1)">Personal Info</button>
        <button type="button" class="btn btn-primary btn-pink" onclick="changeColor(this); viewTab(2)">Bank Info</button>
        <button type="button" class="btn btn-primary btn-pink" onclick="changeColor(this); viewTab(3)">Settings</button>
    </div>
</div>


 -->
 
<%--  
 
 
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
                         <button onclick="updateStatus('${admin.status},${admin.profileDtlsId}')" class="status-btn btn ${admin.status == 'Active' ? 'btn-success' : 'btn-danger'}">
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
function updateStatus(status,id) {
    var requestData = {
        id: id, // Replace with the appropriate ID you want to update
        status: status // Replace with the new status
    };

    $.ajax({
        url: "/updateStatus",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify(requestData),
        success: function(response) {
            console.log("Status updated successfully:", response);
			if ($(this).hasClass('btn-success')) {
            	
                $(this).removeClass('btn-success').addClass('btn-danger').text('Inactive');
            
            } else {
                $(this).removeClass('btn-danger').addClass('btn-success').text('Active');
            }
            // Handle the response as needed
        },
        error: function(error) {
            console.error("Error updating status:", error);
            // Handle errors as needed
        }
    })

        	
        	
       
    ;
}
    $(document).ready(function() {
        // Initialize DataTable
        $('#adminTable').DataTable();
        
        // Change button color on click
      
       
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
  --%>
  
  
<%--   
  <!DOCTYPE html>
<html>
<head>
    <title>Amazon Product Details</title>
</head>
<body>
    <h1>${product.title}</h1>
    <img src="${product.imageURL}" alt="${product.title}">
    <p>Price: ${product.price}</p>
    <p>Description: ${product.description}</p>
    <!-- Other product details as needed -->
</body>
</html>
   --%>
   
   
   
<!--   <!DOCTYPE html>
<html>
<head>
    <title>Amazon Product Details</title>
</head>
<body>
    <h1>One Plus</h1>
    <img src="https://m.media-amazon.com/images/I/41TmlehQnaL._SX300_SY300_QL70_FMwebp_.jpg" alt="One Plus">
    <p>Price: 222222</p>
    <p>Description: Amazon Product Details</p>
    Other product details as needed
</body>
</html> --><%-- 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Amazon Product Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Your custom CSS -->
    <style>
        /* Add your custom styles here */
        .product-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    <!-- Container for Products -->
    <div class="container mt-5">
        <!-- Sample Product Box -->
        <div class="product-box">
            <h1>${product.title}</h1>
            <img src="${product.imageURL}" alt="${product.title}" class="img-fluid mb-3">
            <p><strong>Price:</strong> ${product.price}</p>
            <p><strong>Description:</strong> ${product.description}</p>
            <!-- Add other product details as needed -->
        </div>

        <!-- You can repeat the above product box structure for multiple products -->
        
    </div>

    <!-- Bootstrap JS (optional if you're using Bootstrap's JS components) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
 --%>
 
<!--  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Amazon Product Details</title>
    Bootstrap CSS
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    jQuery
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    Your custom CSS
    <style>
        /* Add your custom styles here */
        .product-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

    Container for Products
    <div class="container mt-5">
        Sample Product Box
        <div class="product-box">
            <h1>One Plus</h1>
            <img src="https://m.media-amazon.com/images/I/41TmlehQnaL._SX300_SY300_QL70_FMwebp_.jpg" alt="One Plus" class="img-fluid mb-3">
            <p><strong>Price:</strong> 22222</p>
            <p><strong>Description:</strong> One Plus</p>
            Add other product details as needed
        </div>

        You can repeat the above product box structure for multiple products
        
    </div>

    Bootstrap JS (optional if you're using Bootstrap's JS components)
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
  -->
  
<!--   
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Golden Glittering Box</title>
    Include Bootstrap CSS
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    Include custom CSS
    <style>
        /* Add custom styles here */
        .glitter-box {
            background-color: gold;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px gold;
            position: relative;
        }
        .glitter-box img {
            max-width: 100%;
            height: auto;
            margin-bottom: 15px;
        }
        .glitter-box:after {
            content: "";
            position: absolute;
            top: -15px;
            left: -15px;
            right: -15px;
            bottom: -15px;
            z-index: -1;
            background: repeating-linear-gradient(45deg, transparent, transparent 10px, gold 10px, gold 20px);
            border-radius: 15px;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="glitter-box p-4">
        Image
        <img src="path_to_your_image.jpg" alt="Product Image" class="img-fluid">

        Description
        <p>Description: This is a beautiful product description.</p>

        Buy Now Button
        <button class="btn btn-warning">Buy Now</button>
    </div>
</div>

Include jQuery and Bootstrap JS
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // You can add any custom JavaScript/jQuery functions if needed
    $(document).ready(function() {
        // Your JavaScript/jQuery code here
    });
</script>

</body>
</html>
   -->
   
   
   <%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Glittering Box</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/styles.css">
    <style>
    /* Add your styles here */
/* Add your styles here */
/* Add your styles here */
/* Add your styles here */
.glitter-box {
    border: 5px solid yellow; /* Yellow border */
    padding: 20px;
    border-radius: 10px;
    background-color: white; /* White background */
    display: flex; /* Flexbox */
    align-items: center; /* Vertical alignment */
    justify-content: space-between; /* Right alignment */
}

.buy-now-btn {
    background-color: gold; /* Change to a more golden shade */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s; /* Smooth transition */
}

.buy-now-btn:hover {
    background-color: darkgoldenrod; /* Darken slightly on hover for effect */
}

.description {
    text-align: left; /* Left align description */
    flex: 1; /* Take remaining space */
    margin-left: 20px; /* Margin for spacing */
}
    
    </style>

    <!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JS CDN -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Custom JS -->
    <script src="resources/js/script.js"></script>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 glitter-box">
            <!-- Image -->
            <img src="https://m.media-amazon.com/images/I/41TmlehQnaL._SX300_SY300_QL70_FMwebp_.jpg" alt="Product Image" class="img-fluid  mb-4" style="width: 150px; height: 150px;">

            <!-- Description and Buy Now Button -->
            <div class="description">
                <h4>OnePlus Nord CE 3 5G (Aqua Surge, 8GB RAM, 128GB Storage)</h4>
					<div class="a-section a-spacing-small a-spacing-top-small">
						<table class="a-normal a-spacing-micro">
							<tbody>
								<tr class="a-spacing-small po-brand">
									<td class="a-span3"><span class="a-size-base a-text-bold">Brand</span>
									</td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">OnePlus</span></td>
								</tr>
								<tr class="a-spacing-small po-model_name">
									<td class="a-span3"><span class="a-size-base a-text-bold">Model
											Name</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">Nord CE 3 Lite 5G</span></td>
								</tr>
								<tr class="a-spacing-small po-wireless_provider">
									<td class="a-span3"><span class="a-size-base a-text-bold">Network
											Service Provider</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">Unlocked for All
											Carriers</span></td>
								</tr>
								<tr class="a-spacing-small po-operating_system">
									<td class="a-span3"><span class="a-size-base a-text-bold">Operating
											System</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">OxygenOS</span></td>
								</tr>
								<tr class="a-spacing-small po-cellular_technology">
									<td class="a-span3"><span class="a-size-base a-text-bold">Cellular
											Technology</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">5G</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					<button class="buy-now-btn btn btn-lg mt-3">Buy Now</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
    --%>
    
    
    
<%--     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Glittering Box</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        .glitter-box {
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
            padding: 20px;
            border-radius: 10px;
            background-color: white; /* White background */
            display: flex; /* Flexbox */
            align-items: center; /* Vertical alignment */
            justify-content: space-between; /* Right alignment */
        }

        .buy-now-btn {
            background-color: gold; /* Change to a more golden shade */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth transition */
        }

        .buy-now-btn:hover {
            background-color: darkgoldenrod; /* Darken slightly on hover for effect */
        }

        .description {
            text-align: left; /* Left align description */
            flex: 1; /* Take remaining space */
            margin-left: 20px; /* Margin for spacing */
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <!-- First Product -->
        <div class="col-md-6 glitter-box">
            <img src="https://m.media-amazon.com/images/I/41TmlehQnaL._SX300_SY300_QL70_FMwebp_.jpg" alt="Product Image" class="img-fluid mb-4" style="width: 150px; height: 150px;">
            <div class="description">
                <h4>OnePlus Nord CE 3 5G (Aqua Surge, 8GB RAM, 128GB Storage)</h4>
                <table class="a-normal a-spacing-micro">
                    <tbody>
                        <!-- ... details for the first product ... -->
                        <!-- You can add more rows if needed -->
                    </tbody>
                </table>
                <button class="buy-now-btn btn btn-lg mt-3">Buy Now</button>
            </div>
        </div>

        <!-- Second Product -->
        <div class="col-md-6 glitter-box">
            <img src="https://m.media-amazon.com/images/I/41TmlehQnaL._SX300_SY300_QL70_FMwebp_.jpg" alt="Product Image" class="img-fluid mb-4" style="width: 150px; height: 150px;">
            <div class="description">
                <h4>Another Product Title</h4>
                <table class="a-normal a-spacing-micro">
                    <tbody>
                        <!-- ... details for the second product ... -->
                        <!-- Example rows for the second product -->
                        <tr class="a-spacing-small po-brand">
                            <td class="a-span3"><span class="a-size-base a-text-bold">Brand</span></td>
                            <td class="a-span9"><span class="a-size-base po-break-word">Another Brand</span></td>
                        </tr>
                        <!-- Add more rows for details if needed -->
                    </tbody>
                </table>
                <button class="buy-now-btn btn btn-lg mt-3">Buy Now</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
     --%>
     
     
<%--      
     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Glittering Box</title>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        .glitter-box {
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
            padding: 20px;
            border-radius: 10px;
            background-color: white; /* White background */
            margin-bottom: 20px; /* Spacing between products */
        }

        .buy-now-btn {
            background-color: #840840; /* Change to a more golden shade */
            color: white;
            font-weight:bold;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s; /* Smooth transition */
        }

        .buy-now-btn:hover {
            background-color: darkgoldenrod; /* Darken slightly on hover for effect */
        }

        .description {
            text-align: left; /* Left align description */
            flex: 1; /* Take remaining space */
            margin-left: 20px; /* Margin for spacing */
        }
        .a-normal .a-size-base {
        font-size: 12px; /* You can adjust the size as needed */
    }
    .a-spacing-small {
        margin-bottom: 5px; /* Adjust this value to reduce or increase the space */
    }
    </style>
</head>
<body>

<div class="container mt-5">
    <!-- First Product -->
    <div class="glitter-box">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <img src="https://m.media-amazon.com/images/I/6175SlKKECL._SX679_.jpg" alt="Product Image" class="img-fluid mb-4" style="width: 250px; height: 250px;">
            </div>
            <div class="col-md-6 description">
                <h4>OnePlus Nord CE 3 5G (Aqua Surge, 8GB RAM, 128GB Storage)</h4>
                <table class="a-normal a-spacing-micro ">
     <tbody>
								<tr class="a-spacing-small po-brand">
									<td class="a-span3"><span class="a-size-base a-text-bold">Brand</span>
									</td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">OnePlus</span></td>
								</tr>
								<tr class="a-spacing-small po-model_name">
									<td class="a-span3"><span class="a-size-base a-text-bold">Model
											Name</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">Nord CE 3 Lite 5G</span></td>
								</tr>
								<tr class="a-spacing-small po-wireless_provider">
									<td class="a-span3"><span class="a-size-base a-text-bold">Network
											Service Provider</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">Unlocked for All
											Carriers</span></td>
								</tr>
								<tr class="a-spacing-small po-operating_system">
									<td class="a-span3"><span class="a-size-base a-text-bold">Operating
											System</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">OxygenOS</span></td>
								</tr>
								<tr class="a-spacing-small po-cellular_technology">
									<td class="a-span3"><span class="a-size-base a-text-bold">Cellular
											Technology</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">5G</span></td>
								</tr>
							</tbody>
                </table>
                <button class="buy-now-btn btn btn-lg mt-3">Buy Now</button>
            </div>
        </div>
    </div>

    <!-- Second Product -->
    <div class="glitter-box">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <img src="https://m.media-amazon.com/images/I/41TmlehQnaL._SX300_SY300_QL70_FMwebp_.jpg" alt="Product Image" class="img-fluid mb-4" style="width: 150px; height: 150px;">
            </div>
            <div class="col-md-6 description">
                <h4>Another Product Title</h4>
                <table class="a-normal a-spacing-micro">
                   <tbody>
								<tr class="a-spacing-small po-brand">
									<td class="a-span3"><span class="a-size-base a-text-bold">Brand</span>
									</td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">OnePlus</span></td>
								</tr>
								<tr class="a-spacing-small po-model_name">
									<td class="a-span3"><span class="a-size-base a-text-bold">Model
											Name</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">Nord CE 3 Lite 5G</span></td>
								</tr>
								<tr class="a-spacing-small po-wireless_provider">
									<td class="a-span3"><span class="a-size-base a-text-bold">Network
											Service Provider</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">Unlocked for All
											Carriers</span></td>
								</tr>
								<tr class="a-spacing-small po-operating_system">
									<td class="a-span3"><span class="a-size-base a-text-bold">Operating
											System</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">OxygenOS</span></td>
								</tr>
								<tr class="a-spacing-small po-cellular_technology">
									<td class="a-span3"><span class="a-size-base a-text-bold">Cellular
											Technology</span></td>
									<td class="a-span9"><span
										class="a-size-base po-break-word">5G</span></td>
								</tr>
							</tbody>
                </table>
                <button class="buy-now-btn btn btn-lg mt-3">Buy Now</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
      --%>
      
<%--         
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom header background color */
        .custom-header-bg {
            background-color: #840840;
            color: #ffffff; /* white text color for better visibility */
        }
        
        .shadow-card {
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
            transition: 0.3s;
            padding: 20px;
        }
    </style>
</head>
<body>
<jsp:include page="navBar.jsp" />
<div class="container mt-5">
  <div class="card shadow-card">
        <div class="card-body">
    <h2>Add Product</h2>
    
    <!-- Product Form -->
    <form id="productForm">
        
        <!-- Product Title -->
        <div class="form-group">
            <label for="title">Product Title:</label>
            <input type="text" class="form-control" id="title" name="title" value="${product.title}" required>
        </div>
        
        <!-- Product Image URL -->
        <div class="form-group">
            <label for="imageURL">Product Image URL:</label>
            <input type="text" class="form-control" id="imageURL" name="imageURL" value="${product.imageURL}">
        </div>
        
        <!-- Product Price -->
        <div class="form-group">
            <label for="price">Product Price:</label>
            <input type="number" step="0.01" class="form-control" id="price" name="price" value="${product.price}" required>
        </div>
        
        <!-- Description Property Table -->
        <div class="form-group">
    <h2>Product Description</h2>
    <button type="button" class="btn btn-primary mb-3" id="addRowBtn">Add Row</button>
    <table id="descriptionTable" class="table table-bordered table-striped">
        <thead class="custom-header-bg">
            <tr>
                <th>Property</th>
                <th>Value</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pairDataDtoList}" var="pairDataDto">
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
            <label for="buyNowUrl">BuyNow URL:</label>
            <input type="text" class="form-control" id="buyNowUrl" name="buyNowUrl" value="${product.buyNowUrl}">
        </div>
        
        <!-- ASIN -->
        <div class="form-group">
            <label for="asin">ASIN:</label>
            <input type="text" class="form-control" id="asin" name="asin" value="${product.asin}">
        </div>
        
        <!-- Seller Dropdown -->
        <div class="form-group">
            <label for="seller">Seller:</label>
            <select class="form-control" id="seller" name="seller">
                <option value="seller1" <c:if test="${product.seller == 'seller1'}">selected</c:if>>Seller 1</option>
                <option value="seller2" <c:if test="${product.seller == 'seller2'}">selected</c:if>>Seller 2</option>
                <!-- Add more sellers as needed -->
            </select>
        </div>
        
        <!-- Save Button -->
        <button type="button" class="btn btn-success" id="saveProductBtn">Save</button>
        
    </form>
    </div></div>
</div>


<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 --><script>
$(document).ready(function() {
    let table = $('#descriptionTable').DataTable();

    $('#addRowBtn').click(function() {
        table.row.add([
            '<input type="text" class="form-control propertyInput" value="">',
            '<input type="text" class="form-control valueInput" value="">',
            '<button type="button" class="btn btn-success btn-sm saveBtn">Save</button>'
        ]).draw(false);
    });

    $(document).on('click', '.editBtn', function() {
        let row = $(this).closest('tr');
        let property = row.find('td:eq(0)').text();
        let value = row.find('td:eq(1)').text();

        row.find('td:eq(0)').html('<input type="text" class="form-control" value="' + property + '">');
        row.find('td:eq(1)').html('<input type="text" class="form-control" value="' + value + '">');
        row.find('td:eq(2)').html('<button type="button" class="btn btn-primary btn-sm updateBtn">Update</button>');
    });

    $(document).on('click', '.deleteBtn', function() {
        table.row($(this).closest('tr')).remove().draw(false);
    });

    $(document).on('click', '.saveBtn', function() {
        let row = $(this).closest('tr');
        let property = row.find('.propertyInput').val();
        let value = row.find('.valueInput').val();

        row.find('td:eq(0)').text(property);
        row.find('td:eq(1)').text(value);
        row.find('td:eq(2)').html('<button type="button" class="btn btn-warning btn-sm editBtn">Edit</button> <button type="button" class="btn btn-danger btn-sm deleteBtn">Delete</button>');
    });

    $(document).on('click', '.updateBtn', function() {
        let row = $(this).closest('tr');
        let property = row.find('input:eq(0)').val();
        let value = row.find('input:eq(1)').val();

        row.find('td:eq(0)').text(property);
        row.find('td:eq(1)').text(value);
        row.find('td:eq(2)').html('<button type="button" class="btn btn-warning btn-sm editBtn">Edit</button> <button type="button" class="btn btn-danger btn-sm deleteBtn">Delete</button>');
    });
    $('#saveProductBtn').click(function() {
        // Capture product details
        let product = {
            title: $('#title').val(),
            imageURL: $('#imageURL').val(),
            price: $('#price').val(),
            buyNowUrl: $('#buyNowUrl').val(),
            asin: $('#asin').val(),
            seller: $('#seller').val(),
            description: [] // to hold property-value pairs
        };
        
        // Capture product description (property-value pairs)
        $('#descriptionTable tbody tr').each(function() {
            let property = $(this).find('td:eq(0)').text();
            let value = $(this).find('td:eq(1)').text();
            product.description.push({ "property": property, "value": value });
        });

        console.log(JSON.stringify(product)); // For debugging

        // Make AJAX call
        $.ajax({
            url: '/saveproduct',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(product),
            success: function(response) {
                bootbox.alert({
                    title: 'Success',
                    message: 'Product Added Successfully.',
                    callback: function() {
                        window.location.href = '/home';
                    }
                });
            },
            error: function(error) {
                bootbox.alert({
                    title: 'Error',
                    message: 'Failed to add product. Please try again.'
                });
            }
        });
    });

});
</script>

<!-- <script>
    $(document).ready(function() {
        let propertyCount = 0;

        // Add Property Button Click Event
        $("#addPropertyBtn").click(function() {
            let newRow = `
                <tr id="propertyRow${propertyCount}">
                    <td><input type="text" class="form-control" name="properties[${propertyCount}].property" placeholder="Enter Property"></td>
                    <td><input type="text" class="form-control" name="properties[${propertyCount}].value" placeholder="Enter Value"></td>
                    <td>
                        <button type="button" class="btn btn-warning btn-sm editPropertyBtn">Edit</button>
                        <button type="button" class="btn btn-danger btn-sm deletePropertyBtn">Delete</button>
                    </td>
                </tr>
            `;
            $("#propertyTableBody").append(newRow);
            propertyCount++;
        });

        // Edit Property
        $(document).on("click", ".editPropertyBtn", function() {
            let row = $(this).closest("tr");
            let propertyInput = row.find("td:eq(0) input").val();
            let valueInput = row.find("td:eq(1) input").val();
            // Populate above fields for editing if needed
        });

        // Delete Property
        $(document).on("click", ".deletePropertyBtn", function() {
            $(this).closest("tr").remove();
        });

        // Save Product Button Click Event
        $("#saveProductBtn").click(function() {
            let formData = $("#productForm").serializeArray();
            let propertyTable = []; // Array to hold property objects

            // Convert serialized form data to the desired JSON format
            for (let i = 0; i < formData.length; i += 2) {
                let propertyObj = {
                    property: formData[i].value,
                    value: formData[i + 1].value
                };
                propertyTable.push(propertyObj);
            }
            formData.descriptionProperties=propertyTable;
            console.log(formData);
            $.ajax({
                url: "/saveProduct", // Your Spring Boot endpoint
                type: "POST",
                data: formData,
                success: function(response) {
                    alert("Product Added Successfully.");
                    window.location.href = "/home"; // Redirect to home on success
                },
                error: function() {
                    alert("Failed to add product. Please try again.");
                }
            });
        });
    });
</script>
 --></body>
</html>
  
       
  
<!--   
  
  <script>
  

  var rcmc_list_manage_tab = (function() {

  	$('.custom-datatable').css('width', '100%');
  	var rcmc_manage_tbl = null;
  	var rcmc_list_manage_table = function() {
  		rcmc_manage_tbl = $('#RCMCSearchList')
  				.DataTable(
  						{
  							dom : "Bfrtip",
  							searching : true,
  							info : true,
  							serverSide: false,
  							processing: true,
  							buttons : [
  								{
  									extend: 'excel',
  									exportOptions: {
  				                                    columns: "thead th:not(.noExport)"
  				                         },
  				                    text: function ( dt, button, config ) {
  						                return dt.i18n( 'buttons.excel', 'Excel' );
  						            },
  						            filename: 'Worklist',
  						            title: 'Worklist',
  								}
  								],
  							"columns" : [

  								
  										
  									{
  										"data" : "iecId",
  										className : "editable"
  									},
  									{
  										"data" : "firmName",
  										className : "editable"
  									},
  									{
  										"data" : "fileDate",
  										className : "editable"
  									},
  									{
  										"data" : "fileNo",
  										className : "editable"
  									},
  									{
  										"data" : "rcmcNumber",
  										className : "editable"
  									},

  									
  									{
  										"data" : "applicationType_Value",
  										className : "editable"
  									},
  									

  									{
  										"data" : "status_Value",
  										className : "editable"
  									},

  									{
  										"data" : "pendingWith",
  										className : "editable"
  									},

  									
  									
  									{
  										"data" : "epcOffice_Value",
  										className : "editable",
  										
  									},{
  										"data" : "action",
  										className : "editable",
  										
  									}
  								
  							],
  							"columnDefs" : [
  				        	
  				            {
  				                responsivePriority : 2,
  				                targets : -1
  				            }, {
  				                "defaultContent" : "-",
  				                "targets" : "_all"
  				            },
  				             {"targets":2, "type":"de_datetime"},
  				       ],
  				       "order" : [ [ 2,"desc"]]
  				    
  						
  						});
  	};
  	var getRcmcmanagetbl = function() {
  		return rcmc_manage_tbl;
  	}
  	return {
  		getRcmcmanagetbl : getRcmcmanagetbl,
  		rcmc_list_manage_table : rcmc_list_manage_table
  	}
  })();

  
  </script>
       
       --> 
       
       
       
       
       <div class="form-group">
    <label for="orderScreenshot">Order Screenshot</label> 
    <input type="file" class="form-control-file" id="orderScreenshot" name="orderScreenshot" accept="image/*">
    
    <!-- Preview Link -->
    <a href="javascript:void(0);" id="viewOrderScreenshot">Preview</a>

    <!-- Delete Link -->
    <a href="javascript:void(0);" id="deleteOrderScreenshot" style="margin-left: 10px; color: red;">Delete</a>

    <!-- Image Preview -->
    <img id="orderScreenshotPreview" src="#" alt="Order Screenshot Preview" style="max-width: 200px; display: none;">
</div>
       
       
       <script>
       $(document).ready(function() {
    	    // Function to delete the uploaded screenshot
    	    $('#deleteOrderScreenshot').on('click', function() {
    	        // Clear the file input
    	        $('#orderScreenshot').val('');

    	        // Hide the image preview
    	        $('#orderScreenshotPreview').hide();

    	        // You can also hide the delete link if needed
    	        $(this).hide();
    	    });

    	    // Function to preview the uploaded screenshot
    	    $('#viewOrderScreenshot').on('click', function() {
    	        var file = $('#orderScreenshot').prop('files')[0];
    	        if (file) {
    	            var reader = new FileReader();
    	            
    	            reader.onload = function(e) {
    	                // Display image preview
    	                $('#orderScreenshotPreview').attr('src', e.target.result).show();
    	                
    	                // Display delete link
    	                $('#deleteOrderScreenshot').show();
    	            }
    	            
    	            reader.readAsDataURL(file);
    	        } else {
    	            alert('No file selected!');
    	        }
    	    });
    	});

       
       </script> --%>