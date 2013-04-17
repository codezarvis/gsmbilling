/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service.impl;

import com.gsm.domain.sub.AppUser;
import com.gsm.service.AppUserService;
import com.gsm.utils.HibernateUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class AppUserServiceImpl implements AppUserService {

    private static AppUserServiceImpl appUserServiceImpl = new AppUserServiceImpl();

    private AppUserServiceImpl() {
    }

    public static AppUserService getInstance() {

        return appUserServiceImpl;
    }

    @Override
    public void create(AppUser appUser) {

        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollBack = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(appUser);
            tx.commit();
            rollBack = false;
        } catch (Exception exception) {
            exception.printStackTrace();
            HibernateUtils.closeSession();

        } finally {
            if (rollBack && tx != null) {
                tx.rollback();
                HibernateUtils.closeSession();
            }
        }

    }

    @Override
    public AppUser authenticate(String userName, String password) {
        Session session = HibernateUtils.currentSession();
        AppUser appUser = null;
        try {
            Query query = session.createQuery("from AppUser appUser where appUser.userName=:userName and appUser.password=:password");
            query.setParameter("userName", userName);
            query.setParameter("password", password);
            appUser = (AppUser) query.uniqueResult();

        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {
            HibernateUtils.closeSession();
        }
        return appUser;
    }

    @Override
    public AppUser findByUserName(String userName) {

        Session session = HibernateUtils.currentSession();
        AppUser appUser = null;
        try {
            Query query = session.createQuery("from AppUser appUser where appUser.userName=:userName");
            query.setParameter("userName", userName);
            appUser = (AppUser) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return appUser;
    }

    @Override
    public AppUser retrievePassword(String userName, String question, String answer) {
        Session session = HibernateUtils.currentSession();
        AppUser appUser = null;

        try {
            Query query = session.createQuery("from AppUser appUser where appUser.userName=:userName and appUser.question=:question and appUser.answer=:answer");
            query.setParameter("userName", userName);
            query.setParameter("question", question);
            query.setParameter("answer", answer);

            appUser = (AppUser) query.uniqueResult();

        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {
            HibernateUtils.closeSession();
        }

        return appUser;
    }

    @Override
    public AppUser findByGuid(String guid) {
     
        Session session = HibernateUtils.currentSession();
        AppUser appUser = null;
        try {
            Query query = session.createQuery("from AppUser appUser where appUser.guid=:guid");
            query.setParameter("guid", guid);
            appUser = (AppUser) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return appUser;
    }

   
}
