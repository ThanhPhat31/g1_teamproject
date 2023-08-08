/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import controll.javaHelper.DateTimeHelper;
import java.sql.Date;

/**
 *
 * @author vusyl
 */
public class Account {

    private String ProfileID;
    private String FirstName;
    private String MiddleName;
    private String LastName;
    private String DoB;
    private Boolean Gender;
    private String Address;
    private String Mail;
    private String Phone;
    private String Account;
    private String Password;
    private String Role;
    private String Image;

    public Account() {
    }

    public Account(String ProfileID, String FirstName, String MiddleName, String LastName, String DoB, Boolean Gender, String Address, String Mail, String Phone, String Account, String Password, String Role, String Image) {
        this.ProfileID = ProfileID;
        this.FirstName = FirstName;
        this.MiddleName = MiddleName;
        this.LastName = LastName;
        this.DoB = DoB;
        this.Gender = Gender;
        this.Address = Address;
        this.Mail = Mail;
        this.Phone = Phone;
        this.Account = Account;
        this.Password = Password;
        this.Role = Role;
        this.Image = Image;
    }

    public Account(String Account, String Password) {
        this.Account = Account;
        this.Password = Password;
    }

    public String getProfileID() {
        return ProfileID;
    }

    public void setProfileID(String ProfileID) {
        this.ProfileID = ProfileID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getMiddleName() {
        return MiddleName;
    }

    public void setMiddleName(String MiddleName) {
        this.MiddleName = MiddleName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getDoB() {
        return DoB;
    }

    public String getFormatDoB() {
        return DateTimeHelper.formatDate(DoB);
    }

    public void setDoB(String DoB) {
        this.DoB = DoB;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String Mail) {
        this.Mail = Mail;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAccount() {
        return Account;
    }

    public void setAccount(String Account) {
        this.Account = Account;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getRole() {
        return Role;
    }

    public String getStrRole() {
        if(this.Role.equals("0")){
            return "Admin";
        }else if(this.Role.equals("1")){
            return "Doctor";
        }else if(this.Role.equals("2")){
            return "Staff";
        }else{
            return "Patient";
        }
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    public Boolean getGender() {
        return Gender;
    }

    public void setGender(Boolean Gender) {
        this.Gender = Gender;
    }

    public String getFullName() {
        return FirstName + " " + MiddleName + " " + LastName;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    @Override
    public String toString() {
        return "Account{" + "ProfileID=" + ProfileID + ", FirstName=" + FirstName + ", MiddleName=" + MiddleName + ", LastName=" + LastName + ", DoB=" + DoB + ", Gender=" + Gender + ", Address=" + Address + ", Mail=" + Mail + ", Phone=" + Phone + ", Account=" + Account + ", Password=" + Password + ", Role=" + Role + '}';
    }

}
