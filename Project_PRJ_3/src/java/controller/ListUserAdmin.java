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
import model.Programming;
import model.Subjects;
import model.Users;

/**
 *
 * @author ADMIN
 */
public class ListUserAdmin extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("update")!=null){
            String userID = req.getParameter("userID");
            String userIDEdit = req.getParameter("userIDEdit");
            String userNameEdit = req.getParameter("userNameEdit");
            String genderEdit = req.getParameter("genderEdit");
            String emailEdit = req.getParameter("emailEdit");
            String passEdit = req.getParameter("passEdit");
            String dobEdit = req.getParameter("dobEdit");
            String numberPhoneEdit = req.getParameter("numberPhoneEdit");
            String roleEdit = req.getParameter("roleEdit");
            String programmingEdit = req.getParameter("programmingEdit");
            String statusEdit = req.getParameter("statusEdit");
            Users u = new Users();
            u.updateUsers(userID, userIDEdit, userNameEdit, genderEdit, emailEdit, passEdit, dobEdit, numberPhoneEdit, roleEdit, programmingEdit, statusEdit);
            ArrayList<Users> listU = u.getListUsers();
            req.setAttribute("listU", listU);
            
            req.getRequestDispatcher("ListUser.jsp").forward(req, resp);
        }
        
        if(req.getParameter("add")!=null){
            String userIDAdd = req.getParameter("userIDAdd");
            String userNameAdd = req.getParameter("userNameAdd");
            String genderAdd = req.getParameter("genderAdd");
            String emailAdd = req.getParameter("emailAdd");
            String passAdd = req.getParameter("passAdd");
            String dobAdd = req.getParameter("dobAdd");
            String numberPhoneAdd = req.getParameter("numberPhoneAdd");
            String roleAdd = req.getParameter("roleAdd");
            String programmingAdd = req.getParameter("programmingAdd");
            String statusAdd = req.getParameter("statusAdd");
            Users u = new Users();
            u.insertUser(userIDAdd, userNameAdd, genderAdd, emailAdd, passAdd, dobAdd, numberPhoneAdd, roleAdd, programmingAdd, statusAdd);
            ArrayList<Users> listU = u.getListUsers();
            req.setAttribute("listU", listU);
            
            req.getRequestDispatcher("ListUser.jsp").forward(req, resp);
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }
        
        if(req.getParameter("update")!=null || req.getParameter("delete")!=null){
            Users u = new Users();
            ArrayList<Users> listU = u.getListUsers();
            Programming p = new Programming();
            ArrayList<Programming> listP = p.getListProgramming();
            req.setAttribute("listU", listU);
            req.setAttribute("listP", listP);
            
            req.getRequestDispatcher("UDUser.jsp").forward(req, resp);
        }
        
        if(req.getParameter("add")!=null){
            Users u = new Users();
            ArrayList<Users> listU = u.getListUsers();
            Programming p = new Programming();
            ArrayList<Programming> listP = p.getListProgramming();
            req.setAttribute("listU", listU);
            req.setAttribute("listP", listP);
            req.getRequestDispatcher("AddUser.jsp").forward(req, resp);
        }


        String role = (String) session.getAttribute("role");
        if(session.getAttribute("role").equals("Admin")){
            String acc = req.getParameter("acc");
            System.out.println(acc);
            Users u = new Users();
            ArrayList<Users> listU = u.getListUsers();
            req.setAttribute("listU", listU);
            
            req.getRequestDispatcher("ListUser.jsp").forward(req, resp);
        }
    }
    
}
