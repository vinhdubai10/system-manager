/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import context.DBContext1;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class MarkReportModel {

    String className, sbID, sbName, instructorID, semester, totalMark, status;

    public MarkReportModel() {
        connect();
    }

    public MarkReportModel(String className, String sbID, String sbName, String instructorID, String semester, String totalMark, String status) {
        this.className = className;
        this.sbID = sbID;
        this.sbName = sbName;
        this.instructorID = instructorID;
        this.semester = semester;
        this.totalMark = totalMark;
        this.status = status;
        connect();
    }
    //tao cac tp xu ly DB
    Connection cnn;//ket noi db
    Statement stm;//Thuc hien cau lenh sql
    ResultSet rs;//Luu tru va xu ly du lieu
    PreparedStatement pstm;//Co the thuc hien giong stm

    private void connect() {
        try {
            //Su dung DBContext1
            cnn = (new DBContext1()).getConnection();
            System.out.println("Connect success");
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getSbID() {
        return sbID;
    }

    public void setSbID(String sbID) {
        this.sbID = sbID;
    }

    public String getSbName() {
        return sbName;
    }

    public void setSbName(String sbName) {
        this.sbName = sbName;
    }

    public String getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(String instructorID) {
        this.instructorID = instructorID;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getTotalMark() {
        return totalMark;
    }

    public void setTotalMark(String totalMark) {
        this.totalMark = totalMark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    

    public ArrayList<MarkReportModel> getListMarkReportBySemester(String acc, String semester) {
        ArrayList<MarkReportModel> list = new ArrayList<MarkReportModel>();
        try {
            String strSelect = "select c.ClassName, s.SubjectID, s.SubjectName, c.InstructorID, pls.Semester, mr.TotalMark, mr.StatusResult\n"
                    + "from MarkReport mr, Classes c, Subjects s, ProgrammingLinkSubjects pls\n"
                    + "where mr.ClassID = c.ClassID and s.SubjectID = c.SubjectID \n"
                    + "and pls.SubjectID = s.SubjectID and mr.UserID = ? and pls.Semester = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, acc);
            pstm.setString(2, semester);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String className = rs.getString(1);
                String sbID = rs.getString(2);
                String sbName = rs.getString(3);
                String instructorID = rs.getString(4);
                String semes = rs.getString(5);
                String totalMark = rs.getString(6);
                String status = rs.getString(7);
//                        "Passed";
//                if(rs.getInt(7)!=1){
//                    status = "Not pass";
//                }
                MarkReportModel mr = new MarkReportModel(className, sbID, sbName, instructorID, semes, totalMark, status);
                list.add(mr);

            }
        } catch (Exception e) {
            System.out.println("Get list mark report error: " + e.getMessage());
        }

        return list;
    }
    
    
}
