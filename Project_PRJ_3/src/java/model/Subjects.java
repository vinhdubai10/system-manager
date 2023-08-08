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
public class Subjects {

    String SubjectID, SubjectName, NumberCredits, Fee, FeeInternational;

    public Subjects() {
        connect();
    }

    public Subjects(String SubjectID, String SubjectName, String NumberCredits, String Fee, String FeeInternational) {
        this.SubjectID = SubjectID;
        this.SubjectName = SubjectName;
        this.NumberCredits = NumberCredits;
        this.Fee = Fee;
        this.FeeInternational = FeeInternational;
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

    public String getSubjectID() {
        return SubjectID;
    }

    public void setSubjectID(String SubjectID) {
        this.SubjectID = SubjectID;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String SubjectName) {
        this.SubjectName = SubjectName;
    }

    public String getNumberCredits() {
        return NumberCredits;
    }

    public void setNumberCredits(String NumberCredits) {
        this.NumberCredits = NumberCredits;
    }

    public String getFee() {
        return Fee;
    }

    public void setFee(String Fee) {
        this.Fee = Fee;
    }

    public String getFeeInternational() {
        return FeeInternational;
    }

    public void setFeeInternational(String FeeInternational) {
        this.FeeInternational = FeeInternational;
    }

    public ArrayList<Subjects> getListSubjects() {
        ArrayList<Subjects> list = new ArrayList<Subjects>();
        try {
            String strSelect = "select * from Subjects";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String sbID = rs.getString(1);
                String sbName = rs.getString(2);
                String numberCr = rs.getString(3);
                String fee = rs.getString(4);
                String feeInternational = rs.getString(5);

                Subjects s = new Subjects(sbID, sbName, numberCr, fee, feeInternational);

                list.add(s);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }

    public void updateSubject(String sbID, String sbIDEdit, String sbNameEdit, String nbCrEdit, String feeEdit, String feeInterEdit) {
        try {
            String strUpdate = "update Subjects\n"
                    + "set SubjectID = ?, SubjectName = ?, \n"
                    + "NumberCredits = ?, Fee = ?, FeeInternational = ?\n"
                    + "where SubjectID = ?";

            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, sbIDEdit);
            pstm.setString(2, sbNameEdit);
            pstm.setString(3, nbCrEdit);
            pstm.setString(4, feeEdit);
            pstm.setString(5, feeInterEdit);
            pstm.setString(6, sbID);
            pstm.execute();

        } catch (Exception e) {
            System.out.println("Update subject error" + e.getMessage());
        }
    }

    public void deleteSubject(String sbID) {
        try {
            String strDelete = "delete Subjects \n"
                    + "where SubjectID = ? ";

            pstm = cnn.prepareStatement(strDelete);
            pstm.setString(1, sbID);
            
            pstm.execute();

        } catch (Exception e) {
            System.out.println("Update subject error" + e.getMessage());
        }
    }

    public void addSubject(String sbID, String sbName, String numberCre, String fee, String feeInter) {
        try {
            String strInsert = "insert Subjects values (?, ?, ?, ?, ?)";

            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, sbID);
            pstm.setString(2, sbName);
            pstm.setString(3, numberCre);
            pstm.setString(4, fee);
            pstm.setString(5, feeInter);
            pstm.executeUpdate();

        } catch (Exception e) {

        }
    }

}
