package com.puchenko.credit.controller.rest;

import com.puchenko.SessionBean;
import com.puchenko.SpringFactory;
import com.puchenko.credit.model.Link;
import com.puchenko.credit.model.Client;
import com.puchenko.credit.model.Stat;
import com.puchenko.credit.model.Loan;
import com.puchenko.credit.model.User;
import com.puchenko.credit.service.LinkService;
import com.puchenko.credit.service.ClientService;
import com.puchenko.credit.service.StatService;
import com.puchenko.credit.service.LoanService;
import java.net.URISyntaxException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Response;

@Path("links")
public class LinksController {

    @GET
    @Path("create")
    @Produces("text/html")
    public Response create(@QueryParam("paramCustomerName") String projectName, @QueryParam("paramInsuranceName") String insuranceName, @QueryParam("paramPercent") int percent) {
        java.net.URI location = null;

        try {
            SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
            User currentUser = sessionBean.getCurrentUser();
            Integer currentUserId = currentUser.getId();

            Link link = new Link();
            link.setId(0);

            ClientService customerService = (ClientService) SpringFactory.getspringApplicationContext().getBean("clientService");
            Client customer = customerService.getClientByName(projectName);
            if (customer != null){
                link.setCustomerId(customer.getId());
            }

            LoanService insuranceService = (LoanService) SpringFactory.getspringApplicationContext().getBean("loanService");
            Loan insurance = insuranceService.getLoanByName(insuranceName);
            if (insurance != null){
                link.setSoftwareId(insurance.getId());
            }

            link.setUserId(currentUserId);
            link.setPercent(percent);

            LinkService linkService = (LinkService) SpringFactory.getspringApplicationContext().getBean("linkService");
            linkService.createLink(link);
            
            Stat stat = new Stat();
            stat.setId(0);
            stat.setDescription("User " + currentUser.getName() + " create a new link with id: " + link.getId());
            stat.setDate(new Date());
            
            StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
            statService.createStat(stat);

            location = new java.net.URI("../credits-menu.jsp");

        } catch (URISyntaxException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Response.temporaryRedirect(location).build();
    }

}
