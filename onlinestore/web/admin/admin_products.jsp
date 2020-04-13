<%-- 
    Document   : admin_products
    Created on : Apr 10, 2020, 6:16:23 AM
    Author     : Family
--%>

<%@page import="com.onlinestore.models.Category"%>
<%@page import="com.onlinestore.models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.onlinestore.daos.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp">
    <jsp:param name="currentPage" value="products"/>
</jsp:include>


<%!
    ProductDAO productDAO = new ProductDAO();
%>

<!--Grid row-->
<!--############################################################################-->
<!--############################################################################-->
<!--############################################################################-->
<!--############################################################################-->
<div class="row wow fadeIn">

    <!--Grid column-->
    <div class="col">

        <!--Card-->
        <div class="card">
          <h3 class="card-header text-center font-weight-bold text-uppercase py-4">Products</h3>

            <!--Card content-->
            <div class="card-body">

                <div id="table" class="table-editable">
                    <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
                                class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
                    <table class="table table-bordered table-responsive-md table-striped text-center">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Product Name</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Category</th>
                                <th class="text-center">Description</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Image URL</th>
                                <th class="text-center">Submit</th>
                                <th class="text-center">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Product> allProducts = productDAO.getAll();
                                ArrayList<Category> allCategories = new ArrayList<>();
                                allCategories.add(new Category(1, "mobiles"));
                                allCategories.add(new Category(2, "laptops"));

                                for (int i = 0; i < allProducts.size(); i++) {

                            %>
                            <tr id="<%=allProducts.get(i).getId()%>">
                                <td class="pt-3-half"><%=i+1%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allProducts.get(i).getProductName()%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allProducts.get(i).getQuantity()%></td>
                                <td class="pt-3-half">
                                    <select class="browser-default custom-select">
                                        <%
                                            for (int j = 0; j < allCategories.size(); j++) {
                                            if(allProducts.get(i).getCategoryId() != allCategories.get(j).getId()){
                                        %>
                                        <option value="<%=allCategories.get(j).getId()%>"><%=allCategories.get(j).getName()%></option>
                                        <%
                                            }
                                            else{
                                        %>
                                        <option value="<%=allCategories.get(j).getId()%>" selected><%=allCategories.get(j).getName()%></option>
                                        <%
                                            }
                                        %>
                                    
                                    <%
                                        }
                                    %>
                                    </select>
                                </td>
                                <td class="pt-3-half" contenteditable="true"><%=allProducts.get(i).getDescription()%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allProducts.get(i).getPrice()%></td>
                                <td class="pt-3-half" contenteditable="true" style="word-break:break-all;"><%=allProducts.get(i).getImgurl()%></td>
                                <td>
                                    <span class="table-submit"><button type="button"
                                                                       class="btn btn-primary btn-rounded btn-sm my-0">Submit</button></span>
                                </td>
                                <td>
                                    <span class="table-remove"><button type="button"
                                                                       class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
                                </td>
                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                    <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
                                class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>
                </div>

            </div>
        </div>
    </div>
    <!--/.Card-->

</div>
<!--##############################################################################-->
<!--##############################################################################-->
<!--##############################################################################-->
<!--##############################################################################-->
<!--##############################################################################-->
<!--##############################################################################-->

<%@include file="admin_footer.jsp" %>
<script src="js/admin_products_script.js"></script>

</body>

</html>
