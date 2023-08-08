/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.daoo.profileDAO;
import com.db.DBConnection;
import controll.javaHelper.DateTimeHelper;
import entity.Account;
import entity.BookingDoctor;
import entity.Case;
import entity.Contact;
import entity.Doctor;
import entity.Patient;
import entity.Product;
import entity.normalBook;
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
public class BookManageDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    CaseDAO cdao = new CaseDAO();
    profileDAO pdao = new profileDAO();

    public int totalAccount() {
        String query = "select count(*) from first_priority_patient_list";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1); //tra ve bem dem count

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
        return 0;
    }

    public List<Doctor> getDoctorID() {
        List<Doctor> list = new ArrayList<>();
        String query = "SELECT * FROM doctor";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Doctor(rs.getInt(1), pdao.getProfileById(String.valueOf(rs.getInt(2))), rs.getString(3), rs.getString(4), rs.getInt(5)));
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

    public List<Patient> getPatientID(int id) {
        List<Patient> list = new ArrayList<>();
        String query = "SELECT * FROM patient WHERE ProfileID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
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

    public List<BookingDoctor> getListBookDoctorID(int txtID) {
        List<BookingDoctor> list = new ArrayList<>();
        String query = "SELECT * FROM first_priority_patient_list  where PatientID= ?\n"
                + "                Order by Status asc, Appointment_date desc, Appointment_time desc, Booking_date desc, Booking_time desc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, txtID);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new BookingDoctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(8),
                        cdao.getPatientInfo(rs.getInt(6)),
                        cdao.getDoctorInfo(rs.getInt(7)))
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

    public List<BookingDoctor> getSearchByNamePD(String txtID) {
        List<BookingDoctor> list = new ArrayList<>();
        String query = "SELECT * FROM first_priority_patient_list  where ID=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, txtID);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new BookingDoctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(8),
                        cdao.getPatientInfo(rs.getInt(6)),
                        cdao.getDoctorInfo(rs.getInt(7)))
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

    public List<BookingDoctor> page(int id) { // Phan trang lay 3 slide
        List<BookingDoctor> list = new ArrayList<>();

        String query = "SELECT * FROM first_priority_patient_list WHERE (DoctorID = ? or DoctorID is null) and curdate()= Appointment_date and Status = 1 order by Appointment_time asc, Booking_date asc, Booking_time asc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, id);
            //ps.setInt(2, (index - 1) * 5); // lay tu so 0 
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new BookingDoctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(8),
                        cdao.getPatientInfo(rs.getInt(6)),
                        cdao.getDoctorInfo(rs.getInt(7)))
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

    public List<normalBook> getListNowDay() {
        List<normalBook> list = new ArrayList<>();
        String query = "SELECT *  from normal_priority_patient_list where CURDATE() = Date and Status = 0 order by Time asc ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new normalBook(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        cdao.getPatientInfo(rs.getInt(4)),
                        rs.getString(5))
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

    public List<Case> getListCase() {
        List<Case> list = new ArrayList<>();
        String query = "SELECT * FROM `case`";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql

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

    public List<Case> getListCaseByDoctor(String id) {
        List<Case> list = new ArrayList<>();
        String query = "SELECT * FROM `case` WHERE (curdate() = Date and (Status = 1 or Status = 2) and DoctorID = ?) order by Time desc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, id);
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

    //CRUD
    public void delete(String id) {
        try {
            String query = "delete from first_priority_patient_list\n"
                    + "where ID = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate(); // kh tra ve cai gi het
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
public void CancelBooking(String id) {
        try {
            String query = "UPDATE `first_priority_patient_list` SET `Status` = '3' WHERE (`ID` = ?);";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate(); // kh tra ve cai gi het
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
    public void DeleteListWaiting(String id) {
        try {
            String query = "delete from normal_priority_patient_list\n"
                    + "where ID = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate(); // kh tra ve cai gi het
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

    public void AddBooking(String appointment_date, String appointment_time, String DoctorID, String PatientID) {

        String query = "INSERT INTO `first_priority_patient_list`\n"
                + " (`Booking_date`, `Booking_time`, `Appointment_date`, `Appointment_time`, `PatientID`, `DoctorID`, `Status`) \n"
                + "VALUES (?, ?, ?, ?, ?, ?, 0);";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, DateTimeHelper.getCurrentDay());
            ps.setString(2, DateTimeHelper.getCurrentTime());
            ps.setString(3, appointment_date);
            ps.setString(4, appointment_time);
            ps.setString(5, PatientID);
            ps.setString(6, DoctorID);
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

    public List<Account> getAllPatient() {
        List<Account> list = new ArrayList<>();
        String query = "select * from profile where role = 0 ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String ProfileID = rs.getString(1);
                String FirstName = rs.getString(2);
                String MiddleName = rs.getString(3);
                String LastName = rs.getString(4);
                String DoB = rs.getString(5);
                boolean Gender = rs.getBoolean(6);
                String Address = rs.getString(7);
                String Mail = rs.getString(8);
                String Phone = rs.getString(9);
                String Account = rs.getString(10);
                String Password = rs.getString(11);
                String Role = rs.getString(12);
                String Image = rs.getString(13);
                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Gender, Address, Mail, Phone, Account, Password, Role, Image);
                list.add(g);

            }
        } catch (SQLException e) {
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

    public List<Patient> getSearchByLastName(String txtID) {
        List<Patient> list = new ArrayList<>();
        String query = "SELECT * FROM profile where LastName  like  ? and Role = 3";
        try {
            CaseDAO csdao = new CaseDAO();
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, "%" + txtID + "%");

            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                String ProfileID = rs.getString(1);
                Patient g = csdao.getPatientByProfileID(Integer.valueOf(ProfileID));
                list.add(g);

            }
        } catch (SQLException e) {
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

    public List<BookingDoctor> getSearchPatientBooking(String txtID) {
        List<BookingDoctor> list = new ArrayList<>();
        String query = "SELECT * FROM first_priority_patient_list left join \n"
                + "(SELECT patient.PatientID, profile.FirstName, profile.MiddleName, profile.LastName, profile.Mail FROM patient \n"
                + "inner join profile on patient.ProfileID = profile.ProfileID ) as p \n"
                + "on first_priority_patient_list.PatientID = p.PatientID\n"
                + "WHERE curdate()=Appointment_date  and Status = 0 \n"
                + "and (FirstName like ? or MiddleName like ? or LastName like ? or Mail like ?)\n"
                + "order by Appointment_time asc, Booking_date asc, Booking_time asc";
        try {
            CaseDAO csdao = new CaseDAO();
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, "%" + txtID + "%");
            ps.setString(2, "%" + txtID + "%");
            ps.setString(3, "%" + txtID + "%");
            ps.setString(4, "%" + txtID + "%");
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new BookingDoctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(8),
                        cdao.getPatientInfo(rs.getInt(6)),
                        cdao.getDoctorInfo(rs.getInt(7)))
                );

            }
        } catch (SQLException e) {
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
        BookManageDAO bk = new BookManageDAO();
        List<BookingDoctor> list = bk.getSearchPatientBooking("luan");
        for (BookingDoctor bookingDoctor : list) {
            System.out.println(bookingDoctor);
        }
    }

    public int totalProfile() {
        String query = "select count(*) from profile";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1); //tra ve bem dem count

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
        return 0;
    }

    public int totalSearchProfile(String txt) {
        String query = " select count(*) from  profile where LastName  like  ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1); //tra ve bem dem count

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
        return 0;
    }

    public List<Account> pageProfile(int index) {
        List<Account> list = new ArrayList<>();
        String query = "SELECT * FROM profile ORDER BY ProfileID asc LIMIT ?, 10";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, (index - 1) * 10); // lay tu so 0 
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getBoolean(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13))
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

    public List<BookingDoctor> ListBooking() { // lay list booking o trang search cua listbooing
        List<BookingDoctor> list = new ArrayList<>();
        String query = "SELECT * FROM first_priority_patient_list WHERE \n"
                + "                curdate()= Appointment_date and Status = 0\n"
                + "                order by Appointment_time asc, Booking_date asc, Booking_time asc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new BookingDoctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(8),
                        cdao.getPatientInfo(rs.getInt(6)),
                        cdao.getDoctorInfo(rs.getInt(7)))
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

    public List<BookingDoctor> ListBookingWaiting() { // 
        List<BookingDoctor> list = new ArrayList<>();
        String query = "SELECT * FROM first_priority_patient_list WHERE \n"
                + "                curdate()= Appointment_date and Status = 1\n"
                + "                order by Appointment_time asc, Booking_date asc, Booking_time asc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new BookingDoctor(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5), rs.getInt(8),
                        cdao.getPatientInfo(rs.getInt(6)),
                        cdao.getDoctorInfo(rs.getInt(7)))
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

    public void addPatientBooked(String date, String time, String id) {
        try {
            String query = "UPDATE `first_priority_patient_list` SET `Appointment_date` = ?, `Appointment_time` = ?, `Status` = 1 WHERE (`ID` = ?);";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, DateTimeHelper.getCurrentDay());
            ps.setString(2, DateTimeHelper.getCurrentTime());
            ps.setString(3, id);
            ps.executeUpdate(); // kh tra ve cai gi het
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
