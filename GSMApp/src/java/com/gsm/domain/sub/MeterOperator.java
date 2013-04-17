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
public class MeterOperator extends Domain {

    private String operatorId;
    private String operatorName;
    private String area;
    private String wardNo;
    private String city;

    public MeterOperator() {

        setGuid(UUID.randomUUID().toString());

    }

    public String getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(String operatorId) {
        this.operatorId = operatorId;
    }

    public String getOperatorName() {
        return operatorName;
    }

    public void setOperatorName(String operatorName) {
        this.operatorName = operatorName;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getWardNo() {
        return wardNo;
    }

    public void setWardNo(String wardNo) {
        this.wardNo = wardNo;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "MeterOperator{" + "operatorId=" + operatorId + ", operatorName=" + operatorName + ", area=" + area + ", wardNo=" + wardNo + ", city=" + city + '}';
    }
}
