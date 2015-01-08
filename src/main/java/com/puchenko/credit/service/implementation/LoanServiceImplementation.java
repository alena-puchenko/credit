package com.puchenko.credit.service.implementation;

import com.puchenko.HibernateFactory;
import com.puchenko.credit.model.Loan;
import com.puchenko.credit.service.LoanService;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class LoanServiceImplementation implements LoanService {

    @Override
    public void createLoan(Loan loan) {
        //SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(loan);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public Loan readLoan(int loanId) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        Loan loan;
        loan = (Loan) session.get(Loan.class, loanId);
        session.close();

        return loan;
    }

    @Override
    public void updateLoan(Loan loan) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(loan);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void deleteLoan(Loan loan) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.delete(loan);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public List getAllLoans() {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List loansList = session.createCriteria(Loan.class).list();
        session.close();

        return loansList;
    }
    
    @Override
    public Loan getLoanByName(String name) {
        SessionFactory sessionFactory = HibernateFactory.getSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        List loansList = session.createCriteria(Loan.class).list();
        session.close();

        Loan resultLoan = null;
        for (int i = 0; i < loansList.size(); i++) {
            Loan loan = (Loan) loansList.get(i);
            if (loan.getName().equals(name)) {
                resultLoan = loan;
            }
        }

        return resultLoan;
    }
    
}
