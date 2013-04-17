/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class SignOutController extends HttpServlet {

      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        AppUser appUser = (AppUser) request.getSession().getAttribute("user");

        if (appUser != null) {

            request.getSession().invalidate();
            response.sendRedirect("home.jsp");
            return;
        }

        response.sendRedirect("home.jsp");

    }
    
    
}
