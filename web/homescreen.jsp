<%-- 
    Document   : homescreen
    Created on : Nov 3, 2017, 9:20:25 PM
    Author     : GHANSHYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage | Health Prediction System</title>
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.teal-red.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Kanit" rel="stylesheet">
        <link href="css/homescreen.css" rel ="stylesheet" type ="text/css">
        <link href="css/bootstrap.css" rel ="stylesheet" type ="text/css">
        <link href="css/bootstrap.min.css" rel ="stylesheet" type ="text/css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/homepage.js"></script>
    </head>
    <body>
        <!-- Simple header with fixed tabs. -->
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header
             mdl-layout--fixed-tabs">
            <header class="mdl-layout__header mdl-layout__header--waterfall">
                <div class="mdl-layout__header-row">
                    <!-- Title -->
                    <span class="mdl-layout-title">Smart Health Prediction System</span>

                    <!-- Add spacer, to align navigation to the right -->
                    <div class="mdl-layout-spacer"></div>
                    <!-- Navigation. We hide it in small screens. -->
                    <nav class="mdl-navigation ">
                        <button type="submit" name="logout" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored logoutBtn" >
                            Logout
                        </button>
                        <!--<a class="mdl-navigation__link" id="register" href="#">New User</a>-->
                    </nav>
                </div>
                <!-- Tabs -->
                <div class="mdl-layout__tab-bar mdl-js-ripple-effect">
                    <a href="#diagnose" class="mdl-layout__tab is-active">Diagnose</a>
                    <a href="#feedback" class="mdl-layout__tab moveDown">Add Feedback</a>
                    <a href="#diagnoseHistory" class="mdl-layout__tab moveDown">My Diagnose History</a>

                </div>
            </header>
            <main class="mdl-layout__content centerIt">
                <section class="mdl-layout__tab-panel is-active" id="diagnose">
                    <div class="page-content">
                        <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                            <div class="mdl-card__title">
                                <h1 class="mdl-card__title-text">Welcome, ${sessionScope.user}</h1>
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
                                    Next
                                </a>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="mdl-layout__tab-panel" id="feedback">
                    <div class="page-content">
                        <div class="demo-card-wide mdl-card mdl-shadow--2dp">
                            <div class="mdl-card__title">
                                <h1 class="mdl-card__title-text">Welcome, ${sessionScope.user}</h1>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <p>Fill in your contact details followed by the message and we shall get in touch with as soon as possible</p>
                                <div class="input-group">${response}</div>
                                <div class = "mdl-textfield mdl-js-textfield mdl-textfiled--full-width mdl-textfield--floating-label">
                                    <input class = "mdl-textfield__input" type = "email" id = "eid" name="email" required/>
                                    <label class = "mdl-textfield__label" for = "eid">Email</label>
                                </div>
                                <div class = "mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                                    <textarea class = "mdl-textfield__input" type = "text" rows =  "2" name="feedback"
                                              id = "feedbk" required/></textarea>
                                    <label class = "mdl-textfield__label" for = "feedbk">Enter your Feedback</label>
                                </div>
                                <div style="padding: 1em 3em; text-align: right;">
                                    <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="button" onclick="sendFeedback()">Submit</button>
                                </div>
                            </div>
                            <div id="prediction"></div>
                        </div>

                    </div>

                </section>
                <section class="mdl-layout__tab-panel" id="diagnoseHistory">
                    <div class="page-content historyTable">
                        <table class="table table-hover table-responsive">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">My Symptoms</th>
                                    <th scope="col">Predicted Disease</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>

                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>
