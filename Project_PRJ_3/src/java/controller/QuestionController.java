/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class QuestionController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String question = req.getParameter("question");
        String A = req.getParameter("A");
        String B = req.getParameter("B");
        String C = req.getParameter("C");
        String D = req.getParameter("D");
        
        int count = 1;
        
        Question q = new Question();
        ArrayList<Question> listQ = q.getListQ();
//        q.insertQ(question, A, B, C, D);
        req.setAttribute("listQ", listQ);
        req.getRequestDispatcher("Question.jsp").forward(req, resp);
    }
    
}
