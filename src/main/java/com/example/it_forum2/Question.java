package com.example.it_forum2;

public class Question
{
    long IDQ,IDUs;
    String login,theme,question,admin,tag;

    public Question(long IDQ, long IDUs, String login, String theme, String question,String admin,String tag) {
        this.IDQ = IDQ;
        this.IDUs = IDUs;
        this.login = login;
        this.theme = theme;
        this.question = question;
        this.admin = admin;
        this.tag = tag;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Question() {
    }

    public long getIDQ() {
        return IDQ;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public void setIDQ(long IDQ) {
        this.IDQ = IDQ;
    }

    public long getIDUs() {
        return IDUs;
    }

    public void setIDUs(long IDUs) {
        this.IDUs = IDUs;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
