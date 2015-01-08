package com.puchenko.credit.service;

import com.puchenko.credit.model.Client;
import java.util.List;


public interface ClientService {
    
    void createClient(Client client);
    Client readClient(int clientId);
    void updateClient(Client client);
    void deleteClient(Client client);
    
    List getAllClients();
    List getAllClientsByUserId(Integer userId);
    
    Client getClientByName(String name);
    
}
