package com.puchenko.credit.controller.rest;

import com.puchenko.SessionBean;
import com.puchenko.SpringFactory;
import com.puchenko.credit.model.Loan;
import com.puchenko.credit.model.Stat;
import com.puchenko.credit.model.User;
import com.puchenko.credit.service.LoanService;
import com.puchenko.credit.service.StatService;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

@Path("loans")
public class LoansController {
    
    @GET
    @Path("create")
    @Produces("text/html")
    public Response create(@QueryParam("paramName") String name, @QueryParam("paramMoney") Integer money) {
        java.net.URI location = null;

        try {
            SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
            User currentUser = sessionBean.getCurrentUser();

            Loan insurance = new Loan();
            insurance.setId(0);
            insurance.setName(name);
            insurance.setMoney(money);
            insurance.setDate(new Date());
            insurance.setUserId(currentUser.getId());

            LoanService insuranceService = (LoanService) SpringFactory.getspringApplicationContext().getBean("loanService");
            insuranceService.createLoan(insurance);
                        
            Stat stat = new Stat();
            stat.setId(0);
            stat.setDescription("User " + currentUser.getName() + " create a new loan with id: " + insurance.getId());
            stat.setDate(new Date());
            
            StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
            statService.createStat(stat);

            location = new java.net.URI("../loans-menu.jsp");

        } catch (URISyntaxException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Response.temporaryRedirect(location).build();
    }
    
}
