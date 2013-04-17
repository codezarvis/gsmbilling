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
public class Client extends Domain {

    private String serviceNumber;
    private String firstName;
    private String lastName;
    private String address;
    private String area;
    private String wardNum;
    private String mobile;
    private String email;
    private String meterNumber;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getWardNum() {
        return wardNum;
    }

    public void setWardNum(String wardNum) {
        this.wardNum = wardNum;
    }

    public Client() {

        setGuid(UUID.randomUUID().toString());

    }

    public String getServiceNumber() {
        return serviceNumber;
    }

    public void setServiceNumber(String serviceNumber) {
        this.serviceNumber = serviceNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMeterNumber() {
        return meterNumber;
    }

    public void setMeterNumber(String meterNumber) {
        this.meterNumber = meterNumber;
    }

    @Override
    public String toString() {
        return "Client{" + "serviceNumber=" + serviceNumber + ", firstName=" + firstName + ", lastName=" + lastName + ", address=" + address + ", mobile=" + mobile + ", email=" + email + ", meterNumber=" + meterNumber + '}';
    }
}
