/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import com.gsm.domain.sub.Client;
import com.gsm.domain.sub.Payments;
import com.gsm.domain.sub.Units;
import com.gsm.service.AppUserService;
import com.gsm.service.PaymentService;
import com.gsm.service.UnitService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class PaymentGatewayController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Client client = (Client) request.getSession().getAttribute("client");
        Units units = (Units) request.getSession().getAttribute("units");

        String bank = request.getParameter("bank");
        String cardNum = request.getParameter("cardNum");
        double amount = Double.parseDouble(request.getParameter("amount"));
        double payment = Double.parseDouble(request.getParameter("payment"));
        String pwd = request.getParameter("cnfrmPwd");

        AppUserService appUserService = DomainServiceUtils.getAppUserService();
        AppUser appUser = appUserService.authenticate(client.getFirstName(),pwd);
       
        if (appUser == null) {

            out.println("Invalid Password Entered..!!");
            return;
        }

        Payments payments = new Payments();

        payments.setMeterId(client.getMeterNumber());
        
        payments.setClientName(client.getFirstName());
        payments.setBankName(bank);
        payments.setCardNumber(cardNum);
        payments.setBillDate(units.getReadingDate());
        payments.setBillAmount(amount);
        payments.setAmountPaid(payment);
        
        double bal = amount - payment;
        payments.setBalance(bal);
        payments.setCreatedOn(new java.util.Date());
        payments.setCreatedBy(1);
        payments.setModifiedOn(new java.util.Date());
        payments.setModifiedBy(1);
        payments.setActive(1);
        
        units.setMeterNumber(client.getMeterNumber());
        units.setStatus("Paid");
        
        PaymentService paymentService = DomainServiceUtils.getPaymentService();
        paymentService.create(payments);
        
        UnitService unitService = DomainServiceUtils.getUnitService();
        unitService.create(units);
        
        
        out.println("Bill Paid Successfully..");

    }
}
