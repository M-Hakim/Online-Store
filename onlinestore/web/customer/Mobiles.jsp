<%@page import="com.onlinestore.models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page import="com.onlinestore.database.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("users");
    if (user != null && user.getIsAdmin()) {
        response.sendRedirect("../admin/admin_products.jsp");
    }

    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Smart Phones - Online Store</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Sublime project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/main_styles.css">
        <link rel="stylesheet" type="text/css" href="styles/responsive.css">
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
                                                <li>Smart Phones</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Products -->
            <div class="products">
                <div class="container">
                    <div class="row">
                        <div class="col">

                            <div class="product_grid">
                                <%  
                                    ProductDAO productDAO = new ProductDAO();
                                    ArrayList<Product> allProducts = productDAO.getByCategoryId(1);
                                    if(allProducts == null || allProducts.size() == 0)
                                        out.println("No Items Available!");
                                    else{
                                    int i = 0;
                                    while (i < allProducts.size()) {

                                %>

                                <!-- Product -->

                                <div class="product">
                                    <div class="card">
                                        <img class="card-img" src="<%=allProducts.get(i).getImgurl()%>" alt="">
                                        <div class="card-img-overlay d-flex justify-content-end">
                                        </div>
                                        <div class="card-body">
                                            <a href="Producttest.jsp?id=<%=allProducts.get(i).getId()%>"><h4 class="card-title"><%=allProducts.get(i).getProductName()%></h4></a>

                                            <div class="buy d-flex justify-content-between align-items-center">
                                                <div class="price text-success"><h5 class="mt-4">$<%=allProducts.get(i).getPrice()%></h5></div>
                                                <a href="Producttest.jsp?id=<%=allProducts.get(i).getId()%>" target="blank" style="cursor: pointer; color: white;" class="btn btn-danger mt-3"> Add to Cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        i++;
                                    }
                                }
                                %>

                            </div>

                        </div>
                    </div>
                    <!-- <div style="margin: auto" class="button cart_button"><a style="color: #1B1B1B;">See all products >></a></div>-->

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
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>