/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.utilities;

import java.util.ArrayList;

/**
 *
 * @author THE PR!NCE
 */
public interface DAO<T> {
     
    T get(int id);
     
    ArrayList<T> getAll();
     
    void save(T t);
     
    void update(T t);
     
    void delete(T t);
}
