/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.models;

/**
 *
 * @author THE PR!NCE
 */
public class Product {

    private int id;
    private String productName;
    private int quantity;
    private int categoryId;
    private String description;
    private float price;
    private String imgurl;

    public Product() {
    }

    public Product(int id, String productName, int quantity, int categoryId, String description, float price, String imgurl) {
        this.id = id;
        this.productName = productName;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.description = description;
        this.price = price;
        this.imgurl = imgurl;
    }

    public Product(String productName, int quantity, int categoryId, String description, float price, String imgurl) {
        this.productName = productName;
        this.quantity = quantity;
        this.categoryId = categoryId;
        this.description = description;
        this.price = price;
        this.imgurl = imgurl;
    }

    public int getId() {
        return id;
    }

    public String getProductName() {
        return productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getDescription() {
        return description;
    }

    public float getPrice() {
        return price;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

}
