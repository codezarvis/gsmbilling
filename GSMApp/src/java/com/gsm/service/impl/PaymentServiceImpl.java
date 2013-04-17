/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service.impl;

import com.gsm.domain.sub.Payments;
import com.gsm.service.PaymentService;
import com.gsm.utils.HibernateUtils;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author user
 */
public class PaymentServiceImpl implements PaymentService{
    
    List<Payments> list = new ArrayList<Payments>();
    
    private static PaymentService paymentService = new PaymentServiceImpl();

    private PaymentServiceImpl() {
    }

    public static PaymentService getInstance() {

        return paymentService;
    }

    @Override
    public void create(Payments payments) {
    
        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollBack = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(payments);
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
    public List<Payments> getAll() {
      
         Session session = HibernateUtils.currentSession();

        try {
            Query query = session.createQuery("from Payments payments");
            list = query.list();
        } catch (Exception exception) {

            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return list;
    }
}
