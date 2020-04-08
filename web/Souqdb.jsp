<%-- 
    Document   : Souqdb
    Created on : Mar 31, 2020, 11:39:08 PM
    Author     : sandy
--%>
<%-- 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
--%>

<%@ page contentType="text/html;  charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>sandyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy</h1>
       
        <%!
            Connection con;
            PreparedStatement ps;
            String sqlcommand;
        %>
        <%
           
            try {
                
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "123456");
                System.out.println("ayaaaaaaaaaaaaaaaaa1");
                Integer id = Integer.parseInt(request.getParameter("id"));
                String uname = request.getParameter("uname");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String b_date = request.getParameter("b_date");
                String address = request.getParameter("address");
                Integer credit = Integer.parseInt(request.getParameter("credit"));
                String category_type = request.getParameter("category_type");
                System.out.println("ayaaaaaaaaaaaaaaaaa2");
                 
                 
                sqlcommand = "insert into users(id,uname,password,email,b_date,address,credit,category_type) VALUES (?, ? ,? ,? ,?, ?, ?, ? )";
                ps=con.prepareStatement(sqlcommand);
                ps.setInt(1, id);
                ps.setString(2, uname);
                ps.setString(3, password);
                ps.setString(4, email);
                ps.setString(5, b_date);
                ps.setString(6, address);
                ps.setInt(7, credit);
                ps.setString(8, category_type);
                System.out.println("ayaaaaaaaaaaaaaaaaa3");
                
                
                ps.executeUpdate(sqlcommand);
                System.out.println("ayaaaaaaaaaaaaaaaaa4");
            } catch (Exception e) {
                
               System.out.println(e.getMessage());
            }
        %>


    </body>
</html>
