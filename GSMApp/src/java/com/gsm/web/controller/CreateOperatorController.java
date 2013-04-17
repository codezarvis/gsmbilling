/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import com.gsm.domain.sub.MeterOperator;
import com.gsm.service.AppUserService;
import com.gsm.service.OperatorService;
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
public class CreateOperatorController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        MeterOperator meterOperator = new MeterOperator();

        meterOperator.setOperatorId(request.getParameter("operatorId"));
        meterOperator.setOperatorName(request.getParameter("operatorName"));
        meterOperator.setArea(request.getParameter("area"));
        meterOperator.setWardNo(request.getParameter("wardNum"));
        meterOperator.setCity(request.getParameter("city"));
        meterOperator.setCreatedBy(1);
        meterOperator.setCreatedOn(new java.util.Date());
        meterOperator.setModifiedBy(1);
        meterOperator.setModifiedOn(new java.util.Date());
        meterOperator.setActive(1);
        
        OperatorService operatorService = DomainServiceUtils.getOperatorService();
        operatorService.create(meterOperator);
        
         AppUser appUser = new AppUser();

        appUser.setUserName(request.getParameter("operatorName"));
        appUser.setPassword(request.getParameter("operatorId"));
        appUser.setNumber(null);
        appUser.setEmail(null);
        appUser.setUserRole("operator");
        appUser.setCreatedBy(1);
        appUser.setCreatedOn(new java.util.Date());
        appUser.setModifiedBy(1);
        appUser.setModifiedOn(new java.util.Date());
        appUser.setActive(1);

        AppUserService appUserService = DomainServiceUtils.getAppUserService();
        appUserService.create(appUser);
        
        out.println("Operator Created Successfully..!!!");
    }
}
