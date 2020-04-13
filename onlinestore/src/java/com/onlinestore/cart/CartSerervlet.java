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

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        productDAO = new ProductDAO();
        product = new Product();
        int productId = Integer.parseInt(req.getParameter("productid"));
        int productQuantity = Integer.parseInt(req.getParameter("quantity_input"));
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("users");
        if (user == null) {
            resp.sendRedirect("./customer/ProductsTest.jsp");
//     RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/ProductsTest.jsp");
            //  requestDispatcher.forward(req, resp);
        } else {
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

                for (Map.Entry pair : products.entrySet()) {
                    int pid = (int) pair.getKey();
                    int pqty = (int) pair.getValue();
                    System.out.println(pid);
                    System.out.println(pqty);
                }
                System.out.println(productId);
                System.out.println(productQuantity);

                resp.getOutputStream().write("success".getBytes());
            } else {
                resp.getOutputStream().write("fail".getBytes());

            }
        }
    }

}
