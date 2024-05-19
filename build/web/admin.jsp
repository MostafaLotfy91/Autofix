<%-- 
    Document   : admin
    Created on : May 10, 2024, 2:43:43 AM
    Author     : Mostafa Lotfy
--%>

<%@page import="java.util.List"%>
<%@page import="Repos.ReservationRepo"%>
<%@page import="Entities.Customer"%>
<%@page import="Repos.CustomerRepo"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Entities.Reservation"%>
<%@page import="Entities.Reservation"%>
<%@page import="Repos.ProductRepo"%>
<%@page import="Entities.Product"%>
<%@page import="Repos.ServicesRepo"%>
<%@page import="Entities.Services"%>
<%@page import="Entities.Services"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Panel</title>
        <link rel="stylesheet" href="css/admin.css">
        <link rel="stylesheet" href="css/style.css">


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
                        <li><a href="#reservations" class="navbar-link">Reservations</a></li>
                    </ul>

                    <a href="#contact" class="btn">Contact Us</a>
                    <a href="logout" class="btn">
                        Logout                    
                    </a>


                </nav>
                <button class="nav-open-btn" aria-label="toggle menu" data-nav-toggler>
                    <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
                </button>
            </div>
        </header>

        <!-- Main Content -->
        <div class="container">

            <section id="car-services">
                <h2>Available Services</h2>
                <table class="services-table">
                    <thead>
                        <tr>
                            <th>Service ID</th>
                            <th>Service Name</th>
                            <th>Price</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Services> services = ServicesRepo.showAllServices();
                            if (services != null) {
                                for (Services service : services) {
                        %>
                        <tr><td> <%= service.getServicesId()%></td><td> <%= service.getServicesName()%> </td><td> <%= service.getServicesPrice()%> </td><td><img src="<%= service.getImage()%>" alt='Service Image' style='max-width: 100px; max-height: 100px;'></td></tr>;
                                <%
                                        }
                                    } else {
                                        out.println("No services available");
                                    }
                                %>
                    </tbody>
                </table>
            </section>


            <section id="feature-label">
                <h2>Available Products</h2>
                <table class="products-table">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            ArrayList<Product> products = ProductRepo.showAllProducts();
                            if (products != null) {
                                for (Product product : products) {
                        %>
                        <tr><td><%= product.getProductId()%></td><td> <%= product.getProductName()%> </td><td> <%= product.getProductPrice()%> </td><td><img src="<%= product.getImage()%>" alt='Product Image' style='max-width: 100px; max-height: 100px;'></td></tr>;
                                <%
                                        }
                                    } else {
                                        out.println("No Products available");
                                    }
                                %>
                    </tbody>
                </table>

            </section>


            <section id="reservations">
                <h2>Reservations</h2>
                <table class="reservations-table">
                    <thead>
                        <tr>
                            <th>Reservation ID</th>
                            <th>Customer Name</th>
                            <th>Car Type</th>
                            <th>Service Name</th>
                            <th>Service Price</th>
                            <th>Product Name</th>
                            <th>Product Price</th>
                            <th>Reservation Date</th>
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
            </section>



        </div>



        <section id="contact">
            <footer class="footer">
                <div class="container">

                    <div class="footer-top">

                        <div class="footer-brand">

                            <a href="#" class="logo">
                                <img src="  images/hero-banner.png" width="300" height="" loading="lazy" alt="shoppie home">
                            </a>

                            <p class="footer-text">
                                Main factor that sets us apart competition allows deliver a specialist business consultancy service applies
                                its ranging experience
                            </p>


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
                                <a href="conditions.html"><strong> Terms &Conditions</strong></a>
                                <a href="privacy&policies.html" class="footer-bottom-link"> <strong> Privacy Policy</strong></a>
                            </div>
                        </div>

                        <p class="copyright">
                            &copy; 2024 codewith(Ahmed , Yassin , Habiba , youssef and salma) <br> supervisor Dr: <strong>Nashwa Abdel Ghaffar</strong>
                        </p>

                    </div>

                </div>
            </footer>
        </section>



    </body>

</html>
