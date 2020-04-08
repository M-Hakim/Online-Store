package com.onlinestore.models;
import com.onlinestore.database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author sandy
 */
public class ProductModel {

    ResultSet rs;
    PreparedStatement pst = null;
    Database db = new Database();
    Connection con;

    ////////////////////////searching by name //////////////////////////////////
    public ArrayList<Product> getProductByName(String name) {
        ArrayList<Product> ListProductByName = new ArrayList();
        try {
            con = db.openConnection();
            pst = con.prepareStatement("SELECT * FROM product WHERE name LIKE ? ESCAPE '!'");
//           
            pst.setString(1, name + "%");
            Product obj;
            rs = pst.executeQuery();
            while (rs.next()) {
                obj = new Product(rs.getString("name"), rs.getInt("price"), rs.getString("description"), rs.getInt("quantity"), rs.getInt("id"), rs.getInt("category_type"));
                ListProductByName.add(obj);

            }

        } catch (SQLException ex) {
            db.closeConnection();
            ex.printStackTrace();
        }
        System.out.println(ListProductByName.size());
        return ListProductByName;
    }
//////////////////////////searching by category type////////////////////////////////

    public ArrayList<Product> getAllProductByCategoryId(int category_type) {
        ArrayList<Product> list = new ArrayList();
        try {
            con = db.openConnection();
            pst = con.prepareStatement("select * from product where category_id=? ");
            pst.setInt(1, category_type);
            Product p;
            rs = pst.executeQuery();
            while (rs.next()) {
                p = new Product(rs.getString("name"), rs.getInt("price"),
                        rs.getString("descriptin"), rs.getInt("quantity"), rs.getInt("id"),
                        rs.getInt("category_type"));
                rs.getString("icon_url");
                list.add(p);

            }

        } catch (SQLException ex) {
            db.closeConnection();
            ex.printStackTrace();
        }
        System.out.println(list.size());
        return list;
    }

    ////////////////////////getting the last product///////////////////////////
    public ArrayList<Product> getLastProduct() {
        ArrayList<Product> selectLastProduct = new ArrayList();
        try {
            con = db.openConnection();
            pst = con.prepareStatement("select * from product ORDER BY id DESC LIMIT 6 ");
            Product obj;
            rs = pst.executeQuery();
            while (rs.next()) {
                obj = new Product(rs.getString("name"), rs.getDouble("price"), rs.getString("model"), rs.getString("date"), rs.getString("photo"), rs.getString("descriptin"), rs.getInt("quantity"), rs.getInt("id"), rs.getInt("category_id"));
                selectLastProduct.add(obj);

            }

        } catch (SQLException ex) {
            db.closeConnection(); 
            ex.printStackTrace();
        }
        System.out.println(selectLastProduct.size());
        return selectLastProduct;
    }

    ////////////////////////returning the value of selection///////////////////
    public Product getProduct(int id) {
        Product productObject = new Product();

        try {
            con = db.openConnection();

            pst = con.prepareStatement("select * from product  where id=?");

            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                productObject.setName(rs.getString("name"));
                productObject.setId(rs.getInt("id"));
                productObject.setprice(rs.getInt("price"));
                productObject.setQuantity(rs.getInt("quantity"));
                productObject.setDescription(rs.getString("description"));
                productObject.setCategory_type(rs.getInt("category_type"));
                db.closeConnection();
                return productObject;
            }

        } catch (SQLException ex) {
            db.closeConnection();
            ex.printStackTrace();
        }

        return null;

    }

//
}
