package com.puchenko.credit.controller.rest;

import com.puchenko.SessionBean;
import com.puchenko.SpringFactory;
import com.puchenko.credit.model.Client;
import com.puchenko.credit.model.Stat;
import com.puchenko.credit.model.User;
import com.puchenko.credit.service.ClientService;
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

@Path("clients")
public class ClientsController {

    @GET
    @Path("create")
    @Produces("text/html")
    public Response create(@QueryParam("paramName") String name) {
        java.net.URI location = null;

        try {
            SessionBean sessionBean = (SessionBean) SpringFactory.getspringApplicationContext().getBean("sessionBean");
            User currentUser = sessionBean.getCurrentUser();

            Client client = new Client();
            client.setId(0);
            client.setName(name);
            client.setDate(new Date());
            client.setUserId(currentUser.getId());

            ClientService projectService = (ClientService) SpringFactory.getspringApplicationContext().getBean("clientService");
            projectService.createClient(client);            
                        
            Stat stat = new Stat();
            stat.setId(0);
            stat.setDescription("User " + currentUser.getName() + " create a new client with id: " + client.getId());
            stat.setDate(new Date());
            
            StatService statService = (StatService) SpringFactory.getspringApplicationContext().getBean("statService");
            statService.createStat(stat);

            location = new java.net.URI("../clients-menu.jsp");

        } catch (URISyntaxException ex) {
            Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return Response.temporaryRedirect(location).build();
    }

}
