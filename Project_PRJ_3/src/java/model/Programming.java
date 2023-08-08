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
public class Programming {
    String ProgrammingID, ProgrammingName;
    
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

    public Programming() {
        connect();
    }

    public Programming(String ProgrammingID, String ProgrammingName) {
        this.ProgrammingID = ProgrammingID;
        this.ProgrammingName = ProgrammingName;
        connect();
    }

    public String getProgrammingID() {
        return ProgrammingID;
    }

    public void setProgrammingID(String ProgrammingID) {
        this.ProgrammingID = ProgrammingID;
    }

    public String getProgrammingName() {
        return ProgrammingName;
    }

    public void setProgrammingName(String ProgrammingName) {
        this.ProgrammingName = ProgrammingName;
    }

    public ArrayList<Programming> getListProgramming() {
        ArrayList<Programming> list = new ArrayList<Programming>();
        try {
            String strSelect = "select * from Programming";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String proID = rs.getString(1);
                String proName = rs.getString(2);
                
                Programming p = new Programming(proID, proName);
                list.add(p);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }
    
    
    
    
    
    
    
}
