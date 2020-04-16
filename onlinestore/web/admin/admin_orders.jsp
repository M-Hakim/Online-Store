<%-- 
    Document   : admin_users
    Created on : Apr 10, 2020, 6:16:23 AM
    Author     : Family
--%>

<%@page import="com.onlinestore.models.User"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Collections"%>
<%@page import="com.onlinestore.daos.HistoryDAO"%>
<%@page import="com.onlinestore.models.History"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    User user = (User) session.getAttribute("users");
    if ( user == null || !user.getIsAdmin() ) {
        response.sendRedirect("../customer/sign_in.html");
       // <jsp:forward page="../customer/sign_in.html" />
        } %> 

<jsp:include page="admin_header.jsp">
    <jsp:param name="currentPage" value="orders"/>
</jsp:include>
<%!
    HistoryDAO historyDAO = new HistoryDAO();
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

            <!--Card content-->
            <div class="card-body">


                <div id="table" class="table-editable">
                    <!--                <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i
                                          class="fas fa-plus fa-2x" aria-hidden="true"></i></a></span>-->
                    <table class="table table-bordered table-responsive-md table-striped text-center">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">Cart ID</th>
                                <th class="text-center">User Name</th>
                                <th class="text-center">Product Name</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Unit Price</th>
                                <th class="text-center">Total Price</th>
                                <th class="text-center">Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<History> allTransactions = historyDAO.getAll();
                                Collections.sort(allTransactions);
                                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
                                for (int i = 0; i < allTransactions.size(); i++) {

                            %>
                            <tr>
                                <td class="pt-3-half"><%=i + 1%></td>
                                <td class="pt-3-half"><%=allTransactions.get(i).getCard_Id()%></td>
                                <td class="pt-3-half"><%=allTransactions.get(i).getUser().getUserName()%></td>
                                <td class="pt-3-half"><%=allTransactions.get(i).getProduct().getProductName()%></td>

                                <td class="pt-3-half"><%=allTransactions.get(i).getProduct_Qty()%></td>
                                <td class="pt-3-half"><%=allTransactions.get(i).getProduct_Price()%></td>
                                <td class="pt-3-half">
                                    <%=allTransactions.get(i).getProduct_Qty()*allTransactions.get(i).getProduct_Price()%>
                                </td>
                                <td class="pt-3-half">
                                    <%=formatter.format(allTransactions.get(i).getBuy_history())%>
                                </td>


                            </tr>
                            <%
                                }
                            %>

                        </tbody>
                    </table>
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
</body>

</html>