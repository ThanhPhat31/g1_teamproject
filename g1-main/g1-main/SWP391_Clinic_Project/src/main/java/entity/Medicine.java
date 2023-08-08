/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import com.dao.CaseDAO;

/**
 *
 * @author vusyl
 */
public class Medicine extends MedicineList{

    private Case Case;
    private int Quantity = 1;

    public Medicine(int CaseID, int MedicineID, String Name, String Description, int Price) {
        super(MedicineID, Name, Description, Price);
        CaseDAO cdao = new CaseDAO();
        this.Case = cdao.getCaseByID(CaseID);        
    }

    public Medicine(int CaseID, int MedicineID, String Name, String Description, int Quantity, int Price) {
        super(MedicineID, Name, Description, Price);
        CaseDAO cdao = new CaseDAO();
        this.Case = cdao.getCaseByID(CaseID);    
        this.Quantity = Quantity;
    }
    
    public Case getCase() {
        return Case;
    }

    public void setCase(int CaseID) {
        CaseDAO cdao = new CaseDAO();
        this.Case = cdao.getCaseByID(CaseID);   
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    @Override
    public String toString() {
        return "Medicine{"+ super.toString() + "CaseID=" + Case + ", Quantity=" + Quantity + '}';
    }

}
