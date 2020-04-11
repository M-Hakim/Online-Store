/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.models;

/**
 *
 * @author Acer
 */
public class User {
    private int id ;
    private String userName;
    private String password;
    private String email;
    private String birthday;
    private int creditLimit;
    private String job;
    private String address;
    private String interests;
    private boolean isadmin;

    public void setId(int id) {
        this.id = id;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public void setCreditLimit(int creditLimit) {
        this.creditLimit = creditLimit;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setInterests(String interests) {
        this.interests = interests;
    }

  

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getBirthday() {
        return birthday;
    }

    public int getCreditLimit() {
        return creditLimit;
    }

    public String getJob() {
        return job;
    }

    public String getAddress() {
        return address;
    }

    public String getInterests() {
        return interests;
    }

    public boolean isIsadmin() {
        return isadmin;
    }

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

   
    
}