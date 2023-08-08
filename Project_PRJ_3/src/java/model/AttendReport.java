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
public class AttendReport {

    String subID, absentDay, absentRate;

    public AttendReport() {
        connect();
    }

    public AttendReport(String subID, String absentDay, String absentRate) {
        this.subID = subID;
        this.absentDay = absentDay;
        this.absentRate = absentRate;
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

    public String getSubID() {
        return subID;
    }

    public void setSubID(String subID) {
        this.subID = subID;
    }

    public String getAbsentDay() {
        return absentDay;
    }

    public void setAbsentDay(String absentDay) {
        this.absentDay = absentDay;
    }

    public String getAbsentRate() {
        return absentRate;
    }

    public void setAbsentRate(String absentRate) {
        this.absentRate = absentRate;
    }

    public ArrayList<AttendReport> getListAttendReport(String stdID) {
        ArrayList<AttendReport> list = new ArrayList<AttendReport>();
        try {
            String strSelect = "select c.SubjectID, 5-count(a.Status) as countAbsent\n"
                    + "from Slots s, Classes c, AttendDetail atd, Attend a\n"
                    + "where s.ClassID = c.ClassID and s.SlotID = atd.SlotID \n"
                    + "and atd.AttendID = a.AttendID \n"
                    + "and s.StudentID = ?\n"
                    + "and a.Status = ?\n"
                    + "group by c.SubjectID";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, stdID);
            pstm.setString(2, "1");
            
            rs = pstm.executeQuery();
            while (rs.next()) {
                String subID = rs.getString(1);
                String absentDay = "";
                String absentRate = "";
                if("PRJ301".equals(subID)){
                    absentDay = rs.getString(2)+"/29";
                    double abR = rs.getDouble(2)/29*100;
                    abR = (double) Math.round(abR * 10) / 10;
                    System.out.println(abR);
                    absentRate = abR+"%";
                }else{
                    absentDay = rs.getString(2)+"/30";
                    double abR = rs.getDouble(2)/30*100;
                    abR = (double) Math.round(abR * 10) / 10;
                    System.out.println(abR);
                    absentRate = abR+"%";
                }

                AttendReport atr = new AttendReport(subID, absentDay, absentRate);
                list.add(atr);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }

}
