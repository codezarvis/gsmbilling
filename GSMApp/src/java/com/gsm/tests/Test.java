/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.tests;

import com.gsm.domain.sub.AppUser;
import com.gsm.service.AppUserService;
import com.gsm.service.impl.AppUserServiceImpl;
import com.gsm.service.utils.DomainServiceUtils;

/**
 *
 * @author user
 */
public class Test {
    
    
    public static void main(String args[]){
        
        AppUser appUser = new AppUser();
        
        
        appUser.setUserName("admin");
        appUser.setPassword("admin");
        appUser.setQuestion("What is the name of ur first pet?");
        appUser.setAnswer("jenny");
        appUser.setNumber("1246176910");
        appUser.setEmail("sushmaindukuri@hotmail.com");
        appUser.setUserRole("admin");
        appUser.setCreatedBy(1);
        appUser.setCreatedOn(new java.util.Date());
        appUser.setModifiedBy(1);
        appUser.setModifiedOn(new java.util.Date());
        appUser.setActive(1);
        
        DomainServiceUtils serviceUtils =  new DomainServiceUtils();
       
        AppUserService appUserService =  serviceUtils.getAppUserService();
        appUserService.create(appUser);
//        
//        AppUser appUser1 = appUserService.authenticate("aaa", "aaa");
//        if(appUser1 != null){
//            
//            System.out.println("Authenticated..!!!!!!");
//            return;
//        }
//         
//        AppUser au = appUserService.findByUserName("bbb");
//        
//        if(au != null)
//                {
//                    System.out.println("User Found..!!!!");
//                    return;
//                }
//        else{
//        System.out.println("Not Found");
//        }
    }
}
