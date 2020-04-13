<%-- 
    Document   : CheckoutTest
    Created on : Apr 7, 2020, 8:03:06 PM
    Author     : Mostafa
--%>

<%@page import="com.onlinestore.models.User"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Checkout</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Sublime project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/checkout.css">
<link rel="stylesheet" type="text/css" href="styles/checkout_responsive.css">
 <script src="jquery-3.4.1.min.js" type="text/javascript"></script>
 <script src="checkout.js" type="text/javascript"></script>
</head>
<body>
                                                                            <%  
              float Total = 0 ; 
              User user = (User) session.getAttribute("users") ;
            Map products =(HashMap<Integer, Integer>) session.getAttribute("products") ;
                if (products==null || user == null){
                    
          %>   <jsp:forward page="productsTest.jsp" />
                
             <%   }
else{
      
        Product product = new Product () ;
        Iterator it = products.entrySet().iterator();
         ProductDAO productDAO = new ProductDAO() ;
    %>
     <header class="header">
		<div class="header_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="header_content d-flex flex-row align-items-center justify-content-start">
							<div class="logo"><a href="ProductsTest.jsp">Sublime.</a></div>
							<nav class="main_nav">
								<ul>
									<li class="hassubs active">
										<a href="ProductsTest.jsp">Home</a>
										<ul>
											<li><a href="categories.html">Categories</a></li>
											<li><a href="product.html">Product</a></li>
											<li><a href="CartTest.jsp">Cart</a></li>
											<li><a href="checkout.html">Check out</a></li>
											<li><a href="contact.html">Contact</a></li>
										</ul>
									</li>
									<li class="hassubs">
										<a href="categories.html">Categories</a>
										<ul>
											<li><a href="categories.html">Category</a></li>
											<li><a href="categories.html">Category</a></li>
											<li><a href="categories.html">Category</a></li>
											<li><a href="categories.html">Category</a></li>
											<li><a href="categories.html">Category</a></li>
										</ul>
									</li>
									<li><a href="#">Accessories</a></li>
									<li><a href="#">Offers</a></li>
									<li><a href="contact.html">Contact</a></li>
								</ul>
							</nav>
							<div class="header_extra ml-auto">
								<div class="shopping_cart">
									<a href="CartTest.jsp">
										<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
												 viewBox="0 0 489 489" style="enable-background:new 0 0 489 489;" xml:space="preserve">
											
										</svg>
										<div>Cart <span>(0)</span></div>
									</a>
								</div>
								<div class="search">
									<div class="search_icon">
										<svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
										viewBox="0 0 475.084 475.084" style="enable-background:new 0 0 475.084 475.084;"
										 xml:space="preserve">
										
									</svg>
									</div>
								</div>
								<div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Search Panel -->
		<div class="search_panel trans_300">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="search_panel_content d-flex flex-row align-items-center justify-content-end">
							<form action="#">
								<input type="text" class="search_input" placeholder="Search" required="required">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Social -->
		<div class="header_social">
			<ul>
				<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
			</ul>
		</div>
	</header>
    
        <div class="checkout">
		<div class="container">
			<div class="row">

				<!-- Billing Info -->
				<div class="col-lg-6" style="display: none;" >
					<div class="billing checkout_section">
						<div class="section_title">Billing Address</div>
						<div class="section_subtitle">Enter your address info</div>
						<div class="checkout_form_container">
							<form action="#" id="checkout_form" class="checkout_form">
								<div class="row">
									<div class="col-xl-6">
										<!-- Name -->
										<label for="checkout_name">First Name*</label>
										<input type="text" id="checkout_name" class="checkout_input" required="required">
									</div>
									<div class="col-xl-6 last_name_col">
										<!-- Last Name -->
										<label for="checkout_last_name">Last Name*</label>
										<input type="text" id="checkout_last_name" class="checkout_input" required="required">
									</div>
								</div>
								<div>
									<!-- Company -->
									<label for="checkout_company">Company</label>
									<input type="text" id="checkout_company" class="checkout_input">
								</div>
								<div>
									<!-- Country -->
									<label for="checkout_country">Country*</label>
									<select name="checkout_country" id="checkout_country" class="dropdown_item_select checkout_input" require="required">
										<option></option>
										<option>Lithuania</option>
										<option>Sweden</option>
										<option>UK</option>
										<option>Italy</option>
									</select>
								</div>
								<div>
									<!-- Address -->
									<label for="checkout_address">Address*</label>
									<input type="text" id="checkout_address" class="checkout_input" required="required">
									<input type="text" id="checkout_address_2" class="checkout_input checkout_address_2" required="required">
								</div>
								<div>
									<!-- Zipcode -->
									<label for="checkout_zipcode">Zipcode*</label>
									<input type="text" id="checkout_zipcode" class="checkout_input" required="required">
								</div>
								<div>
									<!-- City / Town -->
									<label for="checkout_city">City/Town*</label>
									<select name="checkout_city" id="checkout_city" class="dropdown_item_select checkout_input" require="required">
										<option></option>
										<option>City</option>
										<option>City</option>
										<option>City</option>
										<option>City</option>
									</select>
								</div>
								<div>
									<!-- Province -->
									<label for="checkout_province">Province*</label>
									<select name="checkout_province" id="checkout_province" class="dropdown_item_select checkout_input" require="required">
										<option></option>
										<option>Province</option>
										<option>Province</option>
										<option>Province</option>
										<option>Province</option>
									</select>
								</div>
								<div>
									<!-- Phone no -->
									<label for="checkout_phone">Phone no*</label>
									<input type="phone" id="checkout_phone" class="checkout_input" required="required">
								</div>
								<div>
									<!-- Email -->
									<label for="checkout_email">Email Address*</label>
									<input type="phone" id="checkout_email" class="checkout_input" required="required">
								</div>
								<div class="checkout_extra">
									<div>
										<input type="checkbox" id="checkbox_terms" name="regular_checkbox" class="regular_checkbox" checked="checked">
										<label for="checkbox_terms"><img src="images/check.png" alt=""></label>
										<span class="checkbox_title">Terms and conditions</span>
									</div>
									<div>
										<input type="checkbox" id="checkbox_account" name="regular_checkbox" class="regular_checkbox">
										<label for="checkbox_account"><img src="images/check.png" alt=""></label>
										<span class="checkbox_title">Create an account</span>
									</div>
									<div>
										<input type="checkbox" id="checkbox_newsletter" name="regular_checkbox" class="regular_checkbox">
										<label for="checkbox_newsletter"><img src="images/check.png" alt=""></label>
										<span class="checkbox_title">Subscribe to our newsletter</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Order Info -->

				<div class="col-lg-6">
					<div class="order checkout_section">
						<div class="section_title">Your order</div>
						<div class="section_subtitle">Order details</div>

						<!-- Order details -->
						<div class="order_list_container">
							<div class="order_list_bar d-flex flex-row align-items-center justify-content-start">
								<div class="order_list_title">Product</div>
								<div class="order_list_value ml-auto">Total</div>
							</div>
                          
							<ul class="order_list">
                 <%

        while (it.hasNext())
        {
        Map.Entry pair = (Map.Entry) it.next();
         int pid = (int) pair.getKey();
         int pqty = (int) pair.getValue() ;
         product = productDAO.get(pid);
if ( pqty>0){
       Total += product.getPrice()*pqty ; 
            %>
								<li class="d-flex flex-row align-items-center justify-content-start">
                                                                        
									<div class="order_list_title"><%=product.getProductName()%></div>
									<div class="order_list_value ml-auto"><%=product.getPrice()*pqty%></div>
								</li>
                                                              <%}}}%>   
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title">Subtotal</div>
									<div class="order_list_value ml-auto"><%=Total%></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title">Credit Limit</div>
									<div class="order_list_value ml-auto"><%=user.getCreditLimit()%></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="order_list_title">Total</div>
									<div class="order_list_value ml-auto"><%=Total%></div>
								</li>
							</ul>
						</div>

						<!-- Payment Options -->
						<div class="payment" style="display: none;" >
							<div class="payment_options">
								<label class="payment_option clearfix">Paypal
									<input type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
								<label class="payment_option clearfix">Cach on delivery
									<input type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
								<label class="payment_option clearfix">Credit card
									<input type="radio" name="radio">
									<span class="checkmark"></span>
								</label>
								<label class="payment_option clearfix">Direct bank transfer
									<input type="radio" checked="checked" name="radio">
									<span class="checkmark"></span>
								</label>
							</div>
						</div>

						<!-- Order Text -->
						<div class="order_text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra temp or so dales. Phasellus sagittis auctor gravida. Integ er bibendum sodales arcu id te mpus. Ut consectetur lacus.</div>
                                                <div class="button order_button" id="buybutt"><a href="../Checkout" >Place Order</a></div>
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
<script src="plugins/easing/easing.js"></script>
<script src="plugins/parallax-js-master/parallax.min.js"></script>
<script src="js/checkout.js"></script>
       
    </body>
</html>
