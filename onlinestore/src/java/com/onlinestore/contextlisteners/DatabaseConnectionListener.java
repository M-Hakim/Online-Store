/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.contextlisteners;

import com.onlinestore.database.Database;
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
public class DatabaseConnectionListener implements ServletContextListener {

    Connection conn = null;

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        Database.connect();
        conn = Database.getConnectionInstance();
        sce.getServletContext().setAttribute("dbConnection", conn);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        Database.disconnect();
    }
}
