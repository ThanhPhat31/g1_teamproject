/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import entity.Designate;
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
public class designateDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<DesignateList> getDesignateList(){
        List<DesignateList> list = new ArrayList<>();
        String query = "SELECT * FROM designate";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql              
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new DesignateList(rs.getInt(1), 
                        rs.getString(2),
                        rs.getString(3))
                );
            }
        } catch (Exception e) {
            System.out.println(e);
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
    
    public List<Designate> getDesignate() {
        List<Designate> list = new ArrayList<>();
        String query = "select  CaseID,designate_list.DesignateID,Status,designate.Price,designate.Name, Description,Result \n"
                + "    from designate_list left outer join designate on designate_list.DesignateID = designate.DesignateID \n"
                + "    Where Status = 1";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql

            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Designate(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getInt(4), rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
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

    public List<Designate> getListDesignateByCaseID(int caseID) {
        List<Designate> list = new ArrayList<>();
        String query = "select  CaseID,designate_list.DesignateID,designate.Price,Status,designate.Name, Description,Result \n"
                + "	from designate_list left outer join designate on designate_list.DesignateID = designate.DesignateID \n"
                + "		WHERE CaseID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, caseID);

            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Designate(rs.getInt("CaseID"), rs.getInt("DesignateID"),
                        rs.getString("Price"),
                        rs.getInt("Status"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Result"))
                );

            }
        } catch (Exception e) {
            System.out.println(e);
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
    
    public List<Designate> getListDesignateFinish(int caseID) {
        List<Designate> list = new ArrayList<>();
        String query = "select  CaseID,designate_list.DesignateID,designate.Price,Status,designate.Name, Description,Result \n"
                + "	from designate_list left outer join designate on designate_list.DesignateID = designate.DesignateID \n"
                + "		WHERE CaseID = ? and Status = 1";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, caseID);

            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Designate(rs.getInt("CaseID"), rs.getInt("DesignateID"),
                        rs.getString("Price"),
                        rs.getInt("Status"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Result"))
                );

            }
        } catch (Exception e) {
            System.out.println(e);
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

    public List<Designate> getListDesignateByCaseIDandPatient(int caseID, int patientID) {
        List<Designate> list = new ArrayList<>();
        String query = "select  CaseID,designate_list.DesignateID,designate.Price,Status,designate.Name, Description,Result \n"
                + "	from designate_list left outer join designate on designate_list.DesignateID = designate.DesignateID \n"
                + "		WHERE CaseID = ? and designate_list.DesignateID= ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, caseID);
            ps.setInt(2, patientID);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Designate(rs.getInt("CaseID"), rs.getInt("DesignateID"),
                        rs.getString("Price"),
                        rs.getInt("Status"),
                        rs.getString("Name"),
                        rs.getString("Description"),
                        rs.getString("Result"))
                );

            }
        } catch (Exception e) {
            System.out.println(e);
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

    public static void main(String[] args) {
        designateDAO ds = new designateDAO();
        System.out.println(ds.checkSelectDesignate(6, 1));
    }

    public void addNewDesignate(int CaseID, int DesignateID) {
        String query = "INSERT INTO `designate_list` (`CaseID`, `DesignateID`, `Result`, `Status`) VALUES (?, ?, '', '1');";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, CaseID);
            ps.setInt(2, DesignateID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
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

    public void upadteDesignate(String Description, String Result, int CaseID, int DesignateID) {
        String query = "update designate_list  set Description = ? ,Result = ?  ,Status  = 0\n"
                + "               where CaseID = ? and DesignateID = ?  ";
        try {

            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Description);
            ps.setString(2, Result);
            ps.setInt(3, CaseID);
            ps.setInt(4, DesignateID);
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

    public void deleteDesignate(int CaseID, int designateID) {
        try {
            String query = "Delete from designate_list\n"
                    + "where CaseID = ? and DesignateID = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, CaseID);
            ps.setInt(2, designateID);
            ps.executeUpdate(); // kh tra ve cai gi het
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

    }

    public boolean isDesignateFinish(int caseID) {
        List<Designate> list = this.getListDesignateFinish(caseID);    
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getStatus() == 1) {
                    return false;
                }
            }
        } else {
            return true;
        }
        return true;
    }

    public boolean checkSelectDesignate(int caseID, int deID){
        List<Designate> list = this.getListDesignateFinish(caseID);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getDesignateID() == deID) {
                    return false;
                }
            }
        } else {
            return true;
        }
        return true;
    }
    
}
