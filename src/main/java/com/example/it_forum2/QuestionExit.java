package com.example.it_forum2;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/mainPage")
public class QuestionExit  extends HttpServlet {
    @EJB
    MyEJB myEJB = new MyEJB();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        myEJB.SelectQuestion(MyEJB.IDQuest);
        req.setAttribute("SelectQuestion",MyEJB.questions2);
        String Login=req.getParameter("Login");
        String Email=req.getParameter("Email");
        String Password=req.getParameter("Password");
        String LoginIn = req.getParameter("LoginIn");
        String PasswordIn = req.getParameter("PasswordIn");
        if(Login!=null&&Email!=null&&Password!=null)
        {
            String Register = myEJB.registerUsers(Login,Email,Password);
            req.setAttribute("Error",Register);
        }
        if(LoginIn!=null&&PasswordIn!=null)
        {
            String Log = myEJB.LoginUser(LoginIn,PasswordIn);
            req.setAttribute("LoginUser",Log);
        }
        if (req.getParameter("ButtonClose")!=null)
        {
            req.setAttribute("LoginUser",null);
            MyEJB.LoginIn=null;
        }
        if(req.getParameter("Answer")!=null)
        {
            myEJB.AddAnswer(req.getParameter("Answer"));
        }

        req.getRequestDispatcher("QuestionSelect.jsp").forward(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("nameBForum",req.getParameter("nameBForum"));
        req.setAttribute("nameBAllQuest",req.getParameter("nameBAllQuest"));
        req.setAttribute("nameBUsers",req.getParameter("nameBUsers"));
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
