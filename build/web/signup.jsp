<%-- 
    Document   : signup
    Created on : May 10, 2024, 12:59:04 AM
    Author     : Mostafa Lotfy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Autofix | Sign Up</title>
    <link rel="stylesheet" href="css/signup.css">
</head>

<body>
    <div class="signup-box">
        <h1>Sign Up</h1>
        <h4>It's free and only takes a minute</h4>
        <form method="post" action="operationController?operation=register&page=login">
            <label>First Name</label>
            <input type="text" name="registerFirstName" value="">
            <span><?php echo $first_name_err; ?></span>
            <label>Last Name</label>
            <input type="text" name="registerLastName" value="">
            <span><?php echo $last_name_err; ?></span>
            <label>Email Address</label>
            <input type="email" name="email" value="">
            <span><?php echo $email_err; ?></span>
            <label>Password</label>
            <input type="password" name="password" value="">
            <span><?php echo $password_err; ?></span>
            <label>Confirm Password</label>
            <input type="password" name="confirm_password" value="">
            <span><?php echo $confirm_password_err; ?></span>
            <label>Car Model</label>
            <input type="text" name="car_model" value="">
            <span><?php echo $car_model_err; ?></span>
            <input type="submit" value="Submit">
        </form>
        <p>By clicking the Sign up button, you agree to our <br>
            <a href="conditions.html">Terms and Conditions</a> and <a href="privacy&policies.html">Policy And Privacy</a>
        </p>

        <p >Already have an account? <a href="menueAppController?page=login">Login here</a></p>
    </div>
</body>

</html>

