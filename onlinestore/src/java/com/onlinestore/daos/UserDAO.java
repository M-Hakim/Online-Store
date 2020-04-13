/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.daos;

import com.onlinestore.database.Database;
import com.onlinestore.models.Product;
import com.onlinestore.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
     User user = new User();    
    try {
            PreparedStatement pst ;
            pst = conn.prepareStatement("select * from users where id = ?");
            pst.setInt(1,id);
            ResultSet rs;
            rs =pst.executeQuery();
                    rs.next();
                user.setId(rs.getInt(1));
                user.setUserName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setAddress(rs.getString(8));
                        user.setCreditLimit(rs.getInt(6));
                        user.setBirthday(rs.getString(5));
                        user.setJob(rs.getString(7));
                        user.setIsAdmin(rs.getBoolean(10));
                        user.setInterests(rs.getString(9));
                user.setEmail(rs.getString(4));
                    
                    
        } 
            
         catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
return user ;
}


    @Override
    public ArrayList<User> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean save(User user) {
        boolean stmtSuccess = true;
        try (Statement stmt = conn.createStatement()) {
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

    public User search(String userName, String password) {
        String sql;
        User user = null;
        sql = "SELECT * FROM users WHERE username = "
                + "'" + userName + "'"
                + "AND password = "
                + "'" + password + "'";
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sql);

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUserName(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setBirthday(rs.getString("birthday"));
                user.setCreditLimit(rs.getInt("credit_limit"));
                user.setJob(rs.getString("job"));
                user.setInterests(rs.getString("interests"));
                user.setIsAdmin(rs.getBoolean("is_admin"));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return user;

    }
public boolean update_credit(int id ,int credit) {
    boolean stmtSuccess =true ;   
    try {
            PreparedStatement pst  ;
            
            pst  =conn.prepareStatement("update users set credit_limit = ? where id =? ") ;
            pst.setInt(1, credit);
            pst.setInt(2, id);
            
            pst.executeUpdate();
        } catch (SQLException ex) {
           stmtSuccess = false ;
           System.out.println(ex.getMessage());
           
        }
return stmtSuccess ;
}
    @Override
    public boolean update(User t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
