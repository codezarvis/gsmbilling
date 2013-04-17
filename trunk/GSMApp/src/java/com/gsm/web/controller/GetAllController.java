/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.MeterOperator;
import com.gsm.service.OperatorService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
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
public class GetAllController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        OperatorService operatorService = DomainServiceUtils.getOperatorService();
        List<MeterOperator> list = operatorService.getAll();

        if (list.size() == 0) {

            return;

        }

        request.setAttribute("list", list);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/createUser.jsp");
        dispatcher.forward(request, response);

    }
}
