/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.servlets;

import com.onlinestore.daos.UserDAO;
import com.onlinestore.database.Database;
import com.onlinestore.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class LoginServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //recievedata
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");

            UserDAO userDAO = new UserDAO();

            if (userDAO.search(name, pass) != null) {
                User user = userDAO.search(name, pass);
                HttpSession session = request.getSession(true);
                System.out.println(session.getId());
                Cookie cookie = new Cookie("JSESSIONID", session.getId());
                cookie.setMaxAge(Integer.MAX_VALUE);
                response.addCookie(cookie);
                session.setAttribute("users", user);
                 if (user.getIsAdmin()) {
                response.sendRedirect("./admin/admin_customers.jsp");
            } else {
              response.sendRedirect("./customer/ProductsTest.jsp");
                
                 
                 }} else {
               response.sendRedirect("./customer/sign_in.html");
                
            }

        }
    }


    }
