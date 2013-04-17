/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service;

import com.gsm.domain.sub.Payments;
import java.util.List;

/**
 *
 * @author user
 */
public interface PaymentService {
    
    void create(Payments payments);
    
    List<Payments> getAll();
    
}
