package com.onlinestore.utilities;

import com.onlinestore.models.Product;
import com.onlinestore.models.user;
import java.sql.*;
import java.util.ArrayList;

public class DataBase {

    private static final String url = "jdbc:postgresql://localhost:5433/postgres";
    private static final String user = "postgres";
    private static final String password = "postgres";
    private static Connection conn = null;

    public static void connect() {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, password);
            System.err.println("Connection is made successfully");
        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void disconnect() {
        try {
            conn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public ArrayList<Product> selectAllProducts() throws SQLException {
        ArrayList<Product> allProducts = new ArrayList<>();

        Statement stmt = conn.createStatement();
        String queryString = new String("select * from products");
        ResultSet rs = stmt.executeQuery(queryString);
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("id"));
            product.setProductName(rs.getString("product_name"));
            product.setCategoryId(rs.getInt("category_id"));
            product.setQuantity(rs.getInt("quantity"));
            product.setPrice(rs.getFloat("price"));
            product.setDescription(rs.getString("description"));
            product.setImgurl(rs.getString("imgurl"));
            allProducts.add(product);

        }
        return allProducts;

    }

}
//
//    public int insert(User newUser) {
//        int newId = 0;
//        try {
//            Class.forName("org.postgresql.Driver");
//            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company", "postgres", "postgres");
//            String insertString = new String("insert into employee_info (first_name, middle_name, last_name, email, phone) "
//                    + "values(?, ?, ?, ?, ?)");
//            PreparedStatement stmt = con.prepareStatement(insertString);
//            stmt.setString(1, newUser.firstName);
//            stmt.setString(2, newUser.middleName);
//            stmt.setString(3, newUser.lastName);
//            stmt.setString(4, newUser.email);
//            stmt.setString(5, newUser.phone);
//            stmt.executeUpdate();
//            // get the id of new user
//            PreparedStatement idStmt = con.prepareStatement("select emp_id from employee_info where phone = ?");
//            idStmt.setString(1, newUser.phone);
//            ResultSet idRs = idStmt.executeQuery();
//            idRs.next();
//            newId = idRs.getInt(1);
//            con.close();
//        } catch (SQLException | ClassNotFoundException ex) {
//            ex.printStackTrace();
//        }
//        return newId;
//    }
//
//    public void delete(String tableName, int id) {
//        try {
//            Class.forName("org.postgresql.Driver");
//            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company", "postgres", "postgres");
//            PreparedStatement pst = con.prepareStatement("DELETE FROM ? WHERE emp_id= ?");
//            pst.setString(1, tableName);
//            pst.setInt(2, id);
//            int rs = pst.executeUpdate();
//            pst.close();
//            con.close();
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//    public void update(String tableName, User user) {
//        try {
//            Class.forName("org.postgresql.Driver");
//            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/company",
//                    "postgres", "postgres");
//
////            PreparedStatement pst= con.prepareStatement("UPDATE employee_info SET middle_name=? WHERE emp_id=?");
//            PreparedStatement pst = con.prepareStatement("UPDATE employee_info SET first_name=?,middle_name=?,"
//                    + "last_name=?,email=?,phone=? WHERE emp_id=?");
//
////              pst.setString(1,fieldEdited);
////              pst.setInt(2,id);
//            pst.setString(1, user.firstName);
//            pst.setString(2, user.middleName);
//            pst.setString(3, user.lastName);
//            pst.setString(4, user.email);
//            pst.setString(5, user.phone);
//            pst.setInt(6, user.id);
//
////            int rs= pst.executeUpdate();
//            pst.executeUpdate();
////            pst.close();
//            con.close();
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(DataBase.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
//
//public static void main(String[] args) throws SQLException {
//        DataBase companyDB = new DataBase();
//        Vector<User> allUsers = companyDB.selectAll("employee_info");
//        User newUser = new User(0, "fnn", "mnn", "lnn", "ee", "phone");
//        int newId = companyDB.insert(newUser);
//        System.out.println(newId);
//
//    }
//}
