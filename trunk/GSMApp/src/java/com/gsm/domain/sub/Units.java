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
public class Units extends Domain {

    private String meterNumber;
    private Date readingDate;
    private int previousReading;
    private int currentReading;
    private int totalUnits;
    private double totalPrice;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

      public Units() {

        setGuid(UUID.randomUUID().toString());

    }
    public String getMeterNumber() {
        return meterNumber;
    }

    public void setMeterNumber(String meterNumber) {
        this.meterNumber = meterNumber;
    }

    public Date getReadingDate() {
        return readingDate;
    }

    public void setReadingDate(Date readingDate) {
        this.readingDate = readingDate;
    }

    public int getPreviousReading() {
        return previousReading;
    }

    public void setPreviousReading(int previousReading) {
        this.previousReading = previousReading;
    }

    public int getCurrentReading() {
        return currentReading;
    }

    public void setCurrentReading(int currentReading) {
        this.currentReading = currentReading;
    }

    public int getTotalUnits() {
        return totalUnits;
    }

    public void setTotalUnits(int totalUnits) {
        this.totalUnits = totalUnits;
    }

    @Override
    public String toString() {
        return "Units{" + "readingDate=" + readingDate + ", previousReading=" + previousReading + ", currentReading=" + currentReading + ", totalUnits=" + totalUnits + '}';
    }
}
