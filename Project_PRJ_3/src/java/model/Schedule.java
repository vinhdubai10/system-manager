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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

/**
 *
 * @author ADMIN
 */
public class Schedule {

    String level, date, subID, room, time, status, weekday;

    public Schedule() {
        connect();
    }

    public Schedule(String level, String date, String subID, String room, String time, String status, String weekday) {
        this.level = level;
        this.date = date;
        this.subID = subID;
        this.room = room;
        this.time = time;
        this.status = status;
        this.weekday = weekday;
        connect();
    }

    public Schedule(String level, String date, String subID, String room, String time, String status) {
        this.level = level;
        this.date = date;
        this.subID = subID;
        this.room = room;
        this.time = time;
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

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getDate() {
        String[] arr = date.split("-");
        return arr[2] +"-"+ arr[1] +"-"+ arr[0];
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSubID() {
        return subID;
    }

    public void setSubID(String subID) {
        this.subID = subID;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWeekday() {
        String[] date = this.date.split("-");
        Calendar cal = Calendar.getInstance();
        cal.set(Integer.parseInt(date[0]), Integer.parseInt(date[1]), Integer.parseInt(date[2]) - 3);
        DateFormat formatter = new SimpleDateFormat("EEEE", Locale.getDefault());
        return formatter.format(cal.getTime());
    }

    public void setWeekday(String weekday) {
        this.weekday = weekday;
    }

    public ArrayList<Schedule> getListSchedule(String userID, String from, String to) {
        ArrayList<Schedule> list = new ArrayList<Schedule>();
        try {
            String strSelect = "select s.Level, s.Date, c.SubjectID, s.Room, s.Time, a.Status\n"
                    + "from Slots s, Classes c, AttendDetail atd, Attend a\n"
                    + "where s.ClassID = c.ClassID and s.SlotID = atd.SlotID \n"
                    + "and atd.AttendID = a.AttendID and s.Date between ? and ?\n"
                    + "and s.StudentID = ?\n"
                    + "order by s.Date asc, s.Level asc";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, from);
            pstm.setString(2, to);
            pstm.setString(3, userID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String level = rs.getString(1);
                String date = rs.getString(2);
                String sbID = rs.getString(3);
                String room = rs.getString(4);
                String time = rs.getString(5);
                String status = rs.getString(6);
//                        "Attended";
//                if (rs.getInt(6) != 1) {
//                    if(rs.getInt(6) == 0){
//                        status = "Absent";
//                    }else{
//                        status = "Not yet";
//                    }
//                }
                
                Schedule sch = new Schedule(level, date, sbID, room, time, status);
                list.add(sch);

            }
        } catch (Exception e) {
            System.out.println("Get list schedule error: " + e.getMessage());
        }

        return list;
    }

}
