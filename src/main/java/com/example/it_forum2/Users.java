package com.example.it_forum2;

public class Users
{
    public long id;
    public String login;
    public String email;
    public String password;
    public String admin;
    public Users(long id, String login, String email, String password,String admin) {
        this.id = id;
        this.login = login;
        this.email = email;
        this.password = password;
        this.admin = admin;
    }

    public Users() {
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
