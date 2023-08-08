/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import controll.javaHelper.DateTimeHelper;

/**
 *
 * @author vusyl
 */
public class normalBook {

    private String iD, date, time ,status;
    private Patient patient;

    public normalBook() {
    }

    public normalBook(String iD, String date, String time, Patient patientID,String status ) {
        this.iD = iD;
        this.date = date;
        this.time = time;
        this.patient = patientID;
        this.status = status;
        
    }

    public String getiD() {
        return iD;
    }

    public void setiD(String iD) {
        this.iD = iD;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
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

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    @Override
    public String toString() {
        return "normalBook{" + "iD=" + iD + ", date=" + date + ", time=" + time + ", status=" + status + ", patient=" + patient + '}';
    }

   
   
}
