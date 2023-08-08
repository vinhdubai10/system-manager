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
public class AttendDetail {
    String AttendDetailID, AttendID, SlotID;

    public AttendDetail() {
        connect();
    }

    public AttendDetail(String AttendDetailID, String AttendID, String SlotID) {
        this.AttendDetailID = AttendDetailID;
        this.AttendID = AttendID;
        this.SlotID = SlotID;
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

    public String getAttendDetailID() {
        return AttendDetailID;
    }

    public void setAttendDetailID(String AttendDetailID) {
        this.AttendDetailID = AttendDetailID;
    }

    public String getAttendID() {
        return AttendID;
    }

    public void setAttendID(String AttendID) {
        this.AttendID = AttendID;
    }

    public String getSlotID() {
        return SlotID;
    }

    public void setSlotID(String SlotID) {
        this.SlotID = SlotID;
    }
    
    
    
}
