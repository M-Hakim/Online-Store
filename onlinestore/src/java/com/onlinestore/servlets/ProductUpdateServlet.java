/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.servlets;

import com.onlinestore.daos.ProductDAO;
import com.onlinestore.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author THE PR!NCE
 */
public class ProductUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Product product = new Product();
        product.setId(Integer.parseInt(req.getParameter("product_id")));
        product.setProductName(req.getParameter("product_name"));
        product.setQuantity(Integer.parseInt(req.getParameter("qty")));
        product.setCategoryId(Integer.parseInt(req.getParameter("catId")));
        product.setDescription(req.getParameter("desc"));
        product.setPrice(Float.parseFloat(req.getParameter("price")));
        product.setImgurl(req.getParameter("img"));
        
        
        System.out.println("+++++++++++++" + req.getParameter("price"));
        System.out.println("+++++++++++++" + product.getPrice());
        
        ProductDAO productDAO = new ProductDAO();
        boolean success;
        
        if(product.getId() == 0)
            success = productDAO.save(product);
        else
            success = productDAO.update(product);
        
        resp.setContentType("text/plain");
        if(success)
            resp.getWriter().write("success");
        else
            resp.getWriter().write("failed");
        
    }
    

}

