package com.puchenko.credit.test;

import com.puchenko.SpringFactory;
import com.puchenko.credit.model.Client;
import com.puchenko.credit.model.Link;
import com.puchenko.credit.model.Loan;
import com.puchenko.credit.model.Stat;
import com.puchenko.credit.model.User;
import com.puchenko.credit.service.ClientService;
import com.puchenko.credit.service.LinkService;
import com.puchenko.credit.service.LoanService;
import com.puchenko.credit.service.StatService;
import com.puchenko.credit.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static org.junit.Assert.fail;

import org.junit.Test;

public class AppTest {

    @Test
    public void testUsers() {
        System.out.println("Working Directory = "
                + System.getProperty("user.dir"));

        // User service test!
        System.out.println("User service test.");

        UserService userService = (UserService) SpringFactory.getspringApplicationContext().getBean("userService");

        User user = new User();
        user.setId(0);
        user.setLogin("hibernateUser");
        String userName = "Hibernate test user";
        user.setName(userName);
        user.setPassword("hibernate");
        user.setRegistrationDate(new Date());

        userService.createUser(user);
        int userId = user.getId();
        System.out.println("create user done. User id: " + userId);

        user = userService.readUser(userId);
        if (!user.getName().equals(userName)) {
            fail("User name from create and read operations are not equals!!!");
        } else {
            System.out.println("Read user done!");
        }

        userName = "new Name";
        user.setName(userName);
        userService.updateUser(user);
        userId = user.getId();
        user = userService.readUser(userId);
        if (!user.getName().equals(userName)) {
            fail("User name from update and read operations are not equals!!!");
        } else {
            System.out.println("Update user done!");
        }

        String userLogin = user.getLogin();
        User tempUser = userService.getUserByLogin(userLogin);
        System.out.println("Test userService.getUserByLogin: " + tempUser.getName());

        userService.deleteUser(user);
        System.out.println("Delete user done!");

        // Client service test. -----------------------------------------------       
        System.out.println("Customer service test.");
        ClientService clientService = (ClientService) SpringFactory.getspringApplicationContext().getBean("clientService");
        Client client = new Client();
        client.setId(0);
        client.setName("Client test");
        client.setDate(new Date());

        clientService.createClient(client);
        System.out.println("create client done. Client id: " + client.getId());

        clientService.deleteClient(client);
        System.out.println("Delete client done!");
        
        
        
        // Loan service test. -----------------------------------------------       
        System.out.println("Loan service test.");
        LoanService loanService = (LoanService) SpringFactory.getspringApplicationContext().getBean("loanService");
        Loan loan = new Loan();
        loan.setId(0);
        loan.setName("Loan test");
        loan.setDate(new Date());
        loan.setUserId(1);

        loanService.createLoan(loan);
        System.out.println("create loan done. loan id: " + client.getId());

        loanService.deleteLoan(loan);
        System.out.println("Delete loan done!");

        // Stat service test. --------------------------------------------------      
        System.out.println("Stat service test.");
        StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
        Stat stat = new Stat();
        stat.setId(0);
        stat.setDate(new Date());
        stat.setDescription("First stat record!");

        statService.createStat(stat);
        System.out.println("Create stat done. Stat id: " + stat.getId());

        statService.deleteStat(stat);
        System.out.println("Delete stat done!");
        
        // Link service test. --------------------------------------------------
        
        LinkService linkService = (LinkService) SpringFactory.getspringApplicationContext().getBean("linkService");
        //linkService.createLink(link);
        
        
        List linksList = new ArrayList();
                linksList = linkService.getAllLinksByCustomerId(1);
                linksList  =null;
        
    }
}
