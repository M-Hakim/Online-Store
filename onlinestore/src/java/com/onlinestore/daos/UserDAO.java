/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.daos;

import com.onlinestore.database.Database;
import com.onlinestore.models.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

    @Override
    public boolean update(User t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
