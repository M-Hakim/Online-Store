package com.onlinestore.servlets;



import com.onlinestore.models.Product;
import com.onlinestore.models.ProductModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sandy
 */

@WebServlet(name = "Product", urlPatterns = {"/Product"})
public class ProductServlet extends HttpServlet {

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
           
        int productID = Integer.parseInt(request.getParameter("id"));
        ProductModel productModel = new ProductModel();
        Product product = productModel.getProduct(productID);
        
       
        if(product==null){
            response.sendRedirect("404.jsp"); ////////////still can't connect the front en
            
        }
        else{
            
            request.setAttribute("product", product); 
        }
      
    }
   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
        
        
    }

 


