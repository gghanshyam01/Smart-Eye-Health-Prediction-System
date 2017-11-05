<%-- 
Document   : Login
Created on : Oct 21, 2017, 11:20:47 PM
Author     : GHANSHYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page | Health Prediction System</title>
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.teal-red.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
    <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/login.js"></script>
    <link href="./css/login.css" rel ="stylesheet" type ="text/css">
    
</head>

<body>
    <!-- Always shows a header, even in smaller screens. -->
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        <header class="mdl-layout__header">
            <div class="mdl-layout__header-row">
                <!-- Title -->
                <span class="mdl-layout-title">Smart Health Prediction System</span>
                <!-- Add spacer, to align navigation to the right -->
                <div class="mdl-layout-spacer"></div>
                <!-- Navigation. We hide it in small screens. -->
                <nav class="mdl-navigation mdl-layout--large-screen-only">
                    <!--<a class="mdl-navigation__link" id="register" href="#">New User</a>-->
                </nav>
            </div>
        </header>
      <!--<div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Title</span>
        <nav class="mdl-navigation">
            <a class="mdl-navigation__link" href="">Link</a>
            <a class="mdl-navigation__link" href="">Link</a>
            <a class="mdl-navigation__link" href="">Link</a>
            <a class="mdl-navigation__link" href="">Link</a>
        </nav>
      </div>-->
        <main class="mdl-layout__content centerIt">
            <div class="page-content">
                <form action="LoginController" method="POST">
                <!--  Login Card -->
                <div class="mdl-card loginCard">
                    
                    <div class="mdl-card__title">
                        <h1 class="mdl-card__title-text">Login to Continue</h1>
                    </div>
                    <!--<div class="mdl-card__media">
                        <img src="photo.jpg" width="220" height="140" border="0" alt="" style="padding:20px;">
                    </div>-->
                    <div class="line"></div>
                    <div class="mdl-card__supporting-text" id="loginContent"><br />
                        ${status}
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" name="lUser" id="loginEmail">
                            <label class="mdl-textfield__label" for="loginEmail">Username</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" name="lPass" id="loginPassword">
                            <label class="mdl-textfield__label" for="loginPassword">Password</label>
                        </div>
                    </div>
                    <div class="mdl-card__actions">
                        <button type="submit" name="login" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored loginBtn" onclick="loginUser()">
                            Log In
                        </button><br />
                        <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" id="toRegister">
                            New User? Register
                        </button>
                    </div>
                </div>
                
                
                <!-- Registration Card -->
                <div class="mdl-card registerCard hideMe">

                    <div class="mdl-card__title">
                        <h1 class="mdl-card__title-text">Register User</h1>
                    </div>
                    <!--<div class="mdl-card__media">
                        <img src="photo.jpg" width="220" height="140" border="0" alt="" style="padding:20px;">
                    </div>-->
                    <div class="line"></div>
                    <div class="mdl-card__supporting-text" id="loginContent"><br />
                        ${status}
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="text" name="rUser" id="regUser">
                            <label class="mdl-textfield__label" for="regUser">Username</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="email" name="rEmail" id="regEmail">
                            <label class="mdl-textfield__label" for="regEmail">Email</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" name="rPass" id="regPassword">
                            <label class="mdl-textfield__label" for="regPassword">Password</label>
                        </div>
                        <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                            <input class="mdl-textfield__input" type="password" name="rRPass" id="regPassword_2">
                            <label class="mdl-textfield__label" for="regPassword_2">Confirm Password</label>
                        </div>
                    </div>
                    <div class="mdl-card__actions">
                        <button type="submit" name="register" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored registerBtn">
                            Register
                        </button><br />
                        <button type="button" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored backToLoginBtn">
                            Already a Member? Log-In
                        </button>
                    </div>
                </div> 
                
                </form>
            </div>
        </main>
    </div>
                        <script>
                            ${sessionScope.moveToRegisterPage}
                        </script>
</body>
</html>
