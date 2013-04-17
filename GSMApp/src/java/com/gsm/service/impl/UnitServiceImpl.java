/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service.impl;

import com.gsm.domain.sub.Units;
import com.gsm.service.UnitService;
import com.gsm.utils.HibernateUtils;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author user
 */
public class UnitServiceImpl implements UnitService {

    List<Units> unitsList = new ArrayList<Units>();
    private static UnitService unitService = new UnitServiceImpl();

    private UnitServiceImpl() {
    }

    public static UnitService getInstance() {

        return unitService;
    }

    @Override
    public void create(Units units) {

        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollBack = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(units);
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
    public List<Units> getAll() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<Units> findByMeterId(String meterNumber) {

        Session session = HibernateUtils.currentSession();

        try {
            Query query = session.createQuery("from Units units where units.meterNumber=:meterNumber");
            query.setParameter("meterNumber", meterNumber);
            unitsList = query.list();
        } catch (Exception exception) {

            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }

        return unitsList;
    }

    @Override
    public Units findByMeterIdAndDate(String meterNumber, Date readingDate) {


        Session session = HibernateUtils.currentSession();
        Units units = null;
        try {
//            Query query = session.createQuery("from Units units where units.meterNumber=:meterNumber and units.readingDate=:readingDate");
//            query.setParameter("meterNumber", meterNumber);
//            query.setParameter("readingDate", readingDate);
//            units = (Units) query.uniqueResult();
            Criteria criteria = session.createCriteria(Units.class);
            criteria.add(Restrictions.eq("meterNumber", meterNumber)).add(Restrictions.eq("readingDate", readingDate));
            units = (Units) criteria.uniqueResult();
            System.out.println("UNITS*******" + units);
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return units;
    }
}
