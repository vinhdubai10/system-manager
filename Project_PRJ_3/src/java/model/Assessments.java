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
public class Assessments {
    String AssessmentID, AssessmentName, Weight;

    public Assessments() {
        connect();
    }

    public Assessments(String AssessmentID, String AssessmentName, String Weight) {
        this.AssessmentID = AssessmentID;
        this.AssessmentName = AssessmentName;
        this.Weight = Weight;
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

    public String getAssessmentID() {
        return AssessmentID;
    }

    public void setAssessmentID(String AssessmentID) {
        this.AssessmentID = AssessmentID;
    }

    public String getAssessmentName() {
        return AssessmentName;
    }

    public void setAssessmentName(String AssessmentName) {
        this.AssessmentName = AssessmentName;
    }

    public String getWeight() {
        return Weight;
    }

    public void setWeight(String Weight) {
        this.Weight = Weight;
    }
    
    
    
}
