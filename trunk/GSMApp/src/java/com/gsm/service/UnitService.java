/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service;

import com.gsm.domain.sub.Units;
import java.util.Date;
import java.util.List;

/**
 *
 * @author user
 */
public interface UnitService {

    void create(Units units);

    List<Units> getAll();

    List<Units> findByMeterId(String meterNumber);
    
    Units findByMeterIdAndDate(String meterNumber,Date readingDate);
}
