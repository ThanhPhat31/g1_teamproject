/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import com.dao.CaseDAO;

/**
 *
 * @author ThangDT
 */
public class Designate extends DesignateList {

    private Case Case;
    private int status;
    private String description, result;

    public Designate(int CaseID, int designateID, String price, int status, String name, String description, String result) {
        super(designateID, name, price);
        CaseDAO cdao = new CaseDAO();
        this.Case = cdao.getCaseByID(CaseID);
        this.status = status;
        this.description = description;
        this.result = result;
    }

    public Case getCase() {
        return Case;
    }

    public void setCase(int CaseID) {
        CaseDAO cdao = new CaseDAO();
        this.Case = cdao.getCaseByID(CaseID);
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public String getStrStatus() {
        if (status == 0) {
            return "Finish";
        } else {
            return "Doing";
        }
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "Designate{" + "Case=" + Case + ", status=" + status + ", description=" + description + ", result=" + result + '}';
    }

}
