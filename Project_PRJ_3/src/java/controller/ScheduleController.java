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
import model.Schedule;
import model.Users;
import model.Week;

/**
 *
 * @author ADMIN
 */
public class ScheduleController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Week w = new Week();
        String from = req.getParameter("from");
        String to = req.getParameter("to");

        ArrayList<Week> listW = w.getListWeek(from, to);
        Schedule sch = new Schedule();
        Users u = new Users();
        HttpSession session = req.getSession();

        String acc = String.valueOf(session.getAttribute("account"));
        System.out.println(acc);
        Users uProfile = u.getUserByID(acc);
        String userID = uProfile.getUserID();
        System.out.println(userID);
        ArrayList<Schedule> listSch = sch.getListSchedule(userID, from, to);
        
        
        req.setAttribute("listW", listW);
        req.setAttribute("listSch", listSch);

        req.getRequestDispatcher("WeeklyTimetable.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("account"));
        if (session.getAttribute("account") == null) {
            req.getRequestDispatcher("index.html").forward(req, resp);
        }

        Users u = new Users();
        String acc = String.valueOf(session.getAttribute("account"));
        Users uProfile = u.getUserByID(acc);
        Schedule sch = new Schedule();
        sch.setDate("2022-10-03");
        String date = sch.getDate();
        String weekday = sch.getWeekday();
        System.out.println(date);
        System.out.println(weekday);

        req.setAttribute("date", date);
        req.setAttribute("date", date);
        req.setAttribute("weekday", weekday);

        req.getRequestDispatcher("WeeklyTimetable.jsp").forward(req, resp);
    }

}
