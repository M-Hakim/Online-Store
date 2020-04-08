package com.onlinestore.servlets;

import com.onlinestore.models.Product;
import com.onlinestore.models.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import java.util.List;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author sandy
 */
public class IndexProductServlet extends HttpServlet {

    List<Product> limitedProducts = new ArrayList<Product>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductModel productModel = new ProductModel();
        limitedProducts = productModel.getLastProduct();

        request.setAttribute("limitedProducts", limitedProducts);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
