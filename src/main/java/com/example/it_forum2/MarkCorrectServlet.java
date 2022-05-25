package com.example.it_forum2;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Mark-servlet")
public class MarkCorrectServlet extends HttpServlet {
    @EJB
    MyEJB myEJB = new MyEJB();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idAnswer = req.getParameter("idAnswer");
        myEJB.updateCorrectAnswer(Integer.parseInt(idAnswer));
        myEJB.SelectQuestion(MyEJB.IDQuest);
        req.setAttribute("SelectQuestion",MyEJB.questions2);
        req.getRequestDispatcher("QuestionSelect.jsp").forward(req,resp);
    }
}
