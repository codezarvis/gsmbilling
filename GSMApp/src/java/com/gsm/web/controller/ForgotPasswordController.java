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
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        System.out.println("In Controller");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String username = request.getParameter("userName");
        String question = request.getParameter("securityQuestion");
        String answer = request.getParameter("answer");
        
       
        String ajaxResponse = null;
        AppUserService appUserService = DomainServiceUtils.getAppUserService();
        AppUser appUser = appUserService.retrievePassword(username.trim(), question.trim(), answer.trim());

        if (appUser == null) {
            ajaxResponse = "Invalid Details !";
           
            out.println(ajaxResponse);
            return;
        }

        
         try{
            
            Properties properties = new Properties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com");
            properties.setProperty("mail.smtp.port", "587");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");
            
            Session session = Session.getDefaultInstance(properties, new MyAuthenticator("sushi.indukuri@gmail.com", "warwickshiremba 24"));
            
            String[] tos = {appUser.getEmail()};
           
            InternetAddress[] address = new InternetAddress[tos.length];
         
            Message message = new MimeMessage(session);
            
            for(int i = 0;i < address.length; i++){
                
               address[i] = new InternetAddress(tos[i]) ;
            }
            
            message.setRecipients(Message.RecipientType.TO, address);
            message.setFrom(new InternetAddress("sushi.indukuri@gmail.com"));                    
            message.setSubject("Your Retrived Password");
            message.setSentDate(new java.util.Date());
            message.setText("Your Password:"+ appUser.getPassword());
            
            Transport.send(message);
         }catch(Exception e){
             e.printStackTrace();
         }
        ajaxResponse = "Your Password has been send to Your E- Mail !";
        out.println(ajaxResponse);


    }
}
