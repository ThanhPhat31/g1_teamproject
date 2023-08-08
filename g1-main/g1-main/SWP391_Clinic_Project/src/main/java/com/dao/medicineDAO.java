/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import entity.Designate;
import entity.Medicine;
import entity.MedicineList;
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
public class medicineDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<Medicine> getMedicine() {
        List<Medicine> list = new ArrayList<>();
        String query = "select prescription.medicineID , prescription.CaseID,medicine.Name ,medicine.Description\n"
                + " from prescription left outer join medicine on prescription.medicineID = medicine.medicineID;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Medicine(rs.getInt(1), rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5)
                ));
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

        public List<MedicineList> getListMedicines() {
        List<MedicineList> list = new ArrayList<>();
        String query = "SELECT * FROM medicine;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new MedicineList(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
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
    
    public List<Medicine> getListMedicineByCaseID(int caseID) {
        List<Medicine> list = new ArrayList<>();
        String query = "select prescription.CaseID, prescription.medicineID,medicine.Name ,medicine.Description,prescription.Quantity, medicine.Price\n"
                + "	from prescription left outer join medicine on prescription.medicineID = medicine.medicineID\n"
                + "		WHERE CaseID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, caseID);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Medicine(rs.getInt(1), rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getInt(5),
                        rs.getInt(6)
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

    public void addMedicine(Medicine mdc) {
        String query = "insert into medicine values ('?','?','?','?')";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, mdc.getMedicineID());
            ps.setInt(2, mdc.getCase().getCaseID());
            ps.setString(3, mdc.getName());
            ps.setString(4, mdc.getDescription());

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi vcl");
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

    public void upadteMedicine(String name ,String description,String medicineUid) {
        String query = "update Medicine  set Name = '?' ,Description = '?'\n"
                + "where  MedicineID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, medicineUid);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi vcl");
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

        public void addNewCaseMedicine(int CaseId, int MedicineID, int Quantity){
        String query = "INSERT INTO `prescription` (`MedicineID`, `CaseID`, `Quantity`) VALUES (?, ?, ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, MedicineID);
            ps.setInt(2, CaseId);  
            ps.setInt(3, Quantity);
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
    
    public void deleteCaseMedicine(int CaseId, int MedicineID) {
        try {
            String query = "DELETE FROM `prescription` WHERE (`MedicineID` = ?) and (`CaseID` = ?);";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, CaseId);
            ps.setInt(2, MedicineID);  
            ps.executeUpdate(); // kh tra ve cai gi het
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
        public void deleteMedicine(String MedicineID) {
        try {
            String query = "Delete from medicine\n"
                    + "where MedicineID = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, MedicineID);     
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

    public List<MedicineList> getMedicineList() {
        List<MedicineList> list = new ArrayList<>();
        String query = "select * from medicine";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new MedicineList(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
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
    public void addMedicineList(
            String name ,String description) {
        String query = "INSERT INTO `medicine` (`MedicineID`, `Name`, `Description`) VALUES (0, ?, ?);";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, description);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Loi vcl");
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
    
    
    public MedicineList getMedicineByID(String MedicineID) {
        String query = "select * from medicine where MedicineID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, MedicineID);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return (new MedicineList(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4)
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
    
    public boolean checkSelectMedicine(int caseID, int meID){
        List<Medicine> list = this.getListMedicineByCaseID(caseID);
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                //System.out.println(i+"-"+list.get(i).getMedicineID());
                if (list.get(i).getMedicineID() == meID) {
                    return false;
                }
            }
        } else {
            return true;
        }
        return true;
    }
    
//    public Medicine getMedicineByID(int id) {
//        String query = "SELECT * FROM medicine WHERE MedicineID=?";
//        try {
//            conn = new DBConnection().getConnection();
//            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
//            ps.setInt(1, id);
//            rs = ps.executeQuery();;// chay cau lenh query nhan ket qua tra ve
//            while (rs.next()) {
//                return (new Medicine(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5)));
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return null;
//    }
//
//    public List<Medicine> getPrescription(int CaseID) {
//        List<Medicine> list = new ArrayList<>();
//        String query = "SELECT * FROM prescription WHERE CaseID=?";
//        try {
//            conn = new DBConnection().getConnection();
//            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
//            ps.setInt(1, CaseID);
//            rs = ps.executeQuery();;// chay cau lenh query nhan ket qua tra ve
//            while (rs.next()) {
//                Medicine me = this.getMedicineByID(rs.getInt(1));
//                list.add(me);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    
    public static void main(String[] args) {
        medicineDAO md = new medicineDAO();
        System.out.println(md.checkSelectMedicine(6, 4));
    }
}
