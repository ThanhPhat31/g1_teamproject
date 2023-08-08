/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author buitr
 */
public class Order {
    private int orderID;
    private int patientID;
    private String address;
   

    public Order() {
    }

    public Order(int orderID, int patientID, String address) {
        this.orderID = orderID;
        this.patientID = patientID;
        this.address = address;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getPatientID() {
        return patientID;
    }

    public void setPatientID(int patientID) {
        this.patientID = patientID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", patientID=" + patientID + ", address=" + address + '}';
    }

    

  
}
