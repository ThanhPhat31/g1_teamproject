/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author buitr
 */
public class normalprioritypatientlist {
    
    private int id;
    private String firstName;
    private String middleName;
    private String lastName;
    private String Dob;
    private String gender;
    private String Address;
    private String mail;
    private String phone;
    private String date;
    private String time;
    private String description;
    private String result;

    public normalprioritypatientlist() {
    }

    public normalprioritypatientlist(int id, String firstName, String middleName, String lastName, String Dob, String gender, String Address, String mail, String phone, String date, String time, String description, String result) {
        this.id = id;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.Dob = Dob;
        this.gender = gender;
        this.Address = Address;
        this.mail = mail;
        this.phone = phone;
        this.date = date;
        this.time = time;
        this.description = description;
        this.result = result;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getDob() {
        return Dob;
    }

    public void setDob(String Dob) {
        this.Dob = Dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    @Override
    public String toString() {
        return "normalprioritypatientlist{" + "id=" + id + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName=" + lastName + ", Dob=" + Dob + ", gender=" + gender + ", Address=" + Address + ", mail=" + mail + ", phone=" + phone + ", date=" + date + ", time=" + time + ", description=" + description + ", result=" + result + '}';
    }

    
}
