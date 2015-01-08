package com.puchenko.credit.service.implementation;

import com.puchenko.HibernateFactory;
import com.puchenko.credit.model.Client;
import com.puchenko.credit.service.ClientService;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ClientServiceImplementation implements ClientService{

    @Override
    public void createClient(Client client) {
    //SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(client);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public Client readClient(int clientId) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Client client;
        client = (Client) session.get(Client.class, clientId);
        session.close();

        return client;
    }

    @Override
    public void updateClient(Client client) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(client);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteClient(Client client) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.delete(client);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List getAllClients() {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List clientsList = session.createCriteria(Client.class).list();
        session.close();

        return clientsList;
    }
    
    @Override
    public List getAllClientsByUserId(Integer userId){
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List clientsList = session.createCriteria(Client.class).list();
        session.close();
        
        List userClientsList = new ArrayList();
        for (int i = 0; i < clientsList.size(); i++){
            Client client = (Client) clientsList.get(i);
            if (client != null){
                if (client.getUserId() == userId){
                    userClientsList.add(client);
                }    
            }
            
        }

        return userClientsList;
    }
    
    @Override
    public Client getClientByName(String name) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List clientsList = session.createCriteria(Client.class).list();
        session.close();
        
        Client resultClient = null;
        for (int i = 0; i < clientsList.size(); i++){
            Client client = (Client) clientsList.get(i);
            if (client.getName().equals(name)){
                resultClient = client;
            }
        }

        return resultClient;
    }
    
}
