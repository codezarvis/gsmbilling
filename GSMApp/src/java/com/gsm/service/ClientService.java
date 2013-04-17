/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service;

import com.gsm.domain.sub.Client;
import java.util.List;

/**
 *
 * @author user
 */
public interface ClientService {
    
    void create(Client client);
    
    List<Client> getAll();
    
    Client findByServiceNumber(String serviceNumber);
    
    List<Client> findByAreaAndWard(String area, String wardNum);
    
    Client findByMeterNumber(String meterNumber);
}
