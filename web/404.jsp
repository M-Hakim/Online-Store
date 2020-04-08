<%-- 
    Document   : 404.jsp
    Created on : Apr 7, 2020, 4:26:42 AM
    Author     : sandy
--%>


<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<HTML>
<HEAD><TITLE>Random Numbers Page</TITLE></HEAD>
<BODY BGCOLOR="white">
<H1>Random Numbers Page</h1>
<P>This will display 20 random numbers </P>
<FORM METHOD=GET         ACTION="${pageContext.request.contextPath}/randomNumberServlet">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Get Numbers Here">
</FORM>
</BODY>
</HTML>