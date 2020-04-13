/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.onlinestore.servlets;

import com.onlinestore.daos.UserDAO;
import com.onlinestore.models.User;
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
public class UserUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = new User();
        user.setId(Integer.parseInt(req.getParameter("user_id")));
        user.setUserName(req.getParameter("user_name"));
        user.setPassword(req.getParameter("pass"));
        user.setIsAdmin((req.getParameter("is_admin")).equals("1"));
        user.setCreditLimit(Integer.parseInt(req.getParameter("credit")));
        user.setEmail(req.getParameter("email"));
        user.setBirthday(req.getParameter("birthday"));
        user.setJob(req.getParameter("job"));
        user.setAddress(req.getParameter("address"));
        user.setInterests(req.getParameter("interests"));
        
        UserDAO userDAO = new UserDAO();
        int newId = 0;
        boolean updateSuccess = false;
        
        if(user.getId() == 0)
            newId = userDAO.saveAndReturnId(user);
        else
            updateSuccess = userDAO.update(user);
        
        resp.setContentType("text/plain");
        if(newId != 0)
            resp.getWriter().write(Integer.toString(newId));
        else if(updateSuccess)
            resp.getWriter().write(Integer.toString(user.getId()));
        else
            resp.getWriter().write("failed");
        
    }
    

}
