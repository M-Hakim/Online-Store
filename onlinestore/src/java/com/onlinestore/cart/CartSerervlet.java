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
import java.util.HashMap;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mostafa
 */
@WebServlet(value = "/CartSerervlet")
public class CartSerervlet extends HttpServlet {

    Map<Integer, Integer> products;
    ProductDAO productDAO;
    Product product;
    int productId ;
    int productQuantity ;
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
         if (req.getSession(false).getAttribute("users")== null) {
            resp.getOutputStream().write("redirect".getBytes());

        } else {
        productDAO = new ProductDAO();
         product = new Product();
      try{   productId = Integer.parseInt(req.getParameter("productid"));
         productQuantity = Integer.parseInt(req.getParameter("quantity_input"));
      }catch(NumberFormatException e){
       productQuantity =0 ;
      }
      HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("users");
       
            if (productDAO.get(productId).getQuantity() >= productQuantity && productQuantity > 0) {

                if (session.getAttribute("products") == null) {
                    products = new HashMap<>();
                    products.put(productId, productQuantity);
                    session.setAttribute("products", products);

                } else {
                    products = (HashMap<Integer, Integer>) session.getAttribute("products");
                    products.put(productId, productQuantity);
                    session.setAttribute("products", products);
                }

               
                resp.getOutputStream().write("success".getBytes());
            } else {
                resp.getOutputStream().write("fail".getBytes());

            }
        }
    }

}
