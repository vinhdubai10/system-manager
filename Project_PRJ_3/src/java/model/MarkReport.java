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
public class MarkReport {
    String MarkReportID, UserID, ClassID, TotalMark, StatusResult;

    public MarkReport() {
        connect();
    }

    public MarkReport(String MarkReportID, String UserID, String ClassID, String TotalMark, String StatusResult) {
        this.MarkReportID = MarkReportID;
        this.UserID = UserID;
        this.ClassID = ClassID;
        this.TotalMark = TotalMark;
        this.StatusResult = StatusResult;
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

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getClassID() {
        return ClassID;
    }

    public void setClassID(String ClassID) {
        this.ClassID = ClassID;
    }

    public String getTotalMark() {
        return TotalMark;
    }

    public void setTotalMark(String TotalMark) {
        this.TotalMark = TotalMark;
    }

    public String getStatusResult() {
        return StatusResult;
    }

    public void setStatusResult(String StatusResult) {
        this.StatusResult = StatusResult;
    }
    
    
    
}
