package com.example.it_forum2;

public class Answer {
    long IDQ,IDUs,idAnswer;
    String login,answer,admin,correct;

    public Answer(long idAnswer,long IDQ, long IDUs, String login, String answer,String admin,String correct) {
        this.IDQ = IDQ;
        this.IDUs = IDUs;
        this.login = login;
        this.answer = answer;
        this.admin = admin;
        this.idAnswer = idAnswer;
        this.correct = correct;
    }

    public String getCorrect() {
        return correct;
    }

    public void setCorrect(String correct) {
        this.correct = correct;
    }

    public long getIdAnswer() {
        return idAnswer;
    }

    public void setIdAnswer(long idAnswer) {
        this.idAnswer = idAnswer;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public long getIDQ() {
        return IDQ;
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

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
