package com.example.it_forum2;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Users-Servlet")
public class UsersServlet extends HttpServlet {
    @EJB
    MyEJB myEJB = new MyEJB();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MyEJB.IDQuest = Integer.parseInt(req.getParameter("id"));
        myEJB.SelectQuestion(Integer.parseInt(req.getParameter("id")));
        req.setAttribute("SelectQuestion",MyEJB.questions2);
        req.getRequestDispatcher("QuestionSelect.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Login=req.getParameter("Login");
        String Email=req.getParameter("Email");
        String Password=req.getParameter("Password");
        String LoginIn = req.getParameter("LoginIn");
        String PasswordIn = req.getParameter("PasswordIn");
        String Tag=req.getParameter("Tag");
        String Them=req.getParameter("Them");
        String Question=req.getParameter("Question");
        String TagSearch = req.getParameter("TagSearch");
        String BackButton=req.getParameter("back");
        if(Tag!=null&&Them!=null&&Question!=null)
        {
            myEJB.AddQuestion(Tag,Them,Question);

        }
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
            MyEJB.AdminIN=null;
        }
        if(TagSearch!=null&& !TagSearch.equals(""))
        {
            req.setAttribute("nameBAllQuest","checked");
            myEJB.SearchQuestionOnTag(TagSearch);
            MyEJB.isSearch = true;
            req.setAttribute("SearchQuest",MyEJB.SortedQuestion2);
        }
        if(BackButton!=null)
        {
            MyEJB.isSearch = false;
        }
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
