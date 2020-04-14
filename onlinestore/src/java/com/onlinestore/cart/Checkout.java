/*
         * To change this license header, choose License Headers in Project Properties.
         * To change this template file, choose Tools | Templates
         * and open the template in the editor.
 */
package com.onlinestore.cart;

import com.onlinestore.daos.HistoryDAO;
import com.onlinestore.daos.ProductDAO;
import com.onlinestore.daos.UserDAO;
import com.onlinestore.models.History;
import com.onlinestore.models.Product;
import com.onlinestore.models.User;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mostafa
 */
public class Checkout extends HttpServlet {

    Map<Integer, Integer> products;
    History history;
    Product product;
    User user;
    HistoryDAO historyDAO;
    ProductDAO productDAO;
    UserDAO userDAO;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        historyDAO = new HistoryDAO();
        productDAO = new ProductDAO();
        userDAO = new UserDAO();
        int Totalprice = 0;
        history = new History();

        
        if (req.getSession().getAttribute("users")==null){
        resp.sendRedirect("./customer/sign_in.html");
        }
        else{
        
        HttpSession session = req.getSession(false);
        user = (User) session.getAttribute("users");

        if (session.getAttribute("products") != null) {

            products = (HashMap<Integer, Integer>) session.getAttribute("products");

            for (Map.Entry pair : products.entrySet()) {
                int pid = (int) pair.getKey();
                int pqty = (int) pair.getValue();
                System.out.println("in checkout java pid= " + pid);
                product = productDAO.get(pid);
                System.out.println("in checkout javaafter " + product.getId());
                Totalprice += product.getPrice() * pqty;
                int newqty = product.getQuantity() - pqty;
                productDAO.Update_Product(pid, newqty);
            }
            history.setProduct(product);
            history.setUser(user);
            historyDAO.Save_History(user.getId(), products);
            int credit = user.getCreditLimit() - Totalprice;
            userDAO.update_credit(user.getId(), credit);
            user.setCreditLimit(credit);

            products = (HashMap<Integer, Integer>) session.getAttribute("products");
            for (int i = 0; i < products.size(); i++) {
                products.clear();
            }

            session.setAttribute("users", user);
            session.setAttribute("products", null);
        }

        resp.sendRedirect("./customer/ProductsTest.jsp");
        //       RequestDispatcher requestDispatcher = req.getRequestDispatcher("./customer/ProductsTest.jsp");
        //     requestDispatcher.forward(req, resp);
    }
    }
}
