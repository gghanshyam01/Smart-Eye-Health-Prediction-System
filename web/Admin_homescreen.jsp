<%-- 
    Document   : homescreen
    Created on : Nov 9, 2017, 9:20:25 AM
    Author     : GHANSHYAM
--%>

<%@page import="Controller.LoginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage | Health Prediction System</title>
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.teal-red.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
        <link href="css/homescreen.css" rel ="stylesheet" type ="text/css">
        <link href="css/jquery.dataTables.min.css" rel ="stylesheet" type ="text/css">
        <link href="css/bootstrap.css" rel ="stylesheet" type ="text/css">
        <link href="css/bootstrap.min.css" rel ="stylesheet" type ="text/css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/admin_homepage.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (LoginController.session.getAttribute("suser") == null) {
                String msg = "<div class=\"alert alert-warning role=\"alert\">\n"
                        + "<strong>You're not a developer ;)</strong> You must log-in to access that page.\n"
                        + "</div>";
                session.setAttribute("status", msg);
                response.sendRedirect("Login.jsp");
            }
        %>
        <!-- Simple header with fixed tabs. -->
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header
             mdl-layout--fixed-tabs">
            <header class="mdl-layout__header mdl-layout__header--waterfall">
                <div class="mdl-layout__header-row">
                    <!-- Title -->
                    <span class="mdl-layout-title">Smart Health Prediction System</span>

                    <!-- Add spacer, to align navigation to the right -->
                    <div class="mdl-layout-spacer"></div>
                    <!-- Navigation. -->
                    <form action="LoginController">
                        <nav class="mdl-navigation ">
                            <button type="submit" name="logout" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored logoutBtn" >
                                Logout Admin
                            </button>
                            <!--<a class="mdl-navigation__link" id="register" href="#">New User</a>-->
                        </nav>
                    </form>
                </div>
                <!-- Tabs -->
                <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
                    <a href="#viewUsers" class="mdl-layout__tab is-active" onclick="viewUsers()">View Users</a>
                    <a href="#viewFeedback" class="mdl-layout__tab moveDown" onclick="viewFeedback()">View Feedback</a>
                    <a href="#addDisease" id="hist" class="mdl-layout__tab moveDown">Add new disease</a>
                </div>
            </header>
            <main class="mdl-layout__content">
                <section class="mdl-layout__tab-panel is-active" id="viewUsers">
                    <div class="page-content">
                        <div class="container">
                            <table class="table table-hover table-responsive" id="tblUser">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Email ID</th>
                                    </tr>
                                </thead>
                                <tbody id ="tblUserBody">

                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="viewFeedback">
                    <div class="page-content">
                        <div class="container">
                            <table class="table table-hover table-responsive" id="tblFeedback">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Email ID</th>
                                        <th scope="col">User Feedback</th>
                                    </tr>
                                </thead>
                                <tbody id ="tblFeedbackBody">
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="addDisease">
                    <div class="page-content">
                        <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                            <div class="mdl-card__title">
                                <h1 class="mdl-card__title-text">Welcome, Admin</h1>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <p>Start by entering your possible symptoms.</p>
                                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                                    <select class="mdl-textfield__input" id="symp1" name="symptom1">

                                    </select>
                                    <label class="mdl-textfield__label" for="symptom1">Select your Symptom</label>
                                </div>
                                <div id="prediction"></div>
                            </div>
                            <div class="mdl-card__actions mdl-card--border">
                                <a href="#" class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect" onclick="getPrediction()">
                                    Predict
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>
