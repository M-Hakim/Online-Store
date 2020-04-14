<%-- 
    Document   : CartTest
    Created on : Mar 31, 2020, 6:52:01 AM
    Author     : Mostafa
--%>

<%@page import="com.onlinestore.models.User"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Sublime project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/cart.css">
        <link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">
        <script src="jquery-3.4.1.min.js" type="text/javascript"></script>
 <script src="BuyProduct.js" type="text/javascript"></script>
    </head>
    <body>
       
        
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
        
        
       <div class="cart_info">
		
			<div class="row">
				<div class="col">
					<!-- Column Titles -->
					<div class="cart_info_columns clearfix">
						<div class="cart_info_col cart_info_col_product">Product</div>
						<div class="cart_info_col cart_info_col_price">Price</div>
						<div class="cart_info_col cart_info_col_quantity">Quantity</div>
						<div class="cart_info_col cart_info_col_total">Total</div>
					</div>
				</div>
			</div>
                
        
         
                 
       
			<div class="row cart_items_row">
				<div class="col">
                                    <%  if (session.getAttribute("users")==null){
            %>
            <jsp:forward page="sign_in.html" />
            <% }else{
            Map products =(HashMap<Integer, Integer>) session.getAttribute("products") ;
                if (products==null || products.size()==0 ){
                    
          %>   <jsp:forward page="ProductsTest.jsp" />
                
             <%   }
else{ 
        User user = (User) session.getAttribute("users") ;

        float total = 0 ;
      
        Product product = new Product () ;
        Iterator it = products.entrySet().iterator();
         ProductDAO productDAO = new ProductDAO() ;
         
        while (it.hasNext())
        {int i = 1 ;

        Map.Entry pair = (Map.Entry) it.next();
         int pid = (int) pair.getKey();
         int pqty = (int) pair.getValue() ;
         product = productDAO.get(pid);
         total += product.getPrice()*pqty ;
// if (pqty>0){         
            %>
                                        
					<!-- Cart Item -->
					<div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
						<!-- Name -->
						<div class="cart_item_product d-flex flex-row align-items-center justify-content-start">
							<div class="cart_item_image">
                                                            <div><img src="<%=product.getImgurl()%>" alt=""></div>
							</div>
							<div class="cart_item_name_container">
                                                            <div class="cart_item_name"><a href="Producttest.jsp?id=<%=product.getId()%>">Smart Phone Deluxe Edition</a></div>
								<div class="cart_item_edit"><a href="#">Edit Product</a></div>
							</div>
						</div>
						<!-- Price -->
						<div class="cart_item_price"><%=product.getPrice()%></div>
						<!-- Quantity -->
						<div class="cart_item_quantity">
                                                    <div id="productid" data-val="<%=product.getId()%>"></div>
							<div class="product_quantity_container">
								<div class="product_quantity clearfix">
                                                                    <span><%=pqty%></span>
                                                                    <div id="productid" class="pid" data-val="<%=product.getId()%>"></div>
                                                                    <input id="quantity_input" class="in" name="input" type="text" pattern="[0-9]*" value="<%=pqty%>">
									<div class="quantity_buttons">
										<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
										<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
									
                                                                        </div>
								
                                                                </div>
                                                                        
							</div>
						</div>
						<!-- Total -->
						<div class="cart_item_total"><%=product.getPrice()*pqty%></div>
					</div>
<%
}
                        
  %>
				</div>
			</div>
                        
                        
			<div class="row row_cart_buttons">
				<div class="col">
					<div class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="button continue_shopping_button"><a href="ProductsTest.jsp">Continue shopping</a></div>
						<div class="cart_buttons_right ml-lg-auto">
							<div class="button clear_cart_button"><a href="../CartClear">Clear cart</a></div>
                                                        <div class="button update_cart_button" id="buybutton">Update cart</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row row_extra">
				<div class="col-lg-4">
					
					<!-- Delivery -->
					<div class="delivery">
						<div class="section_title">Shipping method</div>
						<div class="section_subtitle">Select the one you want</div>
						<div class="delivery_options">
							<label class="delivery_option clearfix">Next day delivery
								<input type="radio" name="radio">
								<span class="checkmark"></span>
								<span class="delivery_price">$4.99</span>
							</label>
							<label class="delivery_option clearfix">Standard delivery
								<input type="radio" name="radio">
								<span class="checkmark"></span>
								<span class="delivery_price">$1.99</span>
							</label>
							<label class="delivery_option clearfix">Personal pickup
								<input type="radio" checked="checked" name="radio">
								<span class="checkmark"></span>
								<span class="delivery_price">Free</span>
							</label>
						</div>
					</div>

					<!-- Coupon Code -->
					<div class="coupon">
						<div class="section_title">Coupon code</div>
						<div class="section_subtitle">Enter your coupon code</div>
						<div class="coupon_form_container">
							<form action="#" id="coupon_form" class="coupon_form">
								<input type="text" class="coupon_input" required="required">
								<button class="button coupon_button"><span>Apply</span></button>
							</form>
						</div>
					</div>
				</div>

				<div class="col-lg-6 offset-lg-2">
					<div class="cart_total">
						<div class="section_title">Cart total</div>
						<div class="section_subtitle">Final info</div>
						<div class="cart_total_container">
							<ul>
								<li class="d-flex flex-row align-items-center justify-content-start">
                                                                            <div class="cart_total_title">Subtotal</div>
                                                                            <div class="cart_total_value ml-auto"><%=total%></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Credit Limit</div>
									<div class="cart_total_value ml-auto"><%=user.getCreditLimit()%></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Rest</div>
									<div class="cart_total_value ml-auto"><%=user.getCreditLimit()-total%></div>
								</li>
							</ul>
						</div>
						<div class="button checkout_button"><a href="../CreditLimit">Proceed to checkout</a></div>
          <%
              }}
          %>                                      
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
<script src="js/cart.js"></script>
    </body>
</html>
