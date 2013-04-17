/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.Payments;
import com.gsm.service.PaymentService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Calendar;

/**
 *
 * @author user
 */
public class BillReportController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("year"));

        PaymentService paymentService = DomainServiceUtils.getPaymentService();
        List<Payments> payList = paymentService.getAll();
        System.out.println("===========" + payList);
        if (payList == null) {

            return;
        }

        double total = 0;

        out.println("<br/>");
        out.println("<table align='center' border='1'>");

        out.println("<tr>");
        out.println("<td>Client Name</td>");
        out.println("<td>Meter Number</td>");
        out.println("<td>Reading Date</td>");
        out.println("<td>Bill Amount</td>");
        out.println("</tr>");

        for (Payments payments : payList) {

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(payments.getBillDate());

            int mon = calendar.get(Calendar.MONTH);

            int yr = calendar.get(Calendar.YEAR);

            if (mon == month && yr == year) {
                total = total + payments.getBillAmount();
                System.out.println(":::::::::::::::::::::" + total);
                out.println("<tr>");
                out.println("<td>" + payments.getClientName() + "</td>");
                out.println("<td>" + payments.getMeterId() + "</td>");
                out.println("<td>" + payments.getBillDate() + "</td>");
                out.println("<td>" + payments.getBillAmount() + "</td>");
                out.println("</tr>");

            }

        }
        out.println("<tr>");
        out.println("<td>Total Amount</td>");
        out.println("<td></td><td></td>");
        out.println("<td>" + total + "</td>");
        out.println("</tr>");
        out.println("</table>");

    }
}
