/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;

import com.dao.CaseDAO;
import controll.javaHelper.DateTimeHelper;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ThangDT
 */
public class Case {
    
    private int caseID;
    private String date;
    private String time;
    private int status;
    private String description;
    private String result;
    private Doctor doctor;
    private Patient patient;
    private List<Medicine> prescription;
    private List<Designate> designate;

    public Case() {
    }

    public Case(int caseID, String date, int status, String description, String result, int doctorID, int patientID, List<Medicine> prescription, List<Designate> designate) {
        CaseDAO cDao = new CaseDAO();
        this.caseID = caseID;
        this.date = date;
        this.status = status;
        this.description = description;
        this.result = result;
        this.doctor = cDao.getDoctorInfo(doctorID);
        this.patient = cDao.getPatientInfo(patientID);
        this.prescription = prescription;
        this.designate = designate;
    }

    public Case(int caseID, String date, String time, int status, String description, String result, int doctorID, int patientID) {
        CaseDAO cDao = new CaseDAO();
        this.caseID = caseID;
        this.date = date;
        this.time = time;
        this.status = status;
        this.description = description;
        this.result = result;
        this.doctor = cDao.getDoctorInfo(doctorID);
        this.patient = cDao.getPatientInfo(patientID);
    }
    
    public int getCaseID() {
        return caseID;
    }

    public void setCaseID(int caseID) {
        this.caseID = caseID;
    }

    public String getDate() {
        return DateTimeHelper.formatDate(date);
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return DateTimeHelper.formatTime(time);
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getStatus() {
        String result = "" ;
        switch(status){
            case 0: result = "Finished"; break;
            case 1: result = "Doing"; break;
            case 2: result = "Assigning"; break;
        }
        return result;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
    
    public List<Medicine> getPrescription() {
        return prescription;
    }

    public void setPrescription(List<Medicine> prescription) {
        this.prescription = prescription;
    }

    public List<Designate> getDesignate() {
        return designate;
    }

    public void setDesignate(List<Designate> designate) {
        this.designate = designate;
    }

    @Override
    public String toString() {
        return "Case{" + "caseID=" + caseID + ", date=" + date + ", status=" + status + ", description=" + description + ", result=" + result + ", doctorID=" + doctor + ", patientID=" + patient + ", prescription=" + prescription + ", designate=" + designate + '}';
    }       
    
}
