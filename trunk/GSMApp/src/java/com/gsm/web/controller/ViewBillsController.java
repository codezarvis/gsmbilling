/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.Client;
import com.gsm.domain.sub.Units;
import com.gsm.service.UnitService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class ViewBillsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        Client client = (Client)request.getSession().getAttribute("client");
        
        UnitService unitService = DomainServiceUtils.getUnitService();
        
        List<Units> list = unitService.findByMeterId(client.getMeterNumber());
        
        if(list.isEmpty()){
            
            request.setAttribute("listErr", "Your Bill Is To Be Generated Yet..!!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/user.jsp");
            dispatcher.forward(request, response);
            return;
        }
        
       HttpSession session = request.getSession();
       
       session.setAttribute("BillsList", list);
        response.sendRedirect("clientBill.jsp");
    }
}
