/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import com.gsm.service.AppUserService;
import com.gsm.service.utils.DomainServiceUtils;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetQuestionController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("userName");
        String question = request.getParameter("securityQuestion");
        String answer = request.getParameter("answer");
        
        AppUserService appUserService = DomainServiceUtils.getAppUserService();
        AppUser appUser = appUserService.findByUserName(username);
        
        appUser.setUserName(username);
        appUser.setQuestion(question);
        appUser.setAnswer(answer);
        appUser.setModifiedOn(new java.util.Date());
        
        appUserService.create(appUser);
        
        out.println("Details Updated Successfully");
        
    }
}
