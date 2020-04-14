/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.models;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

/**
 *
 * @author Mostafa
 */
public class History implements Comparable<History>{

    User user = new User();
    Product product = new Product();
    int Card_Id;
    int User_Id;
    int product_Id;
    int product_Qty;
    int Product_Price;
    Timestamp buy_history;
    Map<Integer, Integer> map;

    public void setUser(User _user) {
        this.user = _user;
    }

    public void setProduct(Product _product) {
        this.product = _product;
    }

    public User getUser() {
        return user;
    }

    public Product getProduct() {
        return product;
    }

    public Map<Integer, Integer> getMap() {
        return map;
    }

    public void setMap(Map<Integer, Integer> map) {
        this.map = map;
    }

    public void setCard_Id(int Card_Id) {
        this.Card_Id = Card_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public void setProduct_Id(int product_Id) {
        this.product_Id = product_Id;
    }

    public void setProduct_Qty(int product_Qty) {
        this.product_Qty = product_Qty;
    }

    public void setProduct_Price(int Product_Price) {
        this.Product_Price = Product_Price;
    }

    public void setBuy_history(Timestamp buy_history) {
        this.buy_history = buy_history;
    }

    public Integer getCard_Id() {
        return Card_Id;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public int getProduct_Id() {
        return product_Id;
    }

    public int getProduct_Qty() {
        return product_Qty;
    }

    public int getProduct_Price() {
        return Product_Price;
    }

    public Date getBuy_history() {
        return buy_history;
    }
    
    @Override
    public int compareTo(History o) {
        return this.getCard_Id().compareTo(o.getCard_Id());
    }

}
