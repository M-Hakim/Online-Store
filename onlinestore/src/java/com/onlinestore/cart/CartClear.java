/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.cart;

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
 * @author Mostafa
 */
public class CartClear extends HttpServlet {

    Map<Integer, Integer> products;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session.getAttribute("products") != null) {

            products = (HashMap<Integer, Integer>) session.getAttribute("products");
            for (int i = 0; i < products.size(); i++) {
                products.clear();
            }

            session.setAttribute("products", null);
        }
        // RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/ProductsTest.jsp");
        // requestDispatcher.forward(req, resp);
        resp.sendRedirect("./customer/ProductsTest.jsp");
    }

}
