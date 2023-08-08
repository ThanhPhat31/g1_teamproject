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
public class BookingDoctor {

    private String iD, booking_date, booking_time, appointment_date, appointment_time;
    int status;
    private Patient patient;
    private Doctor doctor;

    public BookingDoctor() {
    }

    public BookingDoctor(String iD, String booking_date, String booking_time, String appointment_date, String appointment_time, int status, Patient patient, Doctor doctor) {
        this.iD = iD;
        this.booking_date = booking_date;
        this.booking_time = booking_time;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.status = status;
        this.patient = patient;
        this.doctor = doctor;
    }

    public String getStatus() {
        String result = "";
        switch (status) {
        
            case 3:
                result = "Cancel";
                break;
            case 0:
                result = "Booked";
                break;
             case 1:
                result = "Waiting";
                break;
              case 2:
                result = "Examinated";
                break;
            
        }
        return result;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getiD() {
        return iD;
    }

    public void setiD(String iD) {
        this.iD = iD;
    }

    public String getBooking_date() {
        return DateTimeHelper.formatDate(booking_date);
    }

    public void setBooking_date(String booking_date) {
        this.booking_date = booking_date;
    }

    public String getBooking_time() {
        return DateTimeHelper.formatTime(booking_time);
    }

    public void setBooking_time(String booking_time) {
        this.booking_time = booking_time;
    }

    public String getAppointment_date() {
        return DateTimeHelper.formatDate(appointment_date);
    }

    public void setAppointment_date(String appointment_date) {
        this.appointment_date = appointment_date;
    }

    public String getAppointment_time() {
        return DateTimeHelper.formatTime(appointment_time);
    }

    public void setAppointment_time(String appointment_time) {
        this.appointment_time = appointment_time;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    @Override
    public String toString() {
        return "BookingDoctor{" + "iD=" + iD + ", booking_date=" + booking_date + ", booking_time=" + booking_time + ", appointment_date=" + appointment_date + ", appointment_time=" + appointment_time + ", patient=" + patient + ", doctor=" + doctor + '}';
    }

}
