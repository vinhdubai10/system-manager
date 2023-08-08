/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

/**
 *
 * @author ADMIN
 */
public class Week {

    String day;

    public Week() {
    }

    public Week(String day) {
        this.day = day;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getWeekday() {
        String[] dateWeek = this.day.split("-");
        int year = 2022, month = 10, day1 = 3;

        year = Integer.parseInt(dateWeek[2]);
        month = Integer.parseInt(dateWeek[1]);
        day1 = Integer.parseInt(dateWeek[0]);
        LocalDate date = LocalDate.of(year, month, day1);
        DayOfWeek day2 = date.getDayOfWeek();
        return day2.getDisplayName(TextStyle.FULL, Locale.getDefault());
//        LocalDate date = LocalDate.of(2022, 10, 3);
//        DayOfWeek day2 = date.getDayOfWeek();
//        return day2.getDisplayName(TextStyle.FULL, Locale.getDefault());
    }

    public ArrayList<Week> getListWeek(String from, String to) {
        ArrayList<Week> listW = new ArrayList<Week>();
        String[] listF = from.split("-");
        String[] listT = to.split("-");
        for (int i = Integer.parseInt(listF[2]); i <= Integer.parseInt(listT[2]); i++) {
            if (i >= 1 || i <= 9) {
                String day = "0" + i + "-" + listF[1] + "-" + listF[0];
//                String day = listF[0]+ "-" + listF[1] + "-" + "0"+i ;
                Week w = new Week(day);
                listW.add(w);
            } else {
                String day =  i + "-" + listF[1] + "-" + listF[0];

//                String day = listF[0]+ "-" + listF[1] + "-" +i ;
                Week w = new Week(day);
                listW.add(w);
            }

        }

        return listW;
    }

}
