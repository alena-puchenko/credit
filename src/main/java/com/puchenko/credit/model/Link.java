package com.puchenko.credit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name = "LINK")
public class Link {
    
    private int id;
    private int clientId;
    private int linkId;
    private int userId;
    private int percent;
    
    public Link() {
        id = 0;
        clientId = 0;
        linkId = 0;
        userId = 0;
        percent = 0;
    }
    
    public Link(int customerId, int softwareId, int userId, int percent){
        id = 0;
        this.clientId = customerId;
        this.linkId = softwareId;
        this.userId = userId;
        this.percent = percent;
    }

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "CLIENT_ID")
    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    @Column(name = "LOAN_ID")
    public int getLinkId() {
        return linkId;
    }

    public void setLinkId(int linkId) {
        this.linkId = linkId;
    }
    
    @Column(name = "USER_ID")
    public int getUserId() {
        return userId;
    }
    
    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Column(name = "PERCENT")
    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
    }
    
    
    
}