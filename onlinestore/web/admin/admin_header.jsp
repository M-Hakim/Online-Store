<%-- 
    Document   : admin_header
    Created on : Apr 11, 2020, 12:23:44 AM
    Author     : THE PR!NCE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String currentPage = request.getParameter("currentPage"); %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Online Store Administration</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet">
        <link href="css/editable_table.css" rel="stylesheet">
        
    </head>

    <body class="grey lighten-3">

        <!--Main Navigation-->
        <header>

            <!-- Navbar -->
            <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
                <div class="container-fluid">

                    <!-- Brand -->
                    <a class="navbar-brand waves-effect" href="https://mdbootstrap.com/docs/jquery/" target="_blank">
                        <strong class="blue-text">Online Store Administration</strong>
                    </a>

                    <!-- Collapse -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Links -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">

                        <!-- Left -->
                        <ul class="navbar-nav mr-auto">
                            <% switch (currentPage) 
                             { 
                             case "products": %>
                            <li class="nav-item active">
                                <a class="nav-link waves-effect" href="admin_products.jsp">Products
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link waves-effect" href="admin_customers.jsp">
                                    Customers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link waves-effect" href="admin_orders.jsp">
                                    Orders</a>
                            </li>
                            <% break; 
                             case "customers": %>
                            <li class="nav-item">
                                <a class="nav-link waves-effect" href="admin_products.jsp">Products
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link waves-effect" href="admin_customers.jsp">
                                    Customers</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link waves-effect" href="admin_orders.jsp">
                                    Orders</a>
                            </li>
                            <% break; 
                             case "orders": %>
                            <li class="nav-item">
                                <a class="nav-link waves-effect" href="admin_products.jsp">Products
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link waves-effect" href="admin_customers.jsp">
                                    Customers</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link waves-effect" href="admin_orders.jsp">
                                    Orders</a>
                            </li>
                            <% break; 
                             default: 
                             break; 
                             } %>

                        </ul>



                    </div>

                </div>
            </nav>
            <!-- Navbar -->

            <!-- Sidebar -->
            <div class="sidebar-fixed position-fixed">

                <a class="logo-wrapper waves-effect">
                    <img src="https://mdbootstrap.com/img/logo/mdb-email.png" class="img-fluid" alt="">
                </a>

                <div class="list-group list-group-flush">
                    <a href="#" class="list-group-item active waves-effect">
                        <i class="fas fa-chart-pie mr-3"></i>Dashboard
                    </a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        <i class="fas fa-user mr-3"></i>Profile</a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        <i class="fas fa-table mr-3"></i>Tables</a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        <i class="fas fa-map mr-3"></i>Maps</a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        <i class="fas fa-money-bill-alt mr-3"></i>Orders</a>
                </div>

            </div>
            <!-- Sidebar -->

        </header>
        <!--Main Navigation-->

        <!--Main layout-->
        <main class="pt-5 mx-lg-5">
            <div class="container-fluid mt-5">

                <!-- Heading -->
                <div class="card mb-4 wow fadeIn">

                    <!--Card content-->
                    <div class="card-body d-sm-flex justify-content-between">

                        <h4 class="mb-2 mb-sm-0 pt-1">
                            <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Home Page</a>
                            <span>/</span>
                            <span>Dashboard</span>
                        </h4>

                        <form class="d-flex justify-content-center">
                            <!-- Default input -->
                            <input type="search" placeholder="Type your query" aria-label="Search" class="form-control">
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                                <i class="fas fa-search"></i>
                            </button>

                        </form>

                    </div>

                </div>
                <!-- Heading -->

