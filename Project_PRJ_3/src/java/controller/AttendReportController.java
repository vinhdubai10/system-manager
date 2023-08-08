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
import model.AttendReport;
import model.Users;

/**
 *
 * @author ADMIN
 */
public class AttendReportController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        String acc = String.valueOf(session.getAttribute("account"));
        Users u = new Users();
        Users uGet = u.getUserByID(acc);
        String stdID = uGet.getUserID();
        AttendReport atr = new AttendReport();
        ArrayList<AttendReport> listA = atr.getListAttendReport(stdID);
        
        req.setAttribute("listA", listA);
        req.getRequestDispatcher("AttendReport.jsp").forward(req, resp);
    }
    
}
