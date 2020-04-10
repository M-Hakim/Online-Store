<%-- 
    Document   : ProductsTest
    Created on : Apr 1, 2020, 1:17:35 AM
    Author     : THE PR!NCE
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page import="com.onlinestore.database.Database"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! 
    ProductDAO productDAO = new ProductDAO();
    public void jspInit() {
        Database.connect();
    }

    public void jspDestroy() {
        Database.disconnect();
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sublime</title>
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
    </head>
    <body>
       	<!-- Products -->

        <div class="products">
            <div class="container">
                <div class="row">
                    <div class="col">

                        <div class="product_grid">
                            <%
                                ArrayList<Product> allProducts = productDAO.getAll();
                                
                                for(int i=0; i<allProducts.size(); i++){
                                    
                            %>

                            <!-- Product -->
                            <div class="product">
                                <div class="product_image"><img src="<%=allProducts.get(i).getImgurl()%>" alt=""></div>
                                <div class="product_extra product_new"><a href="categories.html">New</a></div>
                                <div class="product_content">
                                    <div class="product_title"><a href="product.html"><%=allProducts.get(i).getProductName()%></a></div>
                                    <div class="product_price">$<%=allProducts.get(i).getPrice()%></div>
                                </div>
                            </div>
                            <%
                                }
                            %>

                        </div>

                    </div>
                </div>
            </div>
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
