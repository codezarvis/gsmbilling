package com.gsm.web.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author user
 */
public class MyAuthenticator extends Authenticator {

    PasswordAuthentication authentication = null;

    public MyAuthenticator(String userName, String password) {

        authentication = new PasswordAuthentication(userName, password);
    }

    public PasswordAuthentication getPasswordAuthentication() {

        return authentication;
    }
}
