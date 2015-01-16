package com.puchenko.credit.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


@Entity 
@Table (name="LOAN")
public class Loan {
    
    public static final String DEFAULT_NAME = "default name";
    
    private int id;
    private String name;
    private Date date;
    private int userId;
    private int money;
    
    public Loan(){
        id = 0;
        name = DEFAULT_NAME;
        date = new Date();
        userId = 0;
    }
    
    public Loan(String name, int percent, int userId){
        id = 0;
        this.name = name;
        date = new Date();
        this.userId = userId;
    }

    @Id
    @GeneratedValue(generator="increment")
    @GenericGenerator(name="increment", strategy = "increment")
    @Column(name="ID")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column (name="NAME")    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column (name="DATE")     
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Column (name="USER_ID") 
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Column (name="MONEY")     
    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }
    
    
    
}
