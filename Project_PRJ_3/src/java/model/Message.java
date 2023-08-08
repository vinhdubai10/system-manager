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
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Message {

    String appID, userID, type, purpose, dateCreate, response, dateResponse, status;

    public Message() {
        connect();
    }

    public Message(String appID, String userID, String type, String purpose, String dateCreate, String response, String dateResponse, String status) {
        this.appID = appID;
        this.userID = userID;
        this.type = type;
        this.purpose = purpose;
        this.dateCreate = dateCreate;
        this.response = response;
        this.dateResponse = dateResponse;
        this.status = status;
        connect();
    }

    public Message(String type, String purpose, String dateCreate, String response, String dateResponse, String status) {
        this.type = type;
        this.purpose = purpose;
        this.dateCreate = dateCreate;
        this.response = response;
        this.dateResponse = dateResponse;
        this.status = status;
        connect();
    }

    //tao cac tp xu ly DB
    Connection cnn;//ket noi db
    Statement stm;//Thuc hien cau lenh sql
    ResultSet rs;//Luu tru va xu ly du lieu
    PreparedStatement pstm;//Co the thuc hien giong stm

    private Message(String messID) {
        this.appID = messID;
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

    public String getAppID() {
        return appID;
    }

    public void setAppID(String appID) {
        this.appID = appID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getDateCreate() {
        if (dateCreate != null) {
            String[] Dob = dateCreate.split("-");
            return Dob[2] + "-" + Dob[1] + "-" + Dob[0];
        }
        return "";
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public String getDateResponse() {
        if (dateResponse != null) {
            String[] Dob = dateResponse.split("-");
            return Dob[2] + "-" + Dob[1] + "-" + Dob[0];
        }
        return "";
    }

    public void setDateResponse(String dateResponse) {
        this.dateResponse = dateResponse;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ArrayList<Message> getListMStudent(String stdID) {
        ArrayList<Message> list = new ArrayList<Message>();
        try {
            String strSelect = "select * from Message where UserID = ? "
                    + "order by DateCreate asc";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, stdID);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String type = rs.getString(3);
                String purpose = rs.getString(4);

                String dateC = rs.getString(5);
//                if(rs.getDate(5)!=null){
//                    dateC = f.format(rs.getDate(5));
//                }
                String response = rs.getString(6);
                String dateR = rs.getString(7);
                String status = rs.getString(8);
//                        "Approved";
//                if (rs.getInt(8) == 0) {
//                    status = "Rejected";
//                }
//                if (rs.getInt(8) == 2) {
//                    status = "Pending";
//                }
                Message m = new Message(type, purpose, dateC, response, dateR, status);
                list.add(m);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }

    public void addApplication(String stdID, String type, String purpose, String dateCreate) {
        try {
            String strInsert = "insert [Message](UserID, Type, Purpose, DateCreate) \n"
                    + "values (?, ?, ?, ?)";

            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, stdID);
            pstm.setString(2, type);
            pstm.setString(3, purpose);
            pstm.setString(4, dateCreate);

            pstm.executeUpdate();

        } catch (Exception e) {
            System.out.println("Insert application fail");
        }
    }

    public ArrayList<Message> getListMAdmin() {
        ArrayList<Message> list = new ArrayList<Message>();
        try {
            String strSelect = "select * from Message ";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {

                String appID = rs.getString(1);
                String userID = rs.getString(2);
                String type = rs.getString(3);
                String purpose = rs.getString(4);

                String dateC = rs.getString(5);
//                if(rs.getDate(5)!=null){
//                    dateC = f.format(rs.getDate(5));
//                }
                String response = rs.getString(6);
                String dateR = rs.getString(7);
                String status = rs.getString(8);
//                        "Approved";
//                if (rs.getInt(8) == 0) {
//                    status = "Rejected";
//                }
//                if (rs.getInt(8) == 2) {
//                    status = "Pending";
//                }
                Message m = new Message(appID, userID, type, purpose, dateC, response, dateR, status);
                list.add(m);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }

    public ArrayList<Message> getListResponseAdmin() {
        ArrayList<Message> list = new ArrayList<Message>();
        try {
            String strSelect = "select * from Message where Status = '2'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {

                String appID = rs.getString(1);
                String userID = rs.getString(2);
                String type = rs.getString(3);
                String purpose = rs.getString(4);

                String dateC = rs.getString(5);
//                if(rs.getDate(5)!=null){
//                    dateC = f.format(rs.getDate(5));
//                }
                String response = rs.getString(6);
                String dateR = rs.getString(7);
                String status = rs.getString(8);
//                        "Approved";
//                if (rs.getInt(8) == 0) {
//                    status = "Rejected";
//                }
//                if (rs.getInt(8) == 2) {
//                    status = "Pending";
//                }
                Message m = new Message(appID, userID, type, purpose, dateC, response, dateR, status);
                list.add(m);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }

    public ArrayList<Message> getListUserID() {
        ArrayList<Message> list = new ArrayList<Message>();
        try {
            String strSelect = "select MessageID from Message where Status = '2'";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {

                String messID = rs.getString(1);

                Message m = new Message(messID);
                list.add(m);

            }
        } catch (Exception e) {
            System.out.println("Get list messID error: " + e.getMessage());
        }

        return list;
    }

    public void responseApplication(String messID, String response, String dateR, String status) {
        try {
            String strUpdate = "update Message\n"
                    + "set Response = ?, DateResponse = ?, Status = ? \n"
                    + "where MessageID = ?";

            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, response);
            pstm.setString(2, dateR);
            pstm.setString(3, status);
            pstm.setString(4, messID);

            pstm.execute();

        } catch (Exception e) {
            System.out.println("Update message error" + e.getMessage());
        }
    }

}
