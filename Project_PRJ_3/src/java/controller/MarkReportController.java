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
import model.MarkReportModel;
import model.ProgrammingLinkSubjects;
import model.Users;

/**
 *
 * @author ADMIN
 */
public class MarkReportController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        String semester = req.getParameter("semester");
        String acc = String.valueOf(session.getAttribute("account"));
        Users u = new Users();
        Users uGet = u.getUserByID(acc);
        String stdID = uGet.getUserID();
        ProgrammingLinkSubjects pls = new ProgrammingLinkSubjects();
        ArrayList<ProgrammingLinkSubjects> listSemester = pls.getListSemester();
        MarkReportModel mr = new MarkReportModel();
        ArrayList<MarkReportModel> listMarkReport = mr.getListMarkReportBySemester(stdID, semester);
        req.setAttribute("account", acc+"@fpe.edu.vn");
        req.setAttribute("listSemester", listSemester);
        req.setAttribute("listMarkReport", listMarkReport);
        req.getRequestDispatcher("MarkReport.jsp").forward(req, resp);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        
        String acc = req.getParameter("acc");
        ProgrammingLinkSubjects pls = new ProgrammingLinkSubjects();
        ArrayList<ProgrammingLinkSubjects> listSemester = pls.getListSemester();
        
        req.setAttribute("account", acc+"@fpe.edu.vn");
        req.setAttribute("listSemester", listSemester);
        req.getRequestDispatcher("MarkReport.jsp").forward(req, resp);
        
    }
    
}
