/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listners;

import java.sql.SQLException;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * Web application lifecycle listener.
 *
 * @author Acer
 */
public class connect_database_Listner implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
                     Statement stmt = null;

        //connect database
       try{
      //STEP 2: Register JDBC driver
      Class.forName("org.postgresql.Driver");

      //STEP 3: Open a connection
      System.out.println("Connecting to database...");
     Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5433/postgres","postgres","1121");

      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
      sce.getServletContext().setAttribute("stmt", stmt);
    }
    catch (ClassNotFoundException ex) {
            Logger.getLogger(connect_database_Listner.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(connect_database_Listner.class.getName()).log(Level.SEVERE, null, ex);
        }}
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
