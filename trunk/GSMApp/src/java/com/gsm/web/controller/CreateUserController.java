/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.web.controller;

import com.gsm.domain.sub.AppUser;
import com.gsm.domain.sub.Client;
import com.gsm.service.AppUserService;
import com.gsm.service.ClientService;
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
public class CreateUserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Client client = new Client();

        client.setServiceNumber(request.getParameter("serviceNum"));
        client.setFirstName(request.getParameter("firstName"));
        client.setLastName(request.getParameter("lastName"));
        client.setAddress(request.getParameter("address"));
        client.setMobile(request.getParameter("mobile"));
        client.setArea(request.getParameter("area"));
        client.setWardNum(request.getParameter("wardNum"));
        client.setEmail(request.getParameter("email"));
        client.setMeterNumber(request.getParameter("meterNum"));
        client.setCreatedBy(1);
        client.setCreatedOn(new java.util.Date());
        client.setModifiedBy(1);
        client.setModifiedOn(new java.util.Date());
        client.setActive(1);

        ClientService clientService = DomainServiceUtils.getClientService();
        clientService.create(client);

        AppUser appUser = new AppUser();

        appUser.setUserName(request.getParameter("firstName"));
        appUser.setPassword(request.getParameter("serviceNum"));
        appUser.setNumber(request.getParameter("mobile"));
        appUser.setEmail(request.getParameter("email"));
        appUser.setUserRole("client");
        appUser.setCreatedBy(1);
        appUser.setCreatedOn(new java.util.Date());
        appUser.setModifiedBy(1);
        appUser.setModifiedOn(new java.util.Date());
        appUser.setActive(1);

        AppUserService appUserService = DomainServiceUtils.getAppUserService();
        appUserService.create(appUser);
   
         try{
            
            Properties properties = new Properties();
            properties.setProperty("mail.smtp.host", "smtp.gmail.com");
            properties.setProperty("mail.smtp.port", "587");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.starttls.enable", "true");
            
            Session session = Session.getDefaultInstance(properties, new MyAuthenticator("appaccnt28@gmail.com", "aanya 28"));
            
            String[] tos = {request.getParameter("email")};
           
            InternetAddress[] address = new InternetAddress[tos.length];
         
            Message message = new MimeMessage(session);
            
            for(int i = 0;i < address.length; i++){
                
               address[i] = new InternetAddress(tos[i]) ;
            }
            
            message.setRecipients(Message.RecipientType.TO, address);
            message.setFrom(new InternetAddress("appaccnt28@gmail.com"));                    
            message.setSubject("Registration Details");
            message.setSentDate(new java.util.Date());
           
            message.setText("Registered Email:"+ request.getParameter("email")+ "\nYour Password:"+ request.getParameter("serviceNum"));
            
            Transport.send(message);
         }catch(Exception e){
             e.printStackTrace();
         }
         
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("Client Created Successfully..!! \nPassword  Sent To Registered Email..!!");
  
    }
}
