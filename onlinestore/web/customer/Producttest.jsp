<%-- 
    Document   : ProductsTest
    Created on : Apr 1, 2020, 1:17:35 AM
    Author     : THE PR!NCE
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Item Details</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Sublime project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
        <link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
        <link rel="stylesheet" type="text/css" href="styles/product.css">
        <link rel="stylesheet" type="text/css" href="styles/product_responsive.css">
        <script src="jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="addtocard.js" type="text/javascript"></script>
    </head>
    <body>

        <div class="super_container">

          <jsp:include page='HeaderTest.jsp'/>



<!-- Home -->

	<div class="home">
		<div class="home_container">
			<div class="home_background" style="background-image:url(images/categories.jpg)"></div>
			<div class="home_content_container">
				<div class="container">
					<div class="row">
						<div class="col">
							<div class="home_content">
								<div class="home_title">Item Details<span></span></div>
								<div class="home_text"><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam a ultricies metus. Sed nec molestie eros. Sed viverra velit venenatis fermentum luctus.</p></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

            <%

                Product product = new Product();
                ProductDAO productdao = new ProductDAO();
                int Id = Integer.parseInt(request.getParameter("id"));
                product = productdao.get(Id);


            %>


            <!-- Products -->

            <div class="product_details">
                <div class="container">
                    <div class="row details_row">

                        <!-- Product Image -->
                        <div class="col-lg-6">
                            <div class="details_image">
                                <div class="details_image_large"><img src="<%=  product.getImgurl()%>" alt=""><div class="product_extra product_new"><a href="categories.html">New</a></div></div>
<!--                                <div class="details_image_thumbnails d-flex flex-row align-items-start justify-content-between">
                                    <div class="details_image_thumbnail active" data-image="<%=  product.getImgurl()%>"><img src="<%=  product.getImgurl()%>" alt=""></div>
                                    <div class="details_image_thumbnail" data-image="<%=  product.getImgurl()%>"><img src="<%=  product.getImgurl()%>" alt=""></div>
                                    <div class="details_image_thumbnail" data-image="<%=  product.getImgurl()%>"><img src="<%=  product.getImgurl()%>" alt=""></div>
                                    <div class="details_image_thumbnail" data-image="<%=  product.getImgurl()%>"><img src="<%=  product.getImgurl()%>" alt=""></div>
                                </div>-->
                            </div>
                        </div>

                        <!-- Product Content -->
                        <div class="col-lg-6">
                            <div class="details_content">
                                <div class="details_name"><%= product.getProductName()%></div>
                                <div class="details_discount">$890</div>
                                <div class="details_price"><%=  product.getPrice()%></div>

                                <!-- In Stock -->
                                <div class="in_stock_container">
                                    <div class="availability">Availability:</div>
                                    <span>In Stock</span>
                                </div>
                                <div class="details_text">
                                    <p><%=     product.getDescription()%></p>
                                </div>

                                <!-- Product Quantity -->
                                <div class="product_quantity_container">
                                    <div class="product_quantity clearfix">
                                        <span style="color: #1B1B1B;">Qty</span>
                                        <div id="productid" data-val="<%=product.getId()%>"></div>
                                        <input id="quantity_input" type="text" pattern="[0-9]*" style="color: #1B1B1B;" value="1">
                                        <div class="quantity_buttons">
                                            <div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
                                            <div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
                                        </div>
                                    </div>
                                        <div class="button cart_button" id="actionbtn"><a style="color: #1B1B1B;">Add to cart</a></div>

                                    <p id="someHiddenDiv" style="display: none;" >you cannot buy this quantity you exceeded th available quantity</p>
                                </div>



                            </div>
                        </div>
                    </div>

                    <div class="row description_row">
                        <div class="col">
                            <div class="description_title_container">
                                <div class="description_title">Description</div>
                                <!--<div class="reviews_title"><a href="#">Reviews <span>(1)</span></a></div>-->
                            </div>
                            <div class="description_text">
                                <p><%=     product.getDescription()%></p>
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
        <script src="plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
        <script src="plugins/Isotope/isotope.pkgd.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>


    </body>
</html>
<!--
<script src="js/product.js"></script>
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
-->