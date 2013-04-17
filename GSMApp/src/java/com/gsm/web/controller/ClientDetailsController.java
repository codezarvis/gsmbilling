/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.Client;
import com.gsm.domain.sub.Units;
import com.gsm.service.ClientService;
import com.gsm.service.UnitService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class ClientDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new java.util.Date());

        ClientService clientService = DomainServiceUtils.getClientService();

        Client client = clientService.findByMeterNumber(id);

         if (client == null) {

            out.println("Enter correct Meter Id");
            return;

        }

        UnitService unitService = DomainServiceUtils.getUnitService();
        List<Units> list = unitService.findByMeterId(id);

        for (Units units : list) {

            Calendar c = Calendar.getInstance();
            c.setTime(units.getReadingDate());

            if (calendar.get(Calendar.MONTH) >= c.get(Calendar.MONTH)) {
                System.out.println("1===============1");
                out.println("1");
                return;
            }
        }
        
        out.println("<html>");
        out.println("<body>");
        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<td>Service Number</td>");
        out.println("<td>" + client.getServiceNumber() + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Name</td>");
        out.println("<td>" + client.getFirstName() + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Address</td>");
        out.println("<td>" + client.getAddress() + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<tr>");
        out.println("<td>Area</td>");
        out.println("<td>" + client.getArea() + "</td>");
        out.println("</tr>");
        out.println("<td>Ward Num</td>");
        out.println("<td>" + client.getWardNum() + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Mobile</td>");
        out.println("<td>" + client.getMobile() + "</td>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>Previous Reading</td>");

        if (list.isEmpty()) {
            out.println("<td><input type='text' value='0' id='nullReading'/></td>");
        } else {

            Units u = list.get(list.size() - 1);

            out.println("<td><input type='text' value='" + u.getCurrentReading() + "' id='reading'/></td>");
        }

        out.println("</tr>");
        out.println("</table>");
        out.println("</body>");
        out.println("<html>");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        UnitService unitService = DomainServiceUtils.getUnitService();
        List<Units> list = unitService.findByMeterId(request.getParameter("meterId"));

        Units units = new Units();

        units.setMeterNumber(request.getParameter("meterId"));

        units.setReadingDate(new java.util.Date());

        int reading = 0;

        if (list.isEmpty()) {
            units.setPreviousReading(reading);
        } else {
            for (Units u : list) {
                reading = u.getCurrentReading();
                units.setPreviousReading(u.getCurrentReading());
            }

        }
        int crntreading = Integer.parseInt(request.getParameter("crntReading"));
        units.setCurrentReading(crntreading);

        int total = crntreading - reading;
        units.setTotalUnits(total);

        if (total <= 75) {

            units.setTotalPrice(total * 1.5);
        }
        if (total > 75 && total <= 150) {

            units.setTotalPrice(total * 2);
        }
        if (total > 150 && total <= 300) {

            units.setTotalPrice(total * 3);
        }
        if (total > 300) {

            units.setTotalPrice(total * 4.5);
        }
        units.setStatus("pending");
        units.setCreatedBy(1);
        units.setCreatedOn(new java.util.Date());
        units.setModifiedBy(1);
        units.setModifiedOn(new java.util.Date());
        units.setActive(1);

        unitService.create(units);

    }
}
