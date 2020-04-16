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
        
        HttpSession s = request.getSession(false);
        User u = (User) s.getAttribute("users");
        if (u != null) {

            if (u.getIsAdmin()) {
                response.sendRedirect("../admin/admin_products.jsp");

            } else {
                response.sendRedirect("Home.jsp");
            }
        }


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
                    response.sendRedirect("./admin/admin_products.jsp");
                } else {
                    response.sendRedirect("./customer/Home.jsp");

                }
            } else {
                response.sendRedirect("./customer/LoginError.jsp");

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
