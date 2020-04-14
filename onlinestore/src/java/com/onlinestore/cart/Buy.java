/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.cart;

import com.onlinestore.daos.ProductDAO;
import com.onlinestore.models.Product;
import com.onlinestore.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mostafa
 */
public class Buy extends HttpServlet {

    Map<Integer, Integer> products;
    ProductDAO productDAO;
    Product product;
    // Integer [] productId = new Integer [9] ; 
    //  Integer [] quantity = new Integer [9] ;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        
        if(req.getSession(false).getAttribute("users")==null){
         resp.sendRedirect("./customer/sign_in.html");
        }else{
        HttpSession session = req.getSession(false);
        products = (HashMap<Integer, Integer>) session.getAttribute("products");
        User user = (User) session.getAttribute("users");

        if ( products == null || products.size() == 0) {
             resp.getOutputStream().write("fail".getBytes());
            
        } else {
            productDAO = new ProductDAO();
            product = new Product();
            String[] products_id = req.getParameter("product_id").split(":");
            String[] products_qty = req.getParameter("quantity_input").split(":");
            System.out.println(products_id[0]);
            System.out.println(products_qty[0]);
            Integer[] prodId = null;
            Integer[] prod_qty = null;
            System.out.println(products_id.length);
            for (int i = 0; i < products_id.length; ++i) {
                System.out.println("here before it");
                //   prodId [i] = Integer.parseInt(products_id[i]);
                //   prod_qty [i] = Integer.parseInt(products_qty[i]);

                try{
                Integer.parseInt(products_qty[i]) ;
                
                }
                    
                    catch (NumberFormatException e) {
                        
                  products_qty[i]  = "0";
                   System.out.println("wrong type enterd");
}
                if (Integer.parseInt(products_qty[i]) == 0) {
                    products.remove(Integer.parseInt(products_id[i]));
                } else if (productDAO.get(Integer.parseInt(products_id[i])).getQuantity() >= Integer.parseInt(products_qty[i])) {
                    products.put(Integer.parseInt(products_id[i]), Integer.parseInt(products_qty[i]));
                }}  
                
               

            }
            session.setAttribute("products", products);

            if (products.size() > 0) {
                resp.getOutputStream().write("success".getBytes());
             //   RequestDispatcher requestDispatcher = req.getRequestDispatcher("CartTest.jsp");
             //   requestDispatcher.forward(req, resp);
            } else {
                resp.getOutputStream().write("fail".getBytes());
             //   RequestDispatcher requestDispatcher = req.getRequestDispatcher("ProductsTest.jsp");
              //  requestDispatcher.forward(req, resp);
            }
        }
    }
}
