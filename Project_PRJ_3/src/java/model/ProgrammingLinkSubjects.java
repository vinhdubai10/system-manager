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
public class ProgrammingLinkSubjects {

    String ProgrammingID, SubjectID, Semester;

    public ProgrammingLinkSubjects() {
        connect();
    }

    public ProgrammingLinkSubjects(String ProgrammingID, String SubjectID, String Semester) {
        this.ProgrammingID = ProgrammingID;
        this.SubjectID = SubjectID;
        this.Semester = Semester;
        connect();
    }

    //tao cac tp xu ly DB
    Connection cnn;//ket noi db
    Statement stm;//Thuc hien cau lenh sql
    ResultSet rs;//Luu tru va xu ly du lieu
    PreparedStatement pstm;//Co the thuc hien giong stm

    private ProgrammingLinkSubjects(String semester) {
        this.Semester = semester;
        connect();
    }

    private void connect() {
        try {
            //Su dung DBContext1
            cnn = (new DBContext1()).getConnection();
            System.out.println("Connect success");
        } catch (Exception e) {
            System.out.println("Connect error:" + e.getMessage());
        }
    }

    public String getProgrammingID() {
        return ProgrammingID;
    }

    public void setProgrammingID(String ProgrammingID) {
        this.ProgrammingID = ProgrammingID;
    }

    public String getSubjectID() {
        return SubjectID;
    }

    public void setSubjectID(String SubjectID) {
        this.SubjectID = SubjectID;
    }

    public String getSemester() {
        return Semester;
    }

    public void setSemester(String Semester) {
        this.Semester = Semester;
    }

    public ArrayList<ProgrammingLinkSubjects> getListSemester() {
        ArrayList<ProgrammingLinkSubjects> list = new ArrayList<ProgrammingLinkSubjects>();
        try {
            String strSelect = "select distinct Semester\n"
                    + "from ProgrammingLinkSubjects";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String semester = rs.getString(1);
                ProgrammingLinkSubjects pls = new ProgrammingLinkSubjects(semester);
                list.add(pls);

            }
        } catch (Exception e) {
            System.out.println("Get list semester error: " + e.getMessage());
        }

        return list;
    }

}
