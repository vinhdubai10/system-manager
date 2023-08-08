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
import model.Users;

/**
 *
 * @author ADMIN
 */
public class UpdateProfileController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        Users u = new Users();
        String acc = String.valueOf(session.getAttribute("account"));
        Users uProfile = u.getUserByID(acc);
        String dob = req.getParameter("dob");
        String numberPhone = req.getParameter("np");
        uProfile.updateProfile(dob, numberPhone, acc);
        
        req.getRequestDispatcher("WebUni.jsp").forward(req, resp);
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        Users u = new Users();
        String acc = req.getParameter("acc");
        Users uProfile = u.getUserByID(acc);
        req.setAttribute("account", acc+"@fpt.edu.vn");
        req.getRequestDispatcher("UpdateProfile.jsp").forward(req, resp);
    }
    
}
