/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.daos;

import com.onlinestore.database.Database;
import com.onlinestore.models.Product;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author THE PR!NCE
 */
public class ProductDAO implements DAO<Product> {

    Connection conn = Database.getConnectionInstance();

    @Override
    public ArrayList<Product> getAll() {
        ArrayList<Product> allProducts = new ArrayList<>();
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery("select * from products");
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
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return allProducts;
    }

    @Override
    public void save(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Product get(int i) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
