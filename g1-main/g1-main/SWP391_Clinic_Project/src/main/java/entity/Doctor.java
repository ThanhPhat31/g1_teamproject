/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ThangDT
 */
public class Doctor extends Account {

    private int doctorID;
    private String position;
    private String department;
    private int status;

    public Doctor() {
    }

    public Doctor(int doctorID, String position, String department, int status) {
        this.doctorID = doctorID;
        this.position = position;
        this.department = department;
        this.status = status;
    }

    public Doctor(int doctorID, Account acc, String position, String department, int status) {
        super(acc.getProfileID(), acc.getFirstName(), acc.getMiddleName(), acc.getLastName(), acc.getDoB(), acc.getGender(), acc.getAddress(), acc.getMail(), acc.getPhone(), acc.getAccount(), acc.getPassword(), acc.getRole(), acc.getImage());
        this.doctorID = doctorID;
        this.position = position;
        this.department = department;
        this.status = status;
    }

    public Doctor(String position, String ProfileID, String FirstName, String MiddleName, String LastName, String DoB, Boolean Gender, String Address, String Mail, String Phone, String Account, String Password, String Role, String Image) {
        super(ProfileID, FirstName, MiddleName, LastName, DoB, Gender, Address, Mail, Phone, Account, Password, Role, Image);
        this.position = position;
    }

    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getStatus() {
        String result = "";
        switch (status) {
            case 0:
                result = "Finished";
                break;
            case 1:
                result = "Waiting";
                break;
            case 2:
                result = "Assigning";
                break;
        }
        return result;
    }


public void setStatus(int status) {
        this.status = status;
    }

    
    
  
    @Override
public String toString() {
        return super.toString()+"Doctor{" + "doctorID=" + doctorID + ", position=" + position + ", department=" + department + ", status=" + status + '}';
    }
//    public static void main(String[] args) {
//        Account acc = new Account("1", "Thu", "Vinh", "Hung", "2022-12-12", Boolean.TRUE, "HN", "gmail.com", "098123123", "account", "password", "1");
//        Doctor d = new Doctor(0, acc, "bsi", "mat", 0);
//        System.out.println(d.+" "+d.getMiddleName()+" "+d.getLastName()+", "+d.getDoB());
//    }
    
}
