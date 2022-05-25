package com.example.it_forum2;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/delete-servlet")
public class DeleteServlet extends HttpServlet
{
    @EJB
    MyEJB myEJB = new MyEJB();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idUsers=req.getParameter("idUser");
        String idQuestion= req.getParameter("idQuest");
        String LoginUser = req.getParameter("LoginUser");
        if(idUsers!=null)
        {
            myEJB.Delete("Users",Integer.parseInt(idUsers),LoginUser);
        }
        if(idQuestion!=null)
        {
            myEJB.Delete("Question",Integer.parseInt(idQuestion),LoginUser);
        }
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
