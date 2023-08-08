/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.daoo.profileDAO;
import com.db.DBConnection;
import controll.javaHelper.DateTimeHelper;
import entity.*;
import java.awt.BorderLayout;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ThangDT
 */
public class CaseDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    profileDAO pdao = new profileDAO();
    designateDAO deDAO = new designateDAO();

    public Doctor getDoctorInfo(int id) {
        String query = "SELECT * FROM doctor where DoctorID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return (new Doctor(rs.getInt(1), pdao.getProfileById(String.valueOf(rs.getInt(2))), rs.getString(3), rs.getString(4), rs.getInt(5)));
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
        return null;
    }

    public Patient getPatientInfo(int id) {
        String query = "SELECT * FROM patient WHERE PatientID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();;// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return (new Patient(rs.getInt(1), pdao.getProfileById(String.valueOf(rs.getInt(2)))));
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
        return null;
    }

    public Case getCaseByID(int id) {
        String query = "SELECT * FROM `case` where CaseID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return (new Case(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8)));
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
        return null;
    }

    public Doctor getDoctorByProfileID(int id) {
        String query = "SELECT * FROM doctor WHERE ProfileID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return (new Doctor(rs.getInt(1), pdao.getProfileById(String.valueOf(rs.getInt(2))), rs.getString(3), rs.getString(4), rs.getInt(5)));
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
        return null;
    }

    public Patient getPatientByProfileID(int id) {
        String query = "SELECT * FROM patient WHERE ProfileID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return (new Patient(rs.getInt(1), pdao.getProfileById(String.valueOf(rs.getInt(2)))));
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
        return null;
    }

    public List<Case> getListCaseByDoctorID(int id) {
        List<Case> list = new ArrayList<>();
        String query = "SELECT * FROM `case` WHERE (curdate() = Date and (Status = 1 or Status = 2) and DoctorID = ?) order by Time asc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Case(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8))
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

    public List<Case> getListCaseDoctorID(int id) {
        List<Case> list = new ArrayList<>();
        String query = "SELECT * FROM `case` WHERE DoctorID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Case(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8))
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

    public List<Case> getListCaseByPatientID(int id) {
        List<Case> list = new ArrayList<>();
        String query = "SELECT * FROM `case` WHERE PatientID= ? order by date desc , status desc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Case(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(8))
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

    public void addCase(String date, String time, int doctorID, int patientID) {
        String query = "INSERT INTO `case` ( Date,Time, Status, Result, DoctorID, PatientID) VALUES (?,?,1,'',?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, date);
            ps.setString(2, time);
            ps.setInt(3, doctorID);
            ps.setInt(4, patientID);
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

    public void editStatusDoctorBooking(int id) {
        String query = "UPDATE first_priority_patient_list SET Status = '2' WHERE (ID = ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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

    public void editStatusNormalBooking(int id) {
        String query = "UPDATE normal_priority_patient_list SET Status = '1' WHERE (ID = ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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

    public void cancelDoctorBooking(int id) {
        String query = "UPDATE `first_priority_patient_list` SET `Status` = '-1' WHERE (`ID` = ?);";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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

    public void cancelNormalBooking(int id) {
        String query = "UPDATE normal_priority_patient_list SET Status = '-1' WHERE (ID = ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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

    public void checkStatusCase(int caseID) {
        if (!this.isCaseFinish(caseID)) {
            if (deDAO.isDesignateFinish(caseID)) {
                String query = "UPDATE `case` SET `Status` = '1' WHERE (`CaseID` = ?)";
                try {
                    conn = new DBConnection().getConnection();
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, caseID);
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
            } else {
                String query = "UPDATE `case` SET `Status` = '2' WHERE (`CaseID` = ?)";
                try {
                    conn = new DBConnection().getConnection();
                    ps = conn.prepareStatement(query);
                    ps.setInt(1, caseID);
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
        }
    }

    public boolean isCaseFinish(int caseID) {
        return this.getCaseByID(caseID).getStatus().equals("Finished");
    }

    public void addNormalBook(String date, String time, int PatientID) {
        String query = "INSERT INTO `normal_priority_patient_list` (`ID`, `Date`, `Time`, `PatientID`, `Status`) \n"
                + "VALUES ( 0, ?, ?, ?, 0);";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, DateTimeHelper.getCurrentDay());
            ps.setString(2, DateTimeHelper.getCurrentTime());
            ps.setInt(3, PatientID);

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

    public List<Patient> getListPatientByAccount(int index) {
        List<Patient> list = new ArrayList<>();
        String query = "SELECT * FROM patient  LIMIT ?,5";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, (index - 1) * 5); // lay tu so 0 
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Patient(rs.getInt(1), pdao.getProfileById(String.valueOf(rs.getInt(2)))));
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

    public List<Contact> getListContact() {
        List<Contact> list = new ArrayList<>();
        String query = "SELECT * FROM contact order by contact.Status desc,Date desc,Time desc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Contact(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8))
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

    public void finishCase(int id, String description, String result) {
        String query = "UPDATE `case` SET `Status` = '0', `Description` = ?, `Result` = ? WHERE (`CaseID` = ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, description);
            ps.setString(2, result);
            ps.setInt(3, id);
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

    public void saveCase(int id, String description, String result) {
        String query = "UPDATE `case` SET  `Description` = ?, `Result` = ? WHERE (`CaseID` = ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, description);
            ps.setString(2, result);
            ps.setInt(3, id);
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

    public void reopenCase(int id) {
        String query = "UPDATE `case` SET `Status` = '1'WHERE (`CaseID` = ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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

    // updat status  0 ve 1 contact 
    public static void main(String[] args) {
        CaseDAO cs = new CaseDAO();
//        List<Contact> list = cs.getListContact();
//        for (Contact patient : list) {
//            System.out.println(patient);
//        }
        System.out.println(cs.getCaseByID(15).getDescription());
    }

}
