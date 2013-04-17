/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.domain.sub;

import com.gsm.domain.Domain;
import java.util.UUID;

/**
 *
 * @author user
 */
public class AppUser extends Domain {

    private String userName;
    private String password;
    
    private String question;
    private String answer;
    private String number;
    private String email;
    private String userRole;

    public AppUser() {

        setGuid(UUID.randomUUID().toString());

    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "AppUser{" + "userName=" + userName + ", password=" + password + ", userRole=" + userRole + ", securityQuestion=" + question + ", answer=" + answer + ", mobileNumber=" + number + ", email=" + email + '}';
    }
}
