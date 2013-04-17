/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.Units;
import com.gsm.service.UnitService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.mail.internet.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.context.request.RequestAttributes;

/**
 *
 * @author user
 */
public class PayBillController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String date1 = request.getParameter("dt");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date dt = null;
        try {
            dt = dateFormat.parse(date1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        UnitService unitService = DomainServiceUtils.getUnitService();
        Units units = unitService.findByMeterIdAndDate(id, dt);

        if (units == null) {

            return;

        }

        HttpSession httpSession = request.getSession();
        httpSession.setAttribute("units", units);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/billPayments.jsp");
        dispatcher.forward(request, response);

    }
}
