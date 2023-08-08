/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author vusyl
 */
public class Contact {

    int ContactID;
    String name, mail, phone, mess, date, time;
    int status;

    public Contact() {
    }

    public Contact(int ContactID, String name, String mail, String phone, String mess, String date, String time, int status) {
        this.ContactID = ContactID;
        this.name = name;
        this.mail = mail;
        this.phone = phone;
        this.mess = mess;
        this.date = date;
        this.time = time;
        this.status = status;
    }

    public int getContactID() {
        return ContactID;
    }

    public void setContactID(int ContactID) {
        this.ContactID = ContactID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getMess() {
        return mess;
    }

    public void setMess(String mess) {
        this.mess = mess;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Contact{" + "ContactID=" + ContactID + ", name=" + name + ", mail=" + mail + ", phone=" + phone + ", mess=" + mess + ", date=" + date + ", time=" + time + ", status=" + status + '}';
    }

}
