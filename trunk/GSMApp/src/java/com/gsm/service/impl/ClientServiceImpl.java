/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gsm.service.impl;

import com.gsm.domain.sub.Client;
import com.gsm.service.ClientService;
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
public class ClientServiceImpl implements ClientService {

    List<Client> list = new ArrayList<Client>();
    private static ClientService clientService = new ClientServiceImpl();

    private ClientServiceImpl() {
    }

    public static ClientService getInstance() {

        return clientService;
    }

    @Override
    public void create(Client client) {

        Session session = HibernateUtils.currentSession();
        Transaction tx = null;
        boolean rollBack = true;
        try {
            tx = session.beginTransaction();
            session.saveOrUpdate(client);
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
    public List<Client> getAll() {
        Session session = HibernateUtils.currentSession();

        try {
            Query query = session.createQuery("from Client client");
            list = query.list();
        } catch (Exception exception) {

            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }

        return list;
    }

    @Override
    public List<Client> findByAreaAndWard(String area, String wardNum) {

        Session session = HibernateUtils.currentSession();

        try {
            Query query = session.createQuery("from Client client where client.area=:area and client.wardNum=:wardNum");
            query.setParameter("area", area);
            query.setParameter("wardNum", wardNum);
            list = query.list();
        } catch (Exception exception) {

            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }

        return list;
    }

    @Override
    public Client findByServiceNumber(String serviceNumber) {


        Session session = HibernateUtils.currentSession();
        Client client = null;
        try {
            Query query = session.createQuery("from Client client where client.serviceNumber=:serviceNumber");
            query.setParameter("serviceNumber", serviceNumber);
            client = (Client) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return client;

    }

    @Override
    public Client findByMeterNumber(String meterNumber) {

        Session session = HibernateUtils.currentSession();
        Client client = null;
        try {
            Query query = session.createQuery("from Client client where client.meterNumber=:meterNumber");
            query.setParameter("meterNumber", meterNumber);
            client = (Client) query.uniqueResult();
        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {

            HibernateUtils.closeSession();
        }
        return client;
    }
}
