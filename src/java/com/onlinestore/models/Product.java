package com.onlinestore.models;

import com.onlinestore.database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sandy
 */
public class Product {

    private int id;
    private String name;
    private int quantity;
    private int category_type;
    private String description;
    private int price;
    private String icon_url;

    ResultSet rs;
    PreparedStatement pst = null;
    Database db = new Database();
    private int noOfRecords;
    Connection con;

    public Product(String name, int price, String icon_url, String description, int quantity, int id, int category_type) {
        this.name = name;
        this.price = price;
        this.icon_url = icon_url;
        this.description = description;
        this.quantity = quantity;
        this.id = id;
        this.category_type = category_type;
    }

    public Product() {
    }

    public Product(int id) {
        this.id = id;
    }

    Product(String string, int aInt, String string0, int aInt0, int aInt1, int aInt2) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    Product(String string, double aDouble, String string0, String string1, String string2, String string3, int aInt, int aInt0, int aInt1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getname() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setprice(int price) {
        this.price = price;
    }

    public String getIcon_url() {
        return icon_url;
    }

    public void setIcon_url(String icon_url) {
        this.icon_url = icon_url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategory_type() {
        return category_type;
    }

    public void setCategory_type(int category_type) {
        this.category_type = category_type;
    }

}
