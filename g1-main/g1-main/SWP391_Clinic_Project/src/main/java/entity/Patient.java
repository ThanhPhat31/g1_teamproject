/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;

import java.util.List;

/**
 *
 * @author ThangDT
 */
public class Patient extends Account{
    private int patientID;
    private List<Case> list_case;

    public Patient() {
    }

 

    public Patient(int patientID, Account acc) {        
        super(acc.getProfileID(), acc.getFirstName(), acc.getMiddleName(), acc.getLastName(), acc.getDoB(), acc.getGender(), acc.getAddress(), acc.getMail(), acc.getPhone(), acc.getAccount(), acc.getPassword(), acc.getRole(), acc.getImage());
        this.patientID = patientID;
    }

    public Patient(int patientID, Account acc, List<Case> list_case) {
        super(acc.getProfileID(), acc.getFirstName(), acc.getMiddleName(), acc.getLastName(), acc.getDoB(), acc.getGender(), acc.getAddress(), acc.getMail(), acc.getPhone(), acc.getAccount(), acc.getPassword(), acc.getRole(), acc.getImage());
        this.patientID = patientID;
        this.list_case = list_case;
    }

    
    
    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public List<Case> getList_case() {
        return list_case;
    }

    public void setList_case(List<Case> list_case) {
        this.list_case = list_case;
    }

    @Override
    public String toString() {
        return super.toString()+ "Patient{" + "patientID=" + patientID + ", list_case=" + list_case + '}';
    }

    
    
}
