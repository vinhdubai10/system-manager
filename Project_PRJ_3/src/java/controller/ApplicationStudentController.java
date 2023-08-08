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
import model.Message;
import model.Users;

/**
 *
 * @author ADMIN
 */
public class ApplicationStudentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String acc = String.valueOf(session.getAttribute("account"));
        Users u = new Users();
        Users uGet = u.getUserByID(acc);
        String stdID = uGet.getUserID();
        String type = req.getParameter("type");
        String purpose = req.getParameter("purpose");
        String dateCreate = req.getParameter("dateC");
        Message m = new Message();
        m.addApplication(stdID, type, purpose, dateCreate);
        ArrayList<Message> listM = m.getListMStudent(stdID);

        req.setAttribute("listM", listM);
        req.getRequestDispatcher("WebUni.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("account"));
        if (session.getAttribute("account") == null) {
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        String mod = req.getParameter("mod");
        if ("1".equals(mod)) {
            String acc = String.valueOf(session.getAttribute("account"));
            Users u = new Users();
            Users uGet = u.getUserByID(acc);
            String stdID = uGet.getUserID();
            Message m = new Message();
            ArrayList<Message> listM = m.getListMStudent(stdID);

            req.setAttribute("listM", listM);
            req.getRequestDispatcher("ApplicationStudent.jsp").forward(req, resp);
        }
        if ("2".equals(mod)) {
            req.getRequestDispatcher("SendApplicationStudent.jsp").forward(req, resp);
        }
    }

}
