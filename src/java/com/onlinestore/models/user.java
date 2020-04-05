/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.models;;

/**
 *
 * @author Acer
 */
public class user {
    private int id ;
    private String username;
    private String password;
    private String  email;
    private String birthday;
    private int credit_limit;
    private String job;
    private String address;
    private String interests;
    private boolean isadmin;

    public boolean isIsadmin() {
        return isadmin;
    }

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public void setCredit_limit(int credit_limit) {
        this.credit_limit = credit_limit;
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

    public String getUsername() {
        return username;
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

    public int getCredit_limit() {
        return credit_limit;
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
    
    
    
    
            
}
