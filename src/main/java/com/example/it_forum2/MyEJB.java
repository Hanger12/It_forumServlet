package com.example.it_forum2;

import jakarta.ejb.Stateful;
import jakarta.ejb.Stateless;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;

@Stateful
public class MyEJB
{
    public static boolean isSearch=false;
    public static String AdminIN;
    public static int idUser;
    public static long IDQuest;
    public static boolean correctAnswer;
    public String Login;
    public static String LoginIn;
    public String Email;
    public String PasswordIn;
    public static ArrayList<Users> list2= new ArrayList<>();
    public static ArrayList<Question> questions = new ArrayList<>();
    public static ArrayList<Users> Sorted = new ArrayList<>();
    public static ArrayList<Question> SortedQuestion= new ArrayList<>();
    public static ArrayList<Question> SortedQuestion2= new ArrayList<>();
    public static ArrayList<Question> questions2 = new ArrayList<>();
    public static ArrayList<Question> questions3 = new ArrayList<>();
    public static ArrayList<Answer> Answer = new ArrayList<>();

    public static void AllPersonStartPage() {
    try {
        long ID;
        int SortUser;
        String email,login,password,Admin;
        Users users;
        String query1 = "Select * from users";
        Context initContext = new InitialContext();
        Context envContext = (Context) initContext.lookup("java:comp/env");
        DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
        Connection con = ds.getConnection();
        PreparedStatement pr1 =con.prepareStatement(query1);
        ResultSet rs = pr1.executeQuery();
        list2.clear();
        Sorted.clear();
        while (rs.next())
        {
            ID = rs.getLong("idUsers");
            login = rs.getString("Login");
            email = rs.getString("Email");
            password = rs.getString("Password");
            Admin = rs.getString("Admin");
            list2.add(new Users(ID,login,email,password,Admin));
        }
        SortUser = list2.size();
        for (int i=SortUser;i>0;i--)
        {
            users = list2.get(i-1);
            Sorted.add(users);
        }
        list2.clear();
    } catch (NamingException | SQLException ex) {
        System.err.println(ex);
    }
    }
    public void SelectQuestion(long id)
    {
        try {
            long IDQ,IDUs;
            String login,theme,question,admin,tag;

            String SelectQuest ="SELECT idquestion,idUsers,Тема,Вопрос,Login,Admin,Метка from question join users u on question.users_idUsers = u.idUsers where idquestion ="+id;
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(SelectQuest);
            ResultSet rs = pr1.executeQuery();
            questions2.clear();
            while (rs.next())
            {
                IDQ = rs.getLong("idquestion");
                IDUs = rs.getLong("idUsers");
                theme= rs.getString("Тема");
                question= rs.getString("Вопрос");
                login = rs.getString("Login");
                admin = rs.getString("Admin");
                tag = rs.getString("Метка");
                if (admin==null)
                {
                    admin ="Пользователь";
                }
                questions2.add(new Question(IDQ,IDUs,login,theme,question,admin,tag));
            }
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public void AddAnswer(String answer){
        try {
            String Answer="'"+answer+"'";
            String correct="'нет'";
            String idquestion="'"+IDQuest+"'";
            String idUs="'"+idUser+"'";
            String query1 = "INSERT INTO answers (Ответ, Правильный, users_idUsers, question_idquestion) VALUES ("+Answer+","+correct+","+idUs+","+idquestion+")";
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(query1);
            pr1.executeUpdate();
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public static void AnswerOnQuestion(long idQ)
    {
        try {
            long IDQ,IDUs,idAnswer;
            String login,answer,admin,correct;
            String query ="SELECT idanswers,idquestion,idUsers,Login,Ответ,Admin,Правильный from answers\n" +
                    "    join question q on answers.question_idquestion = q.idquestion\n" +
                    "    join users u on u.idUsers = answers.users_idUsers where idquestion ="+idQ;
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(query);
            ResultSet rs = pr1.executeQuery();
            Answer.clear();
            while (rs.next())
            {
                correct = rs.getString("Правильный");
                idAnswer = rs.getLong("idanswers");
                IDQ = rs.getLong("idquestion");
                IDUs = rs.getLong("idUsers");
                login = rs.getString("Login");
                answer = rs.getString("Ответ");
                admin = rs.getString("Admin");
                if (admin==null)
                {
                    admin ="Пользователь";
                }
                Answer.add(new Answer(idAnswer,IDQ,IDUs,login,answer,admin,correct));
            }
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public static void AllQuestionOnPerson()
    {
        try {
            long IDQ,IDUs;
            int SortQuest;
            String login,theme,question,admin,tag;
            Question question1;
            String query ="SELECT idquestion,idUsers,Тема,Вопрос,Login,Admin,Метка from question join users u on question.users_idUsers = u.idUsers";
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(query);
            ResultSet rs = pr1.executeQuery();
            questions.clear();
            SortedQuestion.clear();
            while (rs.next())
            {
                IDQ = rs.getLong("idquestion");
                IDUs = rs.getLong("idUsers");
                theme= rs.getString("Тема");
                question= rs.getString("Вопрос");
                login = rs.getString("Login");
                admin = rs.getString("Admin");
                tag = rs.getString("Метка");
                if (admin==null)
                {
                    admin ="Пользователь";
                }
                questions.add(new Question(IDQ,IDUs,login,theme,question,admin,tag));
            }
            SortQuest = questions.size();
            for (int i=SortQuest;i>0;i--)
            {
                question1 = questions.get(i-1);
                SortedQuestion.add(question1);
            }
            questions.clear();
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public String registerUsers(String login,String email,String password){
        String loginReg ="'"+login+"'";
        String emailReg ="'"+email+"'";
        String passwordReg = "'"+password+"'";
        try {
            String Search ="Select * from users where Login="+loginReg+"or Email="+emailReg;
            String query = "INSERT INTO users(Login,Email,Password)\n" +
                    "                     value ("+loginReg+","+emailReg+","+passwordReg+")";
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(Search);
            ResultSet rs1 = pr1.executeQuery();
            while (rs1.next())
            {
                Login = rs1.getString("Login");
                Email = rs1.getString("Email");
            }
            if(Login==null&&Email==null)
            {
                PreparedStatement pr =con.prepareStatement(query);
                pr.executeUpdate();
            }

        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
        if(Login!=null&&Email!=null)
        {
            Login= null;
            Email= null;
            return "Данный пользователь уже зарегистрирован";
        }
        else return "Регистрация прошла успешно";
    }
    public String LoginUser(String loginIn,String passwordIn){
        try {
            String login = "'"+loginIn+"'";
            PasswordIn = "'"+passwordIn+"'";
            String query1 = "Select * from users where Login="+login+" OR Email="+login+"And Password="+PasswordIn;
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();

            PreparedStatement pr1 =con.prepareStatement(query1);
            ResultSet rs = pr1.executeQuery();
            while (rs.next())
            {
                AdminIN = rs.getString("Admin");
                idUser = rs.getInt("idUsers");
                LoginIn = rs.getString("Login");
            }
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
        return LoginIn;
    }
    public void Delete(String where,int id,String LoginUser)
    {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            if(where.equals("Users"))
            {
                if(!LoginUser.equals("Admin"))
                {
                    String idUs="'"+id+"'";
                    String query1="DELETE FROM question WHERE (users_idUsers ="+idUs+")";
                    String query2="DELETE FROM answers WHERE (users_idUsers ="+idUs+")";
                    String query3 ="DELETE FROM users WHERE (idUsers ="+idUs+")";
                    PreparedStatement pr1 =con.prepareStatement(query2);
                    pr1.executeUpdate();
                    PreparedStatement pr2 =con.prepareStatement(query1);
                    pr2.executeUpdate();
                    PreparedStatement pr3 =con.prepareStatement(query3);
                    pr3.executeUpdate();
                }
            }
            else if(where.equals("Question"))
            {
                String idQ="'"+id+"'";
                String query1="DELETE FROM answers WHERE (question_idquestion ="+idQ+")";
                String query2 ="DELETE FROM question WHERE (idquestion ="+idQ+")";
                PreparedStatement pr1 =con.prepareStatement(query1);
                pr1.executeUpdate();
                PreparedStatement pr2 =con.prepareStatement(query2);
                pr2.executeUpdate();
            }

        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public void AddQuestion(String Tag,String Them,String Question){
        try {
            String tag="'"+Tag+"'";
            String them="'"+Them+"'";
            String question="'"+Question+"'";
            String idUs="'"+idUser+"'";
            String query1 = "INSERT INTO question(Тема,Вопрос, Метка, users_idUsers) VALUES ("+them+","+question+","+tag+","+idUs+")";
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(query1);
            pr1.executeUpdate();
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public void updateCorrectAnswer(int idAnswer){
        try {
            String idAn ="'"+idAnswer+"'";
            String query ="UPDATE answers SET Правильный = 'да' WHERE (idanswers="+idAn+")";
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(query);
            pr1.executeUpdate();
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
    public void SearchQuestionOnTag(String Tag)
    {
        try {
            long IDQ,IDUs;
            int SortQuest;
            String login,theme,question,admin,tag;
            Question question1;
            String query ="SELECT idquestion,idUsers,Тема,Вопрос,Login,Admin,Метка from question join users u on question.users_idUsers = u.idUsers where Метка="+"'"+Tag+"'";
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envContext.lookup("jdbc/bdusers_for_it_forum");
            Connection con = ds.getConnection();
            PreparedStatement pr1 =con.prepareStatement(query);
            ResultSet rs = pr1.executeQuery();
            questions3.clear();
            SortedQuestion2.clear();
            while (rs.next())
            {
                IDQ = rs.getLong("idquestion");
                IDUs = rs.getLong("idUsers");
                theme= rs.getString("Тема");
                question= rs.getString("Вопрос");
                login = rs.getString("Login");
                admin = rs.getString("Admin");
                tag = rs.getString("Метка");
                if (admin==null)
                {
                    admin ="Пользователь";
                }
                questions3.add(new Question(IDQ,IDUs,login,theme,question,admin,tag));
            }
            SortQuest = questions3.size();
            for (int i=SortQuest;i>0;i--)
            {
                question1 = questions3.get(i-1);
                SortedQuestion2.add(question1);
            }
            questions3.clear();
        } catch (NamingException | SQLException ex) {
            System.err.println(ex);
        }
    }
}
