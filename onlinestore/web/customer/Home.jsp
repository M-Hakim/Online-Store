<%-- 
    Document   : Home
    Created on : Apr 16, 2020, 6:05:01 AM
    Author     : THE PR!NCE
--%>
<%@page import="com.onlinestore.models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page import="com.onlinestore.database.Database"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
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
        <title>Online Store</title>
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
        <link rel="shortcut icon" type="image/x-icon" href="images/icons/favicon.ico" />
    </head>
    <body>

        <div class="super_container">

            <!-- Header -->
            <jsp:include page='HeaderTest.jsp'/>
            <!-- Home -->

            <div class="home">
                <div class="home_slider_container">

                    <!-- Home Slider -->
                    <div class="owl-carousel owl-theme home_slider">
                        <%for (int i = 0; i < 3; i++) { %>
                        <!-- Slider Item -->
                        <div class="owl-item home_slider_item">
                            <div class="home_slider_background" style="background-image:url(images/home_slider_1.jpg)"></div>
                            <div class="home_slider_content_container">
                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <div class="home_slider_content"  data-animation-in="fadeIn" data-animation-out="animate-out fadeOut">
                                                <div class="home_slider_title">A new Online Shop experience.</div>
                                                <div class="home_slider_subtitle">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie eros. Sed viverra velit venenatis fermentum luctus.</div>
                                                <div class="button button_light home_button"><a href="#">Shop Now</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <% } %>




                    </div>

                    <!-- Home Slider Dots -->



                </div>
                <a name="catPosition"></a>
            </div>

            <!-- Ads -->
            <!--<a name="catPosition"></a>-->
            <div class="avds">
                <div class="avds_container d-flex flex-lg-row flex-column align-items-start justify-content-between">
                    <div class="avds_small">
                        <div class="avds_background" style="background-image:url(images/avds_small.jpg)"></div>
                        <div class="avds_small_inner">
                            <div class="avds_discount_container">
                                <img src="images/discount.png" alt="">
                                <div>
                                    <div class="avds_discount">
                                        <div>20<span>%</span></div>
                                        <div>Discount</div>
                                    </div>
                                </div>
                            </div>
                            <div class="avds_small_content">
                                <div class="avds_title">Smart Phones</div>
                                <div class="avds_link"><a style="font-size: x-large" href="Mobiles.jsp">See all</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="avds_large">
                        <div class="avds_background" style="background-image:url(images/laptops.jpg)"></div>
                        <div class="avds_large_container">
                            <div class="avds_large_content">
                                <div class="avds_title">Laptops</div>
                                <div class="avds_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie eros. Sed viver ra velit venenatis fermentum luctus.</div>
                                <div class="avds_link avds_link_large"><a style="font-size: x-large" href="Laptops.jsp">See all</a></div>
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
                                    ProductDAO productDAO;
                                    productDAO = new ProductDAO();
                                    ArrayList<Product> allProducts = productDAO.getAll();
                                    if(allProducts == null || allProducts.size() == 0)
                                        out.println("No Items Available!");
                                    else{
                                    int i = 0;
                                    while (i < allProducts.size() && i < 8) {

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
                                                <a style="cursor: pointer; color: white"id="<%=allProducts.get(i).getPrice()%>" class="btn btn-danger mt-3"> Add to Cart</a>
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



                <!-- Ad -->

                <div class="avds_xl">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="avds_xl_container clearfix">
                                    <div class="avds_xl_background" style="background-image:url(images/avds_xl.jpg)"></div>
                                    <div class="avds_xl_content">
                                        <div class="avds_title">Amazing Devices</div>
                                        <!--<div class="avds_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus.</div>-->
                                        <div class="avds_link avds_xl_link"><a style="font-size: x-large" href="ProductsTest.jsp">See all products >></a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
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