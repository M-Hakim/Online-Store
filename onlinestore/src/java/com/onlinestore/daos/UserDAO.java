/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.daos;

import com.onlinestore.database.Database;
import com.onlinestore.models.User;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author THE PR!NCE
 */
public class UserDAO implements DAO<User> {

    Connection conn = Database.getConnectionInstance();

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<User> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean save(User user) {
        boolean stmtSuccess = true;
        try (Statement stmt = conn.createStatement()){
            String sql = "INSERT INTO users (username,password,email,birthday,credit_limit,job,address,interests)"
                        + " VALUES" + "(" + "'" + user.getUserName() + "'" + ","
                        + "'" + user.getPassword() + "'" + ","
                        + "'" + user.getEmail() + "'" + ","
                        + "'" + user.getBirthday() + "'" + ","
                        + user.getCreditLimit() + ","
                        + "'" + user.getJob() + "'" + ","
                        + "'" + user.getAddress() + "'" + ","
                        + "'" + user.getInterests() + "'" + ")";
            stmt.executeUpdate(sql);
        } catch (SQLException ex) {
            stmtSuccess = false;
            System.out.println(ex.getMessage());
        }
        return stmtSuccess;
        
        
    }

    @Override
    public boolean update(User t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(User t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
