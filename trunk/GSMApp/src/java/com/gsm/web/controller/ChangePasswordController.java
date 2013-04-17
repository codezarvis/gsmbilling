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
import org.apache.poi.hslf.record.PPDrawing;

/**
 *
 * @author user
 */
public class ChangePasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
                
        String userName = request.getParameter("userName");
        String currentPassword = request.getParameter("currentPwd");
        String newPassword = request.getParameter("newPwd");
        String confirmPassword = request.getParameter("confirmPwd");
    
        AppUserService appUserService = DomainServiceUtils.getAppUserService();
        AppUser appUser = appUserService.authenticate(userName, currentPassword);
        
        if(appUser == null){
            
            out.println("Invalid User Details..!!");
            return;
        }
        
        appUser.setId(appUser.getId());
        appUser.setGuid(appUser.getGuid());
        appUser.setUserName(appUser.getUserName());
        appUser.setPassword(newPassword);
        appUser.setNumber(appUser.getNumber());
        appUser.setEmail(appUser.getEmail());
        appUser.setUserRole(appUser.getUserRole());
        appUser.setCreatedBy(appUser.getCreatedBy());
        appUser.setCreatedOn(appUser.getCreatedOn());
        appUser.setModifiedBy(appUser.getModifiedBy());
        appUser.setModifiedOn(new java.util.Date());
        appUser.setActive(appUser.getActive());
        
        appUserService.create(appUser);
        
        out.println("Your Password Has Been Successfully Changed..!!");
}
}
