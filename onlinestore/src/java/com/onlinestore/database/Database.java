package com.onlinestore.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Database {

    private static final String url = "jdbc:postgresql://localhost:5432/ecommerce";
    private static final String user = "postgres";
    private static final String password = "postgres";
    private static Connection conn = null;
    private static Database database = null;

    private Database() {
    }

    public static Database getDatabaseInstance() {
        if (database == null) {
            database = new Database();
        }
        return database;
    }

    public static void connect() {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connection is made successfully");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static Connection getConnectionInstance() {
        if (conn == null) {
            connect();
        }
        return conn;
    }

    public static void disconnect() {
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
