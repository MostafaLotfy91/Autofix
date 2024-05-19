<%-- 
    Document   : login
    Created on : May 10, 2024, 1:06:14 AM
    Author     : Mostafa Lotfy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Autofix | Login</title>
        <link rel="stylesheet" href="css/loginform.css">
    </head>

    <body>

        <div class="login-box">
            <h1>Login</h1>
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null && !errorMessage.isEmpty()) {
            %>
            <span class="pass"><%= errorMessage%></span>
            <% }%>
            <form method="post" action="operationController?operation=login&page=home">
                <div class="text_field">
                    <input type="email" name="loginEmail" value="" required>
                    <label>Email</label>
                </div>
                <div class="text_field">
                    <input type="password" name="loginPassword" value="" required>
                    <label>Password</label>
                </div>
                <div class="pass">Forgot password?</div>
                <input type="submit" value="login">
                <div class="signup_link">
                    Not a member? <a href="menueAppController?page=signup">Sign up</a>
                </div>
            </form>
        </div>
    </body>

</html>
