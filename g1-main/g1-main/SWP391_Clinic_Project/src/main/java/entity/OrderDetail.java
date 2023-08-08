/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author buitr
 */
public class OrderDetail {

    private int orderdetailid;
    private String quantity;
    private double total;
    private int productid;
    private int orderid;

    public OrderDetail() {
    }

    public OrderDetail(int orderdetailid, String quantity, double total, int productid, int orderid) {
        this.orderdetailid = orderdetailid;
        this.quantity = quantity;
        this.total = total;
        this.productid = productid;
        this.orderid = orderid;
    }

    public int getOrderdetailid() {
        return orderdetailid;
    }

    public void setOrderdetailid(int orderdetailid) {
        this.orderdetailid = orderdetailid;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderdetailid=" + orderdetailid + ", quantity=" + quantity + ", total=" + total + ", productid=" + productid + ", orderid=" + orderid + '}';
    }

}
