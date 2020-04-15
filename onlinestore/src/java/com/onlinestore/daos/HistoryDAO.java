/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.daos;

import com.onlinestore.database.Database;
import com.onlinestore.models.History;
import com.onlinestore.models.Product;
import com.onlinestore.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mostafa
 */
public class HistoryDAO implements DAO<History> {

    Connection conn = Database.getConnectionInstance();

  /*   public void Save_History(int id ,Map<Integer,Integer> products) throws SQLException{
        
         
          ProductDAO productDAO = new ProductDAO () ;
          Product product ;
        
        
        Iterator it = products.entrySet().iterator();
        int cardid ;
       Map.Entry pair = (Map.Entry) it.next();
         int pid = (int) pair.getKey();
         int pqty = (int) pair.getValue() ;
         
        PreparedStatement stmt = null ; 
         product = productDAO.get(pid);
    try{   
          conn.setAutoCommit(false);
         
         
         String sql = "insert into  history (userid,productid,productqty,productprice ,buyhistory) values(?,?,?,?,'now')";
         stmt = conn.prepareStatement(sql);
         stmt.setInt(1, id);
         stmt.setInt(2, pid);
         stmt.setInt(3, pqty);
         stmt.setFloat(4, product.getPrice());
         stmt.executeUpdate();
        if (it.hasNext()){
            sql="select max (id)from history";
            stmt = conn.prepareStatement(sql);
            ResultSet rs =stmt.executeQuery() ;
            rs.next();
           cardid = rs.getInt(1);
           pair = (Map.Entry) it.next();
           pid = (int) pair.getKey();
          pqty =(int) pair.getValue();
          product = productDAO.get(pid);
         sql = "insert into  history  (id,userid,productid,productqty,productprice ,buyhistory) values(?,?,?,?,?,'now')";
         stmt = conn.prepareStatement(sql);
         stmt.setInt(1, cardid);
         stmt.setInt(2, id);
         stmt.setInt(3, pid);
         stmt.setInt(4, pqty);
         stmt.setFloat(5, product.getPrice());
         stmt.executeUpdate();
          
         while (it.hasNext())
        { pair = (Map.Entry) it.next();
          pid = (int) pair.getKey();
          pqty =(int) pair.getValue();
          product = productDAO.get(pid);
         sql = "insert into  history (id ,userid,productid,productqty,productprice ,buyhistory) values(?,?,?,?,?,'now')";
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
          
        }
        conn.commit();
     }catch (SQLException e ) {
       
                System.err.print("Transaction is being rolled back");
                conn.rollback();
           }
      
    finally{    
        stmt.close();
        conn.setAutoCommit(true);
            }
    
    }
  */
    @Override
    public History get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<History> getAll() {
        ArrayList<History> allTransactions = new ArrayList<>();
        String sqlCommand = "select u.username, p.product_name, h.productqty, h.productprice, "
                            + "h.buyhistory, h.id from users u,products p, history h "
                            + "where u.id = h.userid and p.id=h.productid";
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(sqlCommand);
            while (rs.next()) {
                History history = new History();
                history.getUser().setUserName(rs.getString(1));
                history.getProduct().setProductName(rs.getString(2));
                history.setProduct_Qty(rs.getInt(3));
                history.setProduct_Price(rs.getInt(4));
                history.setBuy_history(rs.getTimestamp(5));
                history.setCard_Id(rs.getInt(6));
                allTransactions.add(history);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return allTransactions;
    }

    @Override
    public boolean save(History t) {
      
        
        boolean success = true ;
          ProductDAO productDAO = new ProductDAO () ;
          Product product ;
        
        
        Iterator it = t.getMap().entrySet().iterator();
        int cardid ;
       Map.Entry pair = (Map.Entry) it.next();
         int pid = (int) pair.getKey();
         int pqty = (int) pair.getValue() ;
         
        PreparedStatement stmt = null ; 
         product = productDAO.get(pid);
    try{   
         conn.setAutoCommit(false);
         String sql = "insert into  history (userid,productid,productqty,productprice ,buyhistory) values(?,?,?,?,'now')";
         stmt = conn.prepareStatement(sql);
         stmt.setInt(1, t.getUser().getId());
         stmt.setInt(2, pid);
         stmt.setInt(3, pqty);
         stmt.setFloat(4, product.getPrice());
         stmt.executeUpdate();

            sql="select max (id)from history";
            stmt = conn.prepareStatement(sql);
            ResultSet rs =stmt.executeQuery() ;
            rs.next();
           cardid = rs.getInt(1);
         while (it.hasNext())
        { pair = (Map.Entry) it.next();
          pid = (int) pair.getKey();
          pqty =(int) pair.getValue();
          product = productDAO.get(pid);
         sql = "insert into  history (id ,userid,productid,productqty,productprice ,buyhistory) values(?,?,?,?,?,'now')";
         stmt = conn.prepareStatement(sql);
         stmt.setInt(1, cardid);
         stmt.setInt(2, t.getUser().getId());
         stmt.setInt(3, pid);
         stmt.setInt(4, pqty);
         stmt.setFloat(5, product.getPrice());
         stmt.executeUpdate();
          
      
     }
        conn.commit();
     }catch (SQLException e ) {
       success = false;
                System.err.print("Transaction is being rolled back");
              try {
                  conn.rollback();
              } catch (SQLException ex) {
                  Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
              }
           }
      
    finally{    
              try {
                  stmt.close();
                  conn.setAutoCommit(true);
              } catch (SQLException ex) {
                  success = false ;
                  Logger.getLogger(HistoryDAO.class.getName()).log(Level.SEVERE, null, ex);
              }
            }
   
        return success ;
    }

    @Override
    public boolean update(History t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }



}
