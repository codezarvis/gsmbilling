/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service.impl;

import com.gsm.domain.sub.MeterOperator;
import com.gsm.service.OperatorService;
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
public class OperatorServiceImpl implements OperatorService {

    List<MeterOperator> list = new ArrayList<MeterOperator>();
    private static OperatorService operatorService = new OperatorServiceImpl();

    private OperatorServiceImpl() {
    }

    public static OperatorService getInstance() {

        return operatorService;
    }

    @Override
    public void create(MeterOperator meterOperator) {

        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollBack = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(meterOperator);
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
    public List<MeterOperator> getAll() {


        Session session = HibernateUtils.currentSession();

        try {
            Query query = session.createQuery("from MeterOperator meterOperator");
            list = query.list();
        } catch (Exception exception) {

            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return list;

    }

    @Override
    public MeterOperator findById(String operatorId) {

        Session session = HibernateUtils.currentSession();
        MeterOperator meterOperator = null;
        try {
            Query query = session.createQuery("from MeterOperator meterOperator where meterOperator.operatorId=:operatorId");
            query.setParameter("operatorId", operatorId);
            meterOperator = (MeterOperator) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return meterOperator;
    }

    @Override
    public MeterOperator findByWard(String wardNum) {

        Session session = HibernateUtils.currentSession();
        MeterOperator meterOperator = null;
        try {
            Query query = session.createQuery("from MeterOperator meterOperator where meterOperator.wardNum=:wardNum");
            query.setParameter("wardNum", wardNum);
            meterOperator = (MeterOperator) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return meterOperator;
    }

    @Override
    public MeterOperator findByCity(String city) {


        Session session = HibernateUtils.currentSession();
        MeterOperator meterOperator = null;
        try {
            Query query = session.createQuery("from MeterOperator meterOperator where meterOperator.city=:city");
            query.setParameter("city", city);
            meterOperator = (MeterOperator) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return meterOperator;
    }
}
