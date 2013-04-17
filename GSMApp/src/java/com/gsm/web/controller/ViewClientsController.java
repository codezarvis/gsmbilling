/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.Client;
import com.gsm.domain.sub.MeterOperator;
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
public class ViewClientsController extends HttpServlet {

   
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        MeterOperator operator = (MeterOperator)request.getSession().getAttribute("operator");
    
        ClientService clientService = DomainServiceUtils.getClientService();
        List<Client> list = clientService.findByAreaAndWard(operator.getArea(), operator.getWardNo());
        System.out.println(list);
        if (list.size() == 0) {

            request.setAttribute("listErr", "No Clients Available..");
            RequestDispatcher dispatcher1 = request.getRequestDispatcher("/viewClients.jsp");
            dispatcher1.forward(request, response);
            return;

        }

        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/viewClients.jsp");
        dispatcher.forward(request, response);

    }
}
