/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.Client;
import com.gsm.service.ClientService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class ListUsersController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        ClientService clientService = DomainServiceUtils.getClientService();
        List<Client> clientList = clientService.getAll();
        
       if (clientList.size() == 0) {

            request.setAttribute("listErr", "No Users Available..Create Them..!");
            RequestDispatcher dispatcher1 = request.getRequestDispatcher("/admin.jsp");
            dispatcher1.forward(request, response);
            return;

        }

        request.setAttribute("clientList", clientList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewUsers.jsp");
        dispatcher.forward(request, response);
    }

}
