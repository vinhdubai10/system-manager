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
public class UserController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("acc");
        String pass = req.getParameter("pass");

        Users u = new Users(email, pass);
        if (u.checkLogin(email, pass)) {
            //Luu thong tin vao session
            HttpSession session = req.getSession();
            session.setAttribute("account", email);
            Users uRole = u.getUserByID(email);
            String role = uRole.getRole();
            session.setAttribute("role", role);
            //Lay du lieu o bang users
            if(role.equalsIgnoreCase("Student")) {
                req.setAttribute("account", email);
                req.getRequestDispatcher("WebUni.jsp").forward(req, resp);
            }
            if(role.equalsIgnoreCase("Admin")) {
                req.setAttribute("account", email);
                req.getRequestDispatcher("WebUniAdmin.jsp").forward(req, resp);
            }

        } else {
            req.setAttribute("message", "Login error!");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

}
