/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import entity.DesignateList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vusyl
 */
public class designateListDAO {
    
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
//    public String formatPrice(int p){
//        String price = String.valueOf(p);
//        int size = price.length();
//        price = reverseString(price);
//        int count = 0;
//        String rs = "";
//        for (int i = 0; i < size; i++) {
//            if(count > 2) count=0;
//            if(count == 2) rs += ",";
//            else rs += price.charAt(i);
//        }
//        return reverseString(rs);
//    }
//    
//    public String reverseString(String s){
//        String rs = "";
//        int size = s.length();
//        for(int i = size -1; i >= 0; i--) rs += s.charAt(i);
//        return rs;
//    }
    public List<DesignateList> getDesignateList() {
        List<DesignateList> list = new ArrayList<>();
        String query = "SELECT DesignateID,Name, format(price, 0 )  FROM designate ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new DesignateList(rs.getInt(1), rs.getString(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
        return list;
    }
    
    public void addDesignateList(String name, String price) {
        String query = "insert into designate values (0,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            
            ps.setString(1, name);
            ps.setString(2, price);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("loi add");
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
    }
    
    public void upadteDesignate(String Name, String Price, String DesignateID) {
        String query = "update designate  set Name = ? ,Price = ?\n"
                + "               where  DesignateID = ?  ";
        try {
            
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Name);
            ps.setString(2, Price);
            ps.setString(3, DesignateID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("");
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
    }
    
    public void deleteDesignate(String designateID) {
        try {
            String query = "DELETE FROM `designate` WHERE (`DesignateID` = ?);";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, designateID);
            ps.executeUpdate(); // kh tra ve cai gi het
        } catch (Exception e) {
            System.out.println("loi delet" + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
        
    }
    
    public DesignateList getDesignateListByDesignateID(String id) {
        String query = "SELECT * FROM designate where DesignateID = ?;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery(); // co tra ve bang gi do
            while (rs.next()) {
                return (new DesignateList(rs.getInt(1), rs.getString(2),
                        rs.getString(3)
                ));
            }
        } catch (Exception e) {
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    public static void main(String[] args) {
        designateListDAO ds = new designateListDAO();
        System.out.println(ds.getDesignateListByDesignateID("1"));
    }
    
}
