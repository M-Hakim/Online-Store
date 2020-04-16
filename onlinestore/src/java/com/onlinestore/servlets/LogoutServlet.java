/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author omega
 */
@WebServlet(value = "/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        if (req.getSession(false) !=null)
        {
         HttpSession session = req.getSession(false);
        if (session.getAttribute("users")!=null)
        {
            session.setAttribute("users", null);
        }
        if (session.getAttribute("products")!=null)
        {
            session.setAttribute("products", null);
        }
        
        Cookie [] cookie ;
        cookie= req.getCookies();
            for (Cookie cookie1 : cookie) {
                cookie1.setMaxAge(0);
                resp.addCookie(cookie1);
            }
        session.invalidate();
        
        }
       
        resp.sendRedirect("./customer/Home.jsp");
    
    }


}
