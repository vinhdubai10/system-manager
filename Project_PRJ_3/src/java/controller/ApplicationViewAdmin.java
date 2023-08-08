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

/**
 *
 * @author ADMIN
 */
public class ApplicationViewAdmin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String messID = req.getParameter("messID");
        String response = req.getParameter("response");
        String dateR = req.getParameter("dateR");
        String status = req.getParameter("status");
        Message m = new Message();
        m.responseApplication(messID, response, dateR, status);
        ArrayList<Message> listM = m.getListResponseAdmin();

        req.setAttribute("listM", listM);
        req.getRequestDispatcher("ApplicationResponseAdmin.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("account"));
        if (session.getAttribute("account") == null) {
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        if (req.getParameter("response") != null) {
            Message m = new Message();
            ArrayList<Message> listUID = m.getListUserID();
            req.setAttribute("listUID", listUID);
            req.getRequestDispatcher("ApplicationResponseMessage.jsp").forward(req, resp);
        }
        String mod = req.getParameter("mod");
        if ("1".equals(mod)) {
            Message m = new Message();
            ArrayList<Message> listM = m.getListMAdmin();

            req.setAttribute("listM", listM);
            req.getRequestDispatcher("ApplicationViewAdmin.jsp").forward(req, resp);
        }
        if ("2".equals(mod)) {
            Message m = new Message();
            ArrayList<Message> listM = m.getListResponseAdmin();

            req.setAttribute("listM", listM);
            req.getRequestDispatcher("ApplicationResponseAdmin.jsp").forward(req, resp);
        }
    }

}
