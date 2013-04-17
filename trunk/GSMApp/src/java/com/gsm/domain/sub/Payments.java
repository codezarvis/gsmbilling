/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.domain.sub;

import com.gsm.domain.Domain;
import java.util.Date;
import java.util.UUID;

/**
 *
 * @author user
 */
public class Payments extends Domain {

    public Payments() {

        setGuid(UUID.randomUUID().toString());

    }
    private String meterId;
    private String clientName;
    private String bankName;
    private String cardNumber;
    private Date billDate;
    private double billAmount;
    private double amountPaid;
    private double balance;

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    public String getMeterId() {
        return meterId;
    }

    public void setMeterId(String meterId) {
        this.meterId = meterId;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public double getBillAmount() {
        return billAmount;
    }

    public void setBillAmount(double billAmount) {
        this.billAmount = billAmount;
    }

    public double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Payments{" + "meterId=" + meterId + ", clientName=" + clientName + ", bankName=" + bankName + ", cardNumber=" + cardNumber + ", billAmount=" + billAmount + ", amountPaid=" + amountPaid + ", balance=" + balance + '}';
    }
}
