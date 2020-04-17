<%-- 
    Document   : LoginError
    Created on : Apr 17, 2020, 4:34:09 AM
    Author     : THE PR!NCE
--%>


<%@page import="com.onlinestore.models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    User user = (User) session.getAttribute("users");
    if (user != null) {

        if (user.getIsAdmin()) {
            response.sendRedirect("../admin/admin_products.jsp");

        } else {
            response.sendRedirect("Home.jsp");
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login - Online Store</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Sublime project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/contact.css">
        <link rel="stylesheet" type="text/css" href="styles/contact_responsive.css">
        <link rel="shortcut icon" type="image/x-icon" href="images/icons/favicon.ico" />
    </head>
    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page='HeaderTest.jsp'/>
            <!-- Home -->

            <div class="home">
                <div class="home_container">
                    <div class="home_background" style="background-image:url(images/contact.jpg)"></div>
                    <div class="home_content_container">
                        <div class="container">
                            <div class="row">
                                <div class="col">
                                    <div class="home_content">
                                        <div class="breadcrumbs">
                                            <ul>
                                                <li><a href="Home.jsp">Home</a></li>
                                                <li>Login</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Contact -->

            <div class="contact">
                <div class="container">
                    <div class="row">

                        <!-- Get in touch -->
                        <div class="col-lg-8 contact_col">
                            <div class="get_in_touch">
                                <div class="section_title">Login</div>
                                <div class="contact_form_container">
                                    <form  id="contact_form" class="contact_form" method="post" action="../login_servlet" >
                                        <div class="row">
                                            <div class="col-xl-6">
                                                <!-- Name -->
                                                <label for="contact_name">User Name</label>
                                                <input type="text" name="name" id="contact_name" class="contact_input" required="required">
                                            </div>
                                            <div class="col-xl-6 last_name_col">
                                                <!-- password -->
                                                <label for="contact_last_name">Password</label>
                                                <input type="password" name="pass" id="contact_last_name" class="contact_input" required="required">
                                            </div>



                                        </div>

                                        <button class="button contact_button"><span>Login</span></button>
                                        <p id="auth_fail" style="color: red; font-size: large;"> Wrong Credentials!</p>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <jsp:include page='FooterTest.jsp'/>
        </div>
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/greensock/TweenMax.min.js"></script>
        <script src="plugins/greensock/TimelineMax.min.js"></script>
        <script src="plugins/scrollmagic/ScrollMagic.min.js"></script>
        <script src="plugins/greensock/animation.gsap.min.js"></script>
        <script src="plugins/greensock/ScrollToPlugin.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="js/contact.js"></script>
    </body>
</html>




