/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package controll.javaHelper;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

/**
 *
 * @author ThangDT
 */
public class DateTimeHelper {

    public static String getCurrentDay(){
        return LocalDate.now().toString();
    }
    
    public static String getCurrentTime(){
        return LocalTime.now().format(DateTimeFormatter.ofPattern("HH:mm")).toString();
    }
    
    public static String formatTime(String time){
        LocalTime result = LocalTime.parse(time);
        return result.format(DateTimeFormatter.ofPattern("HH:mm")).toString();
    }
    
    public static String formatDate(String date){
        LocalDate result = LocalDate.parse(date);
        return result.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")).toString();
    }
    
    public static void main(String[] args) {
        System.out.println(DateTimeHelper.formatDate("2023-02-20"));
    }
    
}
