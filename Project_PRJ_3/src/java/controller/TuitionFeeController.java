/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import model.Subjects;

/**
 *
 * @author ADMIN
 */
public class TuitionFeeController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        String acc = req.getParameter("acc");
        System.out.println(acc);
        Subjects s = new Subjects();
        ArrayList<Subjects> listS = s.getListSubjects();
        req.setAttribute("listS", listS);
        
        req.getRequestDispatcher("TuitionFee.jsp").forward(req, resp);
    }
    
}
