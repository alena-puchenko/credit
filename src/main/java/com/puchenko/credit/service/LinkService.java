package com.puchenko.credit.service;


import com.puchenko.credit.model.Link;
import java.util.List;

public interface LinkService {
    
    void createLink(Link link);

    Link readLink(int linkId);

    void updateLink(Link link);

    void deleteLink(Link link);

    List getAllLinks();
    
    List getAllLinksByCustomerId(Integer projectId); 
    
}