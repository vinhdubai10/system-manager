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
public class TuitionFeeAdminController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        if(req.getParameter("update")!=null){
            String sbID = req.getParameter("sbID");
            String sbIDEdit = req.getParameter("sbIDEdit");
            String sbNameEdit = req.getParameter("sbNameEdit");
            String nbCrEdit = req.getParameter("nbCrEdit");
            String feeEdit = req.getParameter("feeEdit");
            String feeInterEdit = req.getParameter("feeInterEdit");
            Subjects s = new Subjects();
            s.updateSubject(sbID, sbIDEdit, sbNameEdit, nbCrEdit, feeEdit, feeInterEdit);
            ArrayList<Subjects> listS = s.getListSubjects();
            req.setAttribute("listS", listS);
        
            req.getRequestDispatcher("TuitionFeeAdmin.jsp").forward(req, resp);
            
        }
        
        if(req.getParameter("delete")!=null){
            String sbID = req.getParameter("sbID");
            Subjects s = new Subjects();
            s.deleteSubject(sbID);
            ArrayList<Subjects> listS = s.getListSubjects();
            req.setAttribute("listS", listS);
        
            req.getRequestDispatcher("TuitionFeeAdmin.jsp").forward(req, resp);
            
        }
        
        if(req.getParameter("add")!=null){
            String sbID = req.getParameter("sbIDAdd");
            String sbName = req.getParameter("sbNameAdd");
            String numberCre = req.getParameter("nbCrAdd");
            String fee = req.getParameter("feeAdd");
            String feeInter = req.getParameter("feeInterAdd");
            
            Subjects s = new Subjects();
            s.addSubject(sbID, sbName, numberCre, fee, feeInter);
            ArrayList<Subjects> listS = s.getListSubjects();
            req.setAttribute("listS", listS);
        
            req.getRequestDispatcher("TuitionFeeAdmin.jsp").forward(req, resp);
            
        }
        
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session.getAttribute("account") == null){
            req.getRequestDispatcher("index.html").forward(req, resp);
        }

        if(req.getParameter("update")!=null || req.getParameter("delete")!=null){
            req.getRequestDispatcher("UDTuitionFee.jsp").forward(req, resp);
        }
        
        if(req.getParameter("add")!=null){
            req.getRequestDispatcher("AddTuitionFee.jsp").forward(req, resp);
        }


        String role = (String) session.getAttribute("role");
        if(session.getAttribute("role").equals("Admin")){
            String acc = req.getParameter("acc");
            System.out.println(acc);
            Subjects s = new Subjects();
            ArrayList<Subjects> listS = s.getListSubjects();
            req.setAttribute("listS", listS);
        
            req.getRequestDispatcher("TuitionFeeAdmin.jsp").forward(req, resp);
        }
        
    }
    
}
