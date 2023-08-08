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
import model.Users;

/**
 *
 * @author ADMIN
 */
public class ProfileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

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
        if (uProfile != null) {
//            ArrayList<Users> listU = new ArrayList<Users>();
//            listU.add(uProfile);
            req.setAttribute("uID", uProfile.getUserID());
            req.setAttribute("uName", uProfile.getName());
            req.setAttribute("gender", uProfile.getGender());
            req.setAttribute("email", uProfile.getEmail());
            
            req.setAttribute("numberPhone", uProfile.getNumberPhone());
            req.setAttribute("role", uProfile.getRole());
//            req.setAttribute("listU", listU);
            
            req.getRequestDispatcher("StudentProfile.jsp").forward(req, resp);
        }
    }

}
