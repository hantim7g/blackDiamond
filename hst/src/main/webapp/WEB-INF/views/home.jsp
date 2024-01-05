
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="navBar.jsp" />
<meta charset="UTF-8">
<title>Home</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

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
	font-weight: bold;
	padding: 5px 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s; /* Smooth transition */
}

.buy-now-btn:hover {
	background-color: darkgoldenrod;
	/* Darken slightly on hover for effect */
}

.description {
	text-align: left; /* Left align description */
	flex: 1; /* Take remaining space */
	margin-left: 20px; /* Margin for spacing */
}

.a-normal .a-size-base {
	font-size: 12px; /* You can adjust the size as needed */
}
.a-text-bold {
    font-weight: 700!important;
}
.a-spacing-small {
	margin-bottom: 5px;
	/* Adjust this value to reduce or increase the space */
}
@keyframes blink {
    0% { opacity: 1; }
    50% { opacity: 0.5; }
    100% { opacity: 1; }
}

.blinking {
    animation: blink 1s infinite;
}

.bold-green {
padding:5px;
	font-size:12px;
    background-color: green;
	font-weight: bold;
	color: white;
    text-align: center;
    background-size: 50px;} 

.white-font {
    background-color: white;
}

.yellow-background {
	padding:5px;
	font-size:12px;
    background-color: darkgoldenrod;
	font-weight: bold;
	color: white;
    text-align: center;
    background-size: 50%;
    
   
}

.red-background {
	padding:5px;
	font-size:12px;
    background-color: red;
	font-weight: bold;
	color: white;
    text-align: center;
    background-size: 50%;}

</style>
</head>
<body>
 <div class="container mt-3 mb-3">
    <div class="row justify-content-center"> <!-- Center content -->
        <div class="col-md-8"> <!-- Set width to md-3 -->
            <div class="input-group" style="margin-top:20px;">
                <input type="text" id="searchInput" class="form-control" style="font-weight: bold;" placeholder="Search for products...">
                <div class="input-group-append">
                    <button id="searchBtn" class="btn btn-primary buy-now-btn" type="button">Search</button>
                </div>
            </div>
        </div>
    </div>
</div>


	<div class="container mt-5">
		<!-- First Product -->
		
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Iterate over each product in the productList -->
<c:forEach items="${productList}" var="product">
    <div class="glitter-box">

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <!-- Use product's imageURL for the image source -->
                        <img src="${product.imageURL}" alt="Product Image" class="img-fluid mb-4"> <!-- style="width: 250px; height: 250px;" -->
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6"></div>
                </div>
            </div>
            <div class="col-md-6 description">
                <!-- Use product's title for the heading -->
                <h4>${product.title}</h4>
                <table class="a-normal a-spacing-micro">
                    <tbody>
                    
                        <c:forEach items="${product.description}" var="descList">
                        <c:if test="${descList.property ne 'No data available in table'}">
                        <tr class="a-spacing-small po-brand">
                            <td class="a-span3"><span class="a-size-base a-text-bold">${descList.property}</span></td>
                            <!-- Use product's brandName for brand details -->
                            <td class="a-span9"><span class="a-size-base po-break-word pdtValue">: ${descList.value}</span></td>
                        </tr>
                        </c:if>
                        </c:forEach>
                        
                        <!-- Add other rows similarly -->
                        <tr class="a-spacing-small po-cellular_technology">
                            <td class="a-span3"><span class="a-size-base a-text-bold">Available Slots</span></td>
                            <td class="a-span9"><span class="a-size-base po-break-word"> <div class="valueDisplayclass text-center">${product.slots}</div></span></td>

                        </tr>
								<tr >
									<td class="a-span3"><span class=" a-text-bold">Deal Price</span></td>
									<td class="a-span9"><span
										class=" po-break-word">
											<div class=" a-text-bold ">${product.price} Rupees</div>
									</span></td>

								</tr>
								<%-- <tr >
									<td class="a-span3"><span class=" a-text-bold">Price</span></td>
									<td class="a-span9"><span
										class=" po-break-word">
											<div class=" a-text-bold ">${product.priceActual} Rupees</div>
									</span></td>

								</tr> --%>

								<tr class="a-spacing-small po-cellular_technology">
									<td><img src="images/AMZN_BIG.svg" width="100"
										height="50" style="margin-top: 10px; margin-right: 10px;"
										alt=""></td>
									<td><a class="btn btn-primary buy-now-btn"
										href="${product.buyNowUrl}">Buy Now</a></td>

								</tr>

							</tbody>
                </table>
                <%-- <div class="row justify-content-center">
                    <div class="col-md-12">
                        <img src="images/AMZN_BIG.svg" width="100" height="50" style="margin-top: 10px; margin-right: 10px;" alt="">
                        <!-- Use product's buyNowUrl for the Buy Now link -->
                        <a class="btn btn-primary buy-now-btn" href="${product.buyNowUrl}">Buy Now</a>
                    </div>
                </div> --%>
            </div>
        </div>
    </div>
</c:forEach>
		
		
		

		
	</div>
<script>
$(document).ready(function() {
    function updateValue() {
        // Loop through each .valueDisplayclass element to update its style
        $(".valueDisplayclass").each(function() {
            var value = parseInt($(this).text()); // Get the value and convert it to an integer

            // Apply styles based on the value
            if (value > 10) {
                $(this).removeClass().addClass("bold-green blinking");
            } else if (value >= 5 && value <= 10) {
                $(this).removeClass().addClass("yellow-background blinking");
            } else {
                $(this).removeClass().addClass("red-background blinking");
            }
        });
    }
    
    // Call the function initially
    updateValue();
    
    // Refresh the value periodically (every 2 seconds in this example)
    setInterval(updateValue, 2000);
});



</script>
  <script>
        $(document).ready(function() {
            function filterProducts(query) {
                // Convert the query to lowercase for case-insensitive search
                query = query.toLowerCase();

                // Loop through each product and hide/show based on the search query
                $(".glitter-box").each(function() {
                  //  var title = $(this).find("h4").text().toLowerCase(); // Get product title
                    var title = $(this).text().toLowerCase(); // Get all text content of the product

                    // Show/hide product based on the search query match
                    if (title.includes(query)) {
                        $(this).show(); // Show product
                    } else {
                        $(this).hide(); // Hide product
                    }
                });
            }

            // Handle search button click
            $("#searchBtn").click(function() {
                var searchQuery = $("#searchInput").val();
                filterProducts(searchQuery);
            });

            // Optionally, you can also filter products as the user types in the search box
            $("#searchInput").on("input", function() {
                var searchQuery = $(this).val();
                filterProducts(searchQuery);
            });

            // ... (existing jQuery code) ...
        });
    </script>

</body>
</html>
