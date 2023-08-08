/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package entity;

/**
 *
 * @author ThangDT
 */
public class MedicineList {
    private int MedicineID;
    private String Name;
    private String Description;
    private int Price;

    public MedicineList(int MedicineID, String Name, String Description, int Price) {
        this.MedicineID = MedicineID;
        this.Name = Name;
        this.Description = Description;
        this.Price = Price;
    }

    public int getMedicineID() {
        return MedicineID;
    }

    public void setMedicineID(int MedicineID) {
        this.MedicineID = MedicineID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    @Override
    public String toString() {
        return "MedicineList{" + "MedicineID=" + MedicineID + ", Name=" + Name + ", Description=" + Description + ", Price=" + Price + '}';
    }
}
