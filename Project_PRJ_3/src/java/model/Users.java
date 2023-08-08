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
public class Users {

    String UserID, Name, Gender, Email, PassWord, DateOfBirth, NumberPhone, Role, ProgrammingID, Status;

    //tao cac tp xu ly DB
    Connection cnn;//ket noi db
    Statement stm;//Thuc hien cau lenh sql
    ResultSet rs;//Luu tru va xu ly du lieu
    PreparedStatement pstm;//Co the thuc hien giong stm

    public Users(String email, String pass) {
        this.Email = email;
        this.PassWord = pass;
        connect();
    }

    private Users(String userID, String userName, String gender, String email, String dob, String numberPhone, String role) {
        this.UserID = userID;
        this.Name = userName;
        this.Gender = gender;
        this.Email = email;
        this.DateOfBirth = dob;
        this.NumberPhone = numberPhone;
        this.Role = role;
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

    public Users() {
        connect();
    }

    public Users(String UserID, String Name, String Gender, String Email, String PassWord, String DateOfBirth, String NumberPhone, String Role, String ProgrammingID, String Status) {
        this.UserID = UserID;
        this.Name = Name;
        this.Gender = Gender;
        this.Email = Email;
        this.PassWord = PassWord;
        this.DateOfBirth = DateOfBirth;
        this.NumberPhone = NumberPhone;
        this.Role = Role;
        this.ProgrammingID = ProgrammingID;
        this.Status = Status;
        connect();
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPassWord() {
        return PassWord;
    }

    public void setPassWord(String PassWord) {
        this.PassWord = PassWord;
    }

    public String getDateOfBirth() {
        if (DateOfBirth != null) {
            String[] Dob = DateOfBirth.split("-");
            return Dob[2] + "-" + Dob[1] + "-" + Dob[0];
        }
        return "";
    }

    public void setDateOfBirth(String DateOfBirth) {
        this.DateOfBirth = DateOfBirth;
    }

    public String getNumberPhone() {
        return NumberPhone;
    }

    public void setNumberPhone(String NumberPhone) {
        this.NumberPhone = NumberPhone;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    public String getProgrammingID() {
        return ProgrammingID;
    }

    public void setProgrammingID(String ProgrammingID) {
        this.ProgrammingID = ProgrammingID;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public boolean checkLogin(String email, String pass) {
        try {
            String strSelect = "select * from Users "
                    + "where Email = ? and "
                    + "PassWord = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, email);
            pstm.setString(2, pass);

            rs = pstm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Login error" + e.getMessage());
        }
        return false;
    }

    public Users getUserByID(String acc) {
        try {
            String strSelect = "select * from Users"
                    + " where Email = ?";
            pstm = cnn.prepareStatement(strSelect);
            pstm.setString(1, acc);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString(1);
                String userName = rs.getString(2);
                String gender = "Male";
                if (rs.getInt(3) != 1) {
                    gender = "Female";
                }
                String email = rs.getString(4) + "@fpt.edu.vn";
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/YYYY");
                String dob = "";
                if (rs.getDate(6) != null) {
                    dob = f.format(rs.getDate(6));
                }
                String numberPhone = rs.getString(7);
                String role = rs.getString(8);
                return new Users(userID, userName, gender, email, dob, numberPhone, role);
            }
        } catch (Exception e) {
            System.out.println("Get list user error: " + e.getMessage());
        }

        return null;
    }

    public void updateProfile(String dob, String numberPhone, String email) {
        try {
            String strUpdate = "update Users\n"
                    + "set DateOfBirth = ?, NumberPhone = ?\n"
                    + "where Email = ?";

            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, dob);
            pstm.setString(2, numberPhone);
            pstm.setString(3, email);
            pstm.execute();

        } catch (Exception e) {
            System.out.println("Update profile error" + e.getMessage());
        }
    }

    public ArrayList<Users> getListUsers() {
        ArrayList<Users> list = new ArrayList<Users>();
        try {
            String strSelect = "select * from Users";
            pstm = cnn.prepareStatement(strSelect);
            rs = pstm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString(1);
                String userName = rs.getString(2);
                String gender = "Male";
                if (rs.getInt(3) != 1) {
                    gender = "Female";
                }
                String email = rs.getString(4) + "@fpt.edu.vn";
                String pass = rs.getString(5);
                String dob = rs.getString(6);
                String numberPhone = rs.getString(7);
                String role = rs.getString(8);
                String programming = rs.getString(9);
                String status = "Active";
                if (rs.getInt(10) != 1) {
                    gender = "Non active";
                }

                Users u = new Users(userID, userName, gender, email, pass, dob, numberPhone, role, programming, status);

                list.add(u);

            }
        } catch (Exception e) {
            System.out.println("Get list subjects error: " + e.getMessage());
        }

        return list;
    }

    public void updateUsers(String userID, String userIDEdit, String userNameEdit, String genderEdit, String emailEdit, String passEdit, String dobEdit, String numberPhoneEdit, String roleEdit, String programmingEdit, String statusEdit) {
        try {
            String strUpdate = "update Users\n"
                    + "set UserID = ?, Name = ?, Gender = ?, Email = ?, PassWord = ?, DateOfBirth = ?, \n"
                    + "NumberPhone = ?, Role = ?, ProgrammingID = ?, Status = ?\n"
                    + "where UserID = ?";

            pstm = cnn.prepareStatement(strUpdate);
            pstm.setString(1, userIDEdit);
            pstm.setString(2, userNameEdit);
            pstm.setString(3, genderEdit);
            pstm.setString(4, emailEdit);
            pstm.setString(5, passEdit);
            pstm.setString(6, dobEdit);
            pstm.setString(7, numberPhoneEdit);
            pstm.setString(8, roleEdit);
            pstm.setString(9, programmingEdit);
            pstm.setString(10, statusEdit);
            pstm.setString(11, userID);
            pstm.execute();

        } catch (Exception e) {
            System.out.println("Update user error" + e.getMessage());
        }
    }

    public void insertUser(String userIDAdd, String userNameAdd, String genderAdd, String emailAdd, String passAdd, String dobAdd, String numberPhoneAdd, String roleAdd, String programmingAdd, String statusAdd) {
        try {
            String strInsert = "insert Users values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstm = cnn.prepareStatement(strInsert);
            pstm.setString(1, userIDAdd);
            pstm.setString(2, userNameAdd);
            pstm.setString(3, genderAdd);
            pstm.setString(4, emailAdd);
            pstm.setString(5, passAdd);
            pstm.setString(6, dobAdd);
            pstm.setString(7, numberPhoneAdd);
            pstm.setString(8, roleAdd);
            pstm.setString(9, programmingAdd);
            pstm.setString(10, statusAdd);
            pstm.executeUpdate();

        } catch (Exception e) {

        }
    }

}
