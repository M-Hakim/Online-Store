<%-- 
    Document   : index
    Created on : Apr 4, 2020, 6:59:45 AM
    Author     : THE PR!NCE
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "https://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>jQuery, Ajax and Servlet/JSP integration example</title>

        <script src="js/jquery-3.4.1.min.js"
        type="text/javascript"></script>
        <script src="js/app-ajax.js" type="text/javascript"></script>
    </head>
    <body>

        <form>
            Enter product Name: <input type="text" id="productName" />
            <br>
            <br>
            Enter its quantity: <input type="text" id="qty" />
        </form>
        <br>
        <br>
        <button id="actionbtn">Action!</button>
        <br>
        <br>

        <strong>Ajax Response</strong>:
        <div id="ajaxGetUserServletResponse"></div>
    </body>
</html>
