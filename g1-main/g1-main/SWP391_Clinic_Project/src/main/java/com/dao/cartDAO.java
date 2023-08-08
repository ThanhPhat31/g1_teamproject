/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import entity.Order;
import entity.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author buitr
 */
public class cartDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ArrayList<Order> getAllOrders() {
        ArrayList<Order> list = new ArrayList<>();
        String query = "SELECT * FROM clinic.order";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public void insertOrderDetail(int pid, int quantity, int OrderID,
            double total) {
        String query = "insert into orderdetail(Quantity,Total,ProductID,OrderID) values(?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setDouble(2, total);
            ps.setInt(3, pid);
            ps.setInt(4, OrderID);

            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public void insertOrder(String profileid, String address) {
       
        String query = "INSERT INTO `clinic`.`order` (`PatientID`, `Address`) VALUES (?,?);";
        try {
            int id= Integer.parseInt(profileid);
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,id);
            ps.setString(2, address);
            ps.executeUpdate();
        } catch (Exception e) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public List<OrderDetail> getOrderDetailByOrderID(int OrderID) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from OrderDetail\n"
                + "where OrderID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, OrderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getInt(5))
                );
            }
        } catch (Exception e) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }

    public List<Order> getOrderByAccountID(int PatientID) {
        List<Order> list = new ArrayList<>();
        String query = "select * from Orders\n"
                + "where PatientID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, PatientID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3))
                );
            }
        } catch (Exception e) {
            Logger.getLogger(cartDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return list;
    }
}
