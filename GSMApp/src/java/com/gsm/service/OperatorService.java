/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service;

import com.gsm.domain.sub.MeterOperator;
import java.util.List;

/**
 *
 * @author user
 */
public interface OperatorService {

    void create(MeterOperator meterOperator);

    List<MeterOperator> getAll();

    MeterOperator findById(String operatorId);

    MeterOperator findByWard(String wardNum);

    MeterOperator findByCity(String city);
}
