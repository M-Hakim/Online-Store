package com.onlinestore.servlets;

import com.onlinestore.models.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.onlinestore.models.Product;

/**
 *
 * @author sandy
 */
public class SearchServlet extends HttpServlet {

    private String name;

    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }
    ArrayList<Product> product = new ArrayList<>();
    ProductModel model = new ProductModel();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       

        if (request.getParameter("search") != null) {
            String productName = request.getParameter("search");

            System.out.println(productName);

            product = model.getProductByName(name);
response.sendRedirect("Category.html");

        } else {
            System.out.println("else");
        }

        request.setAttribute("allProducts", product);
        String nextJSP = "/Souqdb.jsp";

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request, response);
    }
}


