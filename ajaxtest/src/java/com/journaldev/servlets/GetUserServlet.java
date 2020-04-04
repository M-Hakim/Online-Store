/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.journaldev.servlets;

/**
 *
 * @author THE PR!NCE
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetUserServlet")
public class GetUserServlet extends HttpServlet {

        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String productName = request.getParameter("productName").trim();
                String qty = request.getParameter("qty").trim();
		if(productName == null || "".equals(productName)){
			productName = "none";
                        qty = "none";
		}
		
		String productInfo = "You selected " + productName + " with quantity = " + qty;
		
		response.setContentType("text/plain");
		response.getWriter().write(productInfo);
	}

}