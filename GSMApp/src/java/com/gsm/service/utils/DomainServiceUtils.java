/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service.utils;

import com.gsm.service.AppUserService;
import com.gsm.service.ClientService;
import com.gsm.service.OperatorService;
import com.gsm.service.PaymentService;
import com.gsm.service.UnitService;
import com.gsm.service.impl.AppUserServiceImpl;
import com.gsm.service.impl.ClientServiceImpl;
import com.gsm.service.impl.OperatorServiceImpl;
import com.gsm.service.impl.PaymentServiceImpl;
import com.gsm.service.impl.UnitServiceImpl;

/**
 *
 * @author user
 */
public class DomainServiceUtils {
    
    public static AppUserService getAppUserService(){
        
        return AppUserServiceImpl.getInstance();
    }
    
    public static ClientService getClientService(){
        
        return ClientServiceImpl.getInstance();
    }
    
     
    public static OperatorService getOperatorService(){
        
        return OperatorServiceImpl.getInstance();
    }
       
    public static UnitService getUnitService(){
        
        return UnitServiceImpl.getInstance();
    }
    
     public static PaymentService getPaymentService(){
        
        return PaymentServiceImpl.getInstance();
    }
    
    
}
