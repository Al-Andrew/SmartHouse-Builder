package com.smarthousebuilder.forum.user;

import javax.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected int id;
    @Column(name = "username")
    protected String nameUser;
    @Column(name = "password")
    protected String passUser;
    @Column(name = "email")
    protected String emailUser;
    public User(){}

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", nameUser='" + nameUser + '\'' +
                ", passUser='" + passUser + '\'' +
                ", emailUser='" + emailUser + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getPassUser() {
        return passUser;
    }

    public void setPassUser(String passUser) {
        this.passUser = passUser;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }
}
