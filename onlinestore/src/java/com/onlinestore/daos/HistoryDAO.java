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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mostafa
 */
public class HistoryDAO implements DAO {

    Connection conn = Database.getConnectionInstance();

    @Override
    public Object get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean save(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void Save_History(int id, Map<Integer, Integer> products) {
        try {
            ProductDAO productDAO = new ProductDAO();
            UserDAO userDao = new UserDAO();
            User user = new User();
            user = userDao.get(id);
            Product product;

            Iterator it = products.entrySet().iterator();
            int cardid;
            Map.Entry pair = (Map.Entry) it.next();
            int pid = (int) pair.getKey();
            int pqty = (int) pair.getValue();
            product = productDAO.get(pid);
            PreparedStatement stmt;
            conn.setAutoCommit(false);
            String sql = "insert into  history (userid,productid,productqty,productprice ,buyhistory) values(?,?,?,?,'now')";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setInt(2, pid);
            stmt.setInt(3, pqty);
            stmt.setFloat(4, product.getPrice());

            stmt.executeUpdate();
            if (it.hasNext()) {
                sql = "select max (id)from history";
                stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                rs.next();
                cardid = rs.getInt(1);
                pair = (Map.Entry) it.next();
                pid = (int) pair.getKey();
                pqty = (int) pair.getValue();
                product = productDAO.get(pid);
                sql = "insert into  history  (id,userid,productid,productqty,productprice buyhistory) values(?,?,?,?,?,'now')";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, cardid);
                stmt.setInt(2, id);
                stmt.setInt(3, pid);
                stmt.setInt(4, pqty);
                stmt.setFloat(5, product.getPrice());

                stmt.executeUpdate();

                while (it.hasNext()) {
                    pair = (Map.Entry) it.next();
                    pid = (int) pair.getKey();
                    pqty = (int) pair.getValue();
                    product = productDAO.get(pid);
                    sql = "insert into  history (id ,userid,productid,productqty,productprice  ,buyhistory) values(?,?,?,?,?,'now')";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, cardid);
                    stmt.setInt(2, id);
                    stmt.setInt(3, pid);
                    stmt.setInt(4, pqty);
                    stmt.setFloat(5, product.getPrice());

                    stmt.executeUpdate();

                    System.out.println(pid);
                    System.out.println(pqty);
                }
                conn.commit();
            }

        } catch (SQLException ex) {
            if (conn != null) {
                try {
                    System.err.print("Transaction is being rolled back");
                    conn.rollback();
                } catch (SQLException excep) {
                    ex.printStackTrace();
                }
            }
        } finally {

            try {
                conn.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public boolean update(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean delete(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
