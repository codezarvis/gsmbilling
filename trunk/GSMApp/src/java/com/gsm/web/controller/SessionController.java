/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class SessionController extends HttpServlet {

   
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        AppUser appUser = (AppUser)request.getSession().getAttribute("user");
        
         if (appUser.getUserRole().equalsIgnoreCase("admin")) {
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (appUser.getUserRole().equalsIgnoreCase("client")) {
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/user.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (appUser.getUserRole().equalsIgnoreCase("operator")) {
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/operator.jsp");
                dispatcher.forward(request, response);
                return;
            }
    }
}
