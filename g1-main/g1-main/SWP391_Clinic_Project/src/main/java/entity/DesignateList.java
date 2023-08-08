/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author ThangDT
 */
public class DesignateList {

    private int designateID;
    private String name;
    private String price;

    public DesignateList() {
    }

    public DesignateList(int designateID, String name, String price) {
        this.designateID = designateID;
        this.name = name;
        this.price = price;
    }

 

    public int getDesignateID() {
        return designateID;
    }

    public void setDesignateID(int designateID) {
        this.designateID = designateID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }


    @Override
    public String toString() {
        return "DesignateList{" + "designateID=" + designateID + ", price=" + price + ", name=" + name + '}';
    }

}
