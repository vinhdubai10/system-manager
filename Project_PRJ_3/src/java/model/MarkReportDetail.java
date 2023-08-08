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

/**
 *
 * @author ADMIN
 */
public class MarkReportDetail {
    String MarkReportID, AssessmentID, Score;

    public MarkReportDetail() {
        connect();
    }

    public MarkReportDetail(String MarkReportID, String AssessmentID, String Score) {
        this.MarkReportID = MarkReportID;
        this.AssessmentID = AssessmentID;
        this.Score = Score;
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

    public String getMarkReportID() {
        return MarkReportID;
    }

    public void setMarkReportID(String MarkReportID) {
        this.MarkReportID = MarkReportID;
    }

    public String getAssessmentID() {
        return AssessmentID;
    }

    public void setAssessmentID(String AssessmentID) {
        this.AssessmentID = AssessmentID;
    }

    public String getScore() {
        return Score;
    }

    public void setScore(String Score) {
        this.Score = Score;
    }
    
    
}
