<%-- 
    Document   : index
    Created on : May 10, 2024, 1:56:18 AM
    Author     : Mostafa Lotfy
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="Entities.Customer"%>
<%@page import="Repos.CustomerRepo"%>
<%@page import="Repos.ReservationRepo"%>
<%@page import="Entities.Reservation"%>
<%@page import="Repos.ProductRepo"%>
<%@page import="Entities.Product"%>
<%@page import="Entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="Repos.ServicesRepo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Services"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Primary meta tags -->
        <title>Autofix | Welcome</title>
        <meta name="title" content="Autofix">
        <meta name="description" content="This is an eCommerce HTML template made by codewithsadee">

        <!-- Favicon -->
        <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

        <!-- Google Font Link -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="fonts/font.css">

        <!-- Custom CSS Link -->
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/admin.css">

        <!-- Preload Images -->
        <link rel="preload" as="image" href="images/hero-banner.png">
    </head>


    <body>
        <!-- Header Section -->
        <header class="header" data-header>
            <div class="container">
                <a href="#" class="logo">
                    <img src="images/download.png" width="132" height="27" alt="Autofix Home">
                </a>
                <nav class="navbar" data-navbar>
                    <ul class="navbar-list">
                        <li><a href="#" class="navbar-link">Home</a></li>
                        <li><a href="#car-services" class="navbar-link">Services</a></li>
                        <li><a href="#feature-label" class="navbar-link">Featured Products</a></li>
                        <li><a href="#my-reservations" class="navbar-link">My Reservations</a></li>
                    </ul>

                    <a href="#contact" class="btn">Contact Us</a>
                    <a href="login.jsp" class="btn">
                        Login
                    </a>


                </nav>
                <button class="nav-open-btn" aria-label="toggle menu" data-nav-toggler>
                    <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
                </button>
            </div>
        </header>

        <!-- Main Content -->
        <main>
            <article>
                <!-- Hero Section -->
                <div class="hero">
                    <div class="container">
                        <div class="hero-content">
                            <h1 class="h1 hero-title title">Best engineers in the Middle East</h1>
                            <p class="hero-text">This is the factor that sets us apart from the competition and allows us to deliver a specialist business service team applies its ranging experience determining</p>
                            <a href="#" class="btn btn-primary">
                                <span class="span">Shop Now</span>
                                <ion-icon name="arrow-forward" aria-hidden="true"></ion-icon>
                            </a>
                        </div>
                        <div class="hero-banner">
                            <figure class="img-holder" style="--width: 704; --height: 700;">
                                <img src="images/hero-banner.png" width="704" height="700" alt="Hero Banner" class="img-cover">
                            </figure>
                        </div>
                    </div>
                </div>

                <!-- Product Section -->
                <section class="section product" aria-label="product">
                    <div class="container">
                        <h2 class="h2 section-title title text-center" id="car-services">Car Services</h2>
                        <ul class="product-list has-scrollbar">
                            <%
                                ArrayList<Services> services = ServicesRepo.showAllServices();
                                if (services != null) {
                                    for (Services service : services) {
                            %>
                            <li class="scrollbar-item">
                                <div class="product-card text-center">
                                    <div class="card-banner">
                                        <figure class="product-banner img-holder" style="--width: 448; --height: 470;">
                                            <img src="<%= service.getImage()%>" width="448" height="470" loading="lazy" alt="<%= service.getServicesName()%>" class="img-cover">
                                        </figure>
                                        <form method="post" action="operationController?par=service">
                                            <input type="hidden" name="service_id" value="<%= service.getServicesId()%>">
                                            <input type="submit" name="buy_service" class="btn product-btn" value="Buy">
                                        </form>
                                    </div>
                                    <div class="card-content">
                                        <h3 class="h4 title"><a href="<%= service.getHtmlPage()%>"><%= service.getServicesName()%></a></h3>
                                        <span class="price"><%= service.getServicesPrice()%> EGP</span>
                                    </div>
                                </div>
                            </li>
                            <%
                                    }
                                } else {
                                    out.println("No services available");
                                }
                            %>
                        </ul>
                    </div>
                </section>

                <!-- Featured Products Section -->
                <section class="section feature" aria-label="feature-label">
                    <div class="container">
                        <h2 class="h2 section-title title text-center" id="feature-label">Featured Products</h2>
                        <ul class="feature-list">


                            <%
                                ArrayList<Product> products = ProductRepo.showAllProducts();
                                if (products != null) {
                                    for (Product product : products) {
                            %>

                            <li>
                                <div class="product-card text-center">
                                    <div class="card-banner">
                                        <figure class="product-banner img-holder" style="--width: 448; --height: 470;">
                                            <img src="<%= product.getImage()%>" width="270" height="270" loading="lazy" alt="<%= product.getProductName()%>" class="img-cover">
                                        </figure>
                                        <form method="post" action="operationController?par=product">
                                            <input type="hidden" name="product_id" value="<%= product.getProductId()%>">
                                            <input type="submit" name="buy_product" class="btn product-btn" value="Buy">
                                        </form>
                                    </div>
                                    <div class="card-content">
                                        <h3 class="h3 title"><%= product.getProductName()%></h3>
                                        <span class="price"><%= product.getProductPrice()%> EGP</span>
                                    </div>
                                </div>
                            </li>
                            <%
                                    }
                                } else {
                                    out.println("No Products available");
                                }
                            %>
                        </ul>

                        <a href="#" class="btn btn-secondary">Back to first point</a>
                    </div>
                </section>


                <!-- My Reservations Section -->
                <section id="my-reservations">
                    <h2>My Reservations</h2>
                    <div class="reservations-table-container">
                        <table class="reservations-table">
                            <thead>
                                <tr>
                                    <th>Reservation ID</th>
                                    <th>Customer Name</th>
                                    <th>Car Type</th>
                                    <th>Service</th>
                                    <th>Service Price</th>
                                    <th>Product</th>
                                    <th>Product Price</th>
                                    <th>Reservation Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    List<Reservation> res = ReservationRepo.showAllReservations();
                                    if (res != null) {
                                        for (Reservation reservation : res) {
                                            // Populate table rows with reservations for the logged-in customer
                                            int reservationId = reservation.getId();
                                            Timestamp reservationDate = reservation.getReservationDate();
                                            CustomerRepo customerRepo = new CustomerRepo();
                                            int customerId = reservation.getCustomerId();
                                            Customer customer = customerRepo.getProductByPk(customerId);
                                            String firstName = customer.getFirstName();
                                            String lastName = customer.getLastName();
                                            String carType = customer.getCarModel();

                                            String customerName = firstName + " " + lastName;
                                            int productId = reservation.getProductId();
                                            int serviceId = reservation.getServiceId();

                                            ProductRepo pRepo = new ProductRepo();
                                            Product p = pRepo.getProductByPk(productId);
                                            int productPrice = p.getProductPrice();
                                            String productName = p.getProductName();

                                            ServicesRepo sRepo = new ServicesRepo();
                                            Services s = sRepo.getServicesByPk(serviceId);
                                            int servicePrice = s.getServicesPrice();
                                            String serviceName = s.getServicesName();


                                %>
                                <tr>
                                    <td><%= reservationId%></td>
                                    <td><%= customerName%></td>
                                    <td><%= carType%></td>
                                    <td><%= serviceName%></td>
                                    <td><%= servicePrice%></td>
                                    <td><%= productName%></td>
                                    <td><%= productPrice%></td>
                                    <td><%= reservationDate%></td>
                                    <td>
                                        <form method="post" action="">
                                            <input type="hidden" name="reservation_id" value="<%= reservationId%>">
                                            <button type="submit" name="cancel_reservation">Cancel</button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr><td colspan='9'>No reservations available</td></tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </section>

            </article>
        </main>
        <!-- 
        - #FOOTER
        -->
        <section id="contact">
            <footer class="footer">
                <div class=1>

                    <div class="footer-top">

                        <div class="footer-brand">

                            <a href="#" class="logo">
                                <img src="images/hero-banner.png" width="300" height="" loading="lazy" alt="shoppie home">
                            </a>

                            <p class="footer-text">
                                Main factor that sets us apart competition allows deliver a specialist business consultancy service applies
                                its ranging experience
                            </p>

                            <ul class="social-list">

                                <li>
                                    <a target="_blank" href="https://www.facebook.com/profile.php?id=61550038124605" class="social-link">
                                        <ion-icon name="logo-facebook"></ion-icon>
                                    </a>
                                </li>

                                <li>
                                    <a target="_blank" href="https://www.instagram.com/autofix2308?igsh=NDFreTJsNGk4c3I5&utm_source=qr " class="social-link">
                                        <ion-icon name="logo-instagram"></ion-icon>
                                    </a>
                                </li>

                            </ul>

                        </div>

                        <ul class="footer-list">

                            <li>
                                <p class="footer-list-title title">Contact info</p>

                                <address class="footer-text">
                                    <b> Hiliopolis </b>
                                    <br>
                                    P.O. Box 2033 -Elhorria El Moshir Ismail st.-behind Sheraton Bldg.
                                </address>
                            </li>

                            <li>
                                <a href="Autofix@gmail.com" class="email">Autofixfiz@gmail.com</a>
                            </li>

                            <li>
                                <a href="tel:01066615896" class="call">01066615896</a>
                                <a href="tel:01019017774" class="call">01019017774</a>
                                <a href="tel:01120559999" class="call">01120559999</a>
                                <a href="tel:0123497777" class="call">0123497777</a>
                                <a href="tel:01007878677" class="call">01007878677</a>
                            </li>
                            <br>
                            <p class="footer-list-title title">opening hour</p>
                            <address class="footer-text">

                                Saturday->Thursday<br>
                                9am->10pm
                            </address>



                        </ul>

                        <div class="footer-list">

                            <p class="footer-list-title title">Subscribe Autofix</p>

                            <input type="email" name="email_address" placeholder="Enter your email address" required autocomplete="off" class="input-field">

                            <button class="btn btn-secondary">Subscribe</button>

                        </div>

                    </div>

                    <div class="footer-bottom">

                        <div class="wrapper">
                            <div class="link-wrapper">
                            </div>

                            <div class="link-wrapper">
                                <a href="conditions.html"><strong> Terms &Conditions</strong></a>

                                <a href="privacy&policies.html" class="footer-bottom-link"> <strong> Privacy Policy</strong></a>
                            </div>
                        </div>

                        <p class="copyright">
                            &copy; 2024 codewith(Ahmed , Yassin , Habiba , youssef and salma) <br> supervisor Dr: <strong>Nashwa Abdel Ghaffar</strong>

                    </div>



                </div>
            </footer>
        </section>



        <!-- Script Section -->
        <script>
            // Check if there is a success message in the session
            <?php if (isset($_SESSION['success_message'])): ?>
// Show success message notification
alert("<?php echo $_SESSION['success_message']; ?>");
<?php unset($_SESSION['success_message']); ?>
<?php elseif (isset($_SESSION['error_message'])): ?>
// Show error message notification
alert("<?php echo $_SESSION['error_message']; ?>");
<?php unset($_SESSION['error_message']); ?>
<?php endif; ?>

// Delay page refresh for 2 seconds
setTimeout(function () 
            {
                    window.location.reload();
}, 2000);
        </script>



        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    </body>

</html>
