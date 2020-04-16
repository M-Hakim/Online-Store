<%-- 
    Document   : admin_users
    Created on : Apr 10, 2020, 6:16:23 AM
    Author     : Family
--%>

<%@page import="com.onlinestore.daos.UserDAO"%>
<%@page import="com.onlinestore.models.User"%>
<%@page import="com.onlinestore.models.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    User user = (User) session.getAttribute("users");
    if ( user == null || !user.getIsAdmin() ) {
        response.sendRedirect("../customer/Login.jsp");
    } 
%> 
<jsp:include page="admin_header.jsp">
    <jsp:param name="currentPage" value="users"/>
</jsp:include>



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
          <h3 class="card-header text-center font-weight-bold text-uppercase py-4">Users</h3>

            <!--Card content-->
            <div class="card-body">

                <div id="table" class="table-editable">
                    <span class="table-add float-right mb-3 mr-2">
                        <a href="#!" class="text-success"><i class="fas fa-plus fa-2x" aria-hidden="true"></i></a>
                    </span>
                    <table class="table table-bordered table-responsive-md table-striped text-center">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center">User Name</th>
                                <th class="text-center">Password</th>
                                <th class="text-center">Role</th>
                                <th class="text-center">Credit</th>
                                <th class="text-center">email</th>
                                <th class="text-center">Birthday</th>
                                <th class="text-center">Job</th>
                                <th class="text-center">Address</th>
                                <th class="text-center">Interests</th>
                                <th class="text-center">Submit</th>
                                <th class="text-center">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                UserDAO userDAO = new UserDAO();
                                ArrayList<User> allUsers = userDAO.getAll();
                       
                                for (int i = 0; i < allUsers.size(); i++) {

                            %>
                            <tr id="<%=allUsers.get(i).getId()%>">
                                <td class="pt-3-half"><%=i+1%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allUsers.get(i).getUserName()%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allUsers.get(i).getPassword()%></td>
                                <td class="pt-3-half">
                                    <select class="browser-default custom-select">
                                        <%
                                            
                                            if(allUsers.get(i).getIsAdmin()){
                                        %>
                                        <option value="0">Customer</option>
                                        <option value="1" selected>Administrator</option>
                                        <%
                                            }
                                            else{
                                        %>
                                        <option value="0" selected>Customer</option>
                                        <option value="1">Administrator</option>                                        <%
                                            }
                                        %>
                                    </select>
                                </td>
                                <td class="pt-3-half" contenteditable="true"><%=allUsers.get(i).getCreditLimit()%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allUsers.get(i).getEmail()%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allUsers.get(i).getBirthday()%></td>
                                <td class="pt-3-half" contenteditable="true"><%=allUsers.get(i).getJob()%></td>
                                <td class="pt-3-half" contenteditable="true" ><%=allUsers.get(i).getAddress()%></td>
                                <td class="pt-3-half" contenteditable="true" style="word-break:break-all;"><%=allUsers.get(i).getInterests()%></td>
                                <td>
                                    <span class="table-submit">
                                        <button type="button" class="btn btn-primary btn-rounded btn-sm my-0">Submit</button>
                                    </span>
                                </td>
                                <td>
                                    <span class="table-remove">
                                        <button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button>
                                    </span>
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
<script src="js/admin_users_script.js"></script>

</body>

</html>
