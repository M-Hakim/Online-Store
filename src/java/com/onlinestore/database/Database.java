package com.onlinestore.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sandy
 */
public class Database extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    String sqlcommand;

    public void init() throws ServletException {
        try {
            Class.forName("org.postgresql.Driver");
            try {
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "123456");
                System.out.println("helllllo");
            } catch (SQLException ex) {
                Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        Integer id = Integer.parseInt(request.getParameter("id"));
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String b_date = request.getParameter("b_date");
        String address = request.getParameter("address");
        Integer credit = Integer.parseInt(request.getParameter("credit"));
        String category_type = request.getParameter("category_type");

        try {
            sqlcommand = "insert into users(id,uname,password,email,b_date,address,credit,category_type) VALUES (?, ? ,? ,? ,?, ?, ?, ? )";
            ps = con.prepareStatement(sqlcommand);
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

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Connection openConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void closeConnection() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
