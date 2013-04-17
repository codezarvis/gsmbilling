/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service;

import com.gsm.domain.sub.AppUser;

/**
 *
 * @author user
 */
public interface AppUserService {

    void create(AppUser appUser);

    AppUser authenticate(String userName, String password);

    AppUser findByUserName(String userName);

    AppUser retrievePassword(String userName, String question, String answer);

    AppUser findByGuid(String guid);
}
