/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.servlets;

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

/**
 *
 * @author Acer
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //recievedata
            String name = request.getParameter("name");
            String pass = request.getParameter("pass");

            //connect to database
//            Connection conn = null;
            Statement stmt = null;
            

            try {
                Connection conn = Database.getConnectionInstance();
                
//                stmt = (Statement) getServletContext().getAttribute("stmt");
                String sql;

                sql = "SELECT * FROM users WHERE username like " + "'" + name + "'" + "AND password like" + "'" + pass + "'";
                ResultSet rs = stmt.executeQuery(sql);

                //STEP 5: Extract data from result set
                if (rs.next()) {
                    //Retrieve by column name
                    User u1 = new User();
                    u1.setId(rs.getInt("id"));
                    u1.setUserName(rs.getString("username"));
                    u1.setPassword(rs.getString("password"));
                    u1.setEmail(rs.getString("email"));
                    u1.setBirthday(rs.getString("birthday"));
                    u1.setCreditLimit(rs.getInt("credit_limit"));
                    u1.setJob(rs.getString("job"));
                    u1.setInterests(rs.getString("interests"));
                    u1.setIsAdmin(rs.getBoolean("is_admin"));

                    request.getSession().setAttribute("users", u1);
                    RequestDispatcher v = request.getRequestDispatcher("/homepage");
                    v.forward(request, response);
                }
                else{
               out.println("<h1 >error .....Username or Password is not correct, plz try again "+ "</h1>");
               out.println("<a href=sign_in.html>"+ "login"+"</a>");
                }
                
            } catch (SQLException se) {
                //Handle errors for JDBC
                se.printStackTrace();
            } catch (Exception e) {
                //Handle errors for Class.forName
                e.printStackTrace();
            } finally {
                //finally block used to close resources
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                } catch (SQLException se2) {
                }// nothing we can do
              

            }}}

    

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