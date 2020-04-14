/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.cart;

import com.onlinestore.daos.ProductDAO;
import com.onlinestore.daos.UserDAO;
import com.onlinestore.models.Product;
import com.onlinestore.models.User;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author omega
 */
public class CreditLimit extends HttpServlet {

    UserDAO userDAO;
    Map<Integer, Integer> products;
    ProductDAO productDAO;
    Product product;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        productDAO = new ProductDAO();
        product = new Product();
        userDAO = new UserDAO();
        int totalcost = 0;
        boolean show = false;
if (req.getSession().getAttribute("users") == null ){
resp.sendRedirect("./customer/sign_in.html");
}else{
        if (req.getSession(false) == null ||  req.getSession(false).getAttribute("products") == null) {
            resp.sendRedirect("./customer/ProductsTest.jsp");
            //      RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/ProductsTest.jsp");
            //  requestDispatcher.forward(req, resp);} 
        } else {
            HttpSession session = req.getSession(false);

            User user = (User) session.getAttribute("users");

            products = (HashMap<Integer, Integer>) session.getAttribute("products");

            for (Map.Entry pair : products.entrySet()) {
                int pid = (int) pair.getKey();
                int pqty = (int) pair.getValue();
                totalcost += productDAO.get(pid).getPrice() * pqty;
                if (pqty > 0) {
                    show = true;
                }
            }
            if (user.getCreditLimit() >= totalcost) {
                if (show == true) {
                    //    RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/CheckoutTest.jsp");
                    // requestDispatcher.forward(req, resp);
                    resp.sendRedirect("./customer/CheckoutTest.jsp");
                } else {
                    //   RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/ProductsTest.jsp");
                    //    requestDispatcher.forward(req, resp);
                    resp.sendRedirect("./customer/ProductsTest.jsp");

                }
            } else {
                //   RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/ExceedProducts.jsp");
                //   requestDispatcher.forward(req, resp);
                resp.sendRedirect("./customer/ExceedProducts.jsp");
            }

        }
    }
}}
