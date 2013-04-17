/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import com.gsm.domain.sub.Client;
import com.gsm.domain.sub.MeterOperator;
import com.gsm.service.AppUserService;
import com.gsm.service.ClientService;
import com.gsm.service.OperatorService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        String userName = request.getParameter("userName");
        String pwd = request.getParameter("password");
        String alert = request.getParameter("alert");

        try {

            AppUserService appUserService = DomainServiceUtils.getAppUserService();
            AppUser appUser = appUserService.authenticate(userName, pwd);
            
            OperatorService operatorService = DomainServiceUtils.getOperatorService();
            MeterOperator operator = operatorService.findById(pwd);
            
            ClientService clientService = DomainServiceUtils.getClientService();
            Client client = clientService.findByServiceNumber(pwd);
            
            if (appUser == null) {

                out.println("Invalid UserName/Password !");
                return;
            }


            if (alert != null) {
                Cookie cookie = new Cookie("cName", appUser.getGuid());
                cookie.setMaxAge(60 * 60 * 24 * 1);
                response.addCookie(cookie);

            }

            HttpSession session = request.getSession();

            if (appUser.getUserRole().equalsIgnoreCase("admin")) {
                session.setAttribute("user", appUser);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (appUser.getUserRole().equalsIgnoreCase("client")) {
                session.setAttribute("user", appUser);
                session.setAttribute("client", client);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/user.jsp");
                dispatcher.forward(request, response);
                return;
            }

            if (appUser.getUserRole().equalsIgnoreCase("operator")) {
                session.setAttribute("user", appUser);
                session.setAttribute("operator", operator);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/operator.jsp");
                dispatcher.forward(request, response);
                return;
            }


        } catch (Exception exception) {
            exception.printStackTrace();


        }

    }
}
