package com.daoo;

import com.db.DBConnection;
import entity.Account;
import entity.Doctor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author vusyl
 */
public class profileDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public ArrayList<Account> getAll() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from profile ";
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
                String Address = rs.getString(6);
                String Mail = rs.getString(7);
                String Phone = rs.getString(8);
                String Account = rs.getString(9);
                String Password = rs.getString(10);
                String Role = rs.getString(11);
                String Image = rs.getString(12);
                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Boolean.TRUE, Address, Mail, Phone, Account, Password, Role, Image);
                list.add(g);

            }
        } catch (SQLException e) {

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

    public ArrayList<Account> getAllByAcc(String a) throws SQLException, IOException {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from profile where Account=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, a);
            rs = ps.executeQuery();
            while (rs.next()) {
                String ProfileID = rs.getString(1);
                String FirstName = rs.getString(2);
                String MiddleName = rs.getString(3);
                String LastName = rs.getString(4);
                String DoB = rs.getString(5);

                boolean Gender = rs.getBoolean(6);
//                if(Gender  == "1"){
//                      ps.setString(6, "Male");
//                }else{
//                     ps.setString(6, "Female");
//                }

                String Address = rs.getString(7);
                String Mail = rs.getString(8);
                String Phone = rs.getString(9);
                String Account = rs.getString(10);
                String Password = rs.getString(11);
                String Role = rs.getString(12);
                String Image = rs.getString(13);
//                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Address, Mail, Phone, Account, Password, Role);
                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Gender, Address, Mail, Phone, Account, Password, Role, Image);
                list.add(g);
            }
        } catch (SQLException e) {

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

//    public ArrayList<Account> getAll() {
//        ArrayList<Account> list = new ArrayList<>();
//        String query = "select * from profile ";
//        try {
//            conn = new DBConnection().getConnection();
//            ps = conn.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                String ProfileID = rs.getString(1);
//                String FirstName = rs.getString(2);
//                String MiddleName = rs.getString(3);
//                String LastName = rs.getString(4);
//                String DoB = rs.getString(5);
//                String Address = rs.getString(6);
//                String Mail = rs.getString(7);
//                String Phone = rs.getString(8);
//                String Account = rs.getString(9);
//                String Password = rs.getString(10);
//                String Role = rs.getString(11);
//                String Image = rs.getString(12);
//                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Boolean.TRUE, Address, Mail, Phone, Account, Password, Role, Image);
//                list.add(g);
//
//            }
//        } catch (SQLException e) {
//
//        }
//        return list;
//
//    }
    public List<Account> getAll1(int id) {
        List<Account> list = new ArrayList<>();
        String query = "select * from profile where ProfileID = ? ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String ProfileID = rs.getString(1);
                String FirstName = rs.getString(2);
                String MiddleName = rs.getString(3);
                String LastName = rs.getString(4);
                String DoB = rs.getString(5);
                Boolean Gender = rs.getBoolean(6);
                String Address = rs.getString(7);
                String Mail = rs.getString(8);
                String Phone = rs.getString(9);
                String Account = rs.getString(10);
                String Password = rs.getString(11);
                String Role = rs.getString(12);
                String Image = rs.getString(13);
//                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Address, Mail, Phone, Account, Password, Role);
                Account g = new Account(ProfileID, FirstName, MiddleName, LastName, DoB, Gender, Address, Mail, Phone, Account, Password, Role, Image);
                list.add(g);

            }
        } catch (SQLException e) {

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

    public List<Doctor> getProfileDoctor() {
        List<Doctor> list = new ArrayList<>();
        String query = "SELECT doctor.Position, profile.* \n"
                + "FROM profile, doctor\n"
                + "WHERE profile.ProfileID= doctor.ProfileID limit 4";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Postion = rs.getString(1);
                String ProfileID = rs.getString(2);
                String FirstName = rs.getString(3);
                String MiddleName = rs.getString(4);
                String LastName = rs.getString(5);
                String DoB = rs.getString(6);
                Boolean Gender = rs.getBoolean(7);
                String Address = rs.getString(8);
                String Mail = rs.getString(9);
                String Phone = rs.getString(10);
                String Account = rs.getString(11);
                String Password = rs.getString(12);
                String Role = rs.getString(13);
                String Image = rs.getString(14);
                Doctor g = new Doctor(Postion,ProfileID, FirstName, MiddleName, LastName, DoB, Gender, Address, Mail, Phone, Account, Password, Role, Image);
                list.add(g);

            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account getProfileById(String id) {
        String query = "select * from profile \n"
                + "where ProfileID =?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery(); // co tra ve bang gi do
            while (rs.next()) {
                return new Account(rs.getString(1),
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
                        rs.getString(13)
                );
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

    public void updateprofile(String ProfileID,
            String FirstName, String MiddleName, String LastName, String Gender,
            String DoB, String Address, String Mail, String Phone, String Image
    ) {
        String query = "update profile set FirstName = ?,MiddleName = ?,LastName = ?,DoB = ?,Gender = ?,Address = ?,Mail = ?,Phone = ?, Image=?\n"
                + "where ProfileID = ?;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, FirstName);
            ps.setString(2, MiddleName);
            ps.setString(3, LastName);

            ps.setString(4, DoB);
            if (Gender.equals("Male")) {
                ps.setString(5, "1");
            } else {
                ps.setString(5, "0");
            }
            ps.setString(6, Address);
            ps.setString(7, Mail);
            ps.setString(8, Phone);
            ps.setString(9, Image);
            ps.setString(10, ProfileID);
            ps.executeUpdate();
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

    public void updateAcc(String ProfileID,
            String FirstName, String MiddleName, String LastName, String Gender,
            String DoB, String Address, String Mail, String Phone, String Account, String Password, String Role, String Image) {
        String query = "update profile set FirstName = ?,MiddleName = ?,LastName = ?,DoB = ?,Gender = ?,Address = ?,Mail = ?,Phone = ?, Account = ?, Password = ?, Role = ?, Image = ?\n"
                + "where ProfileID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, FirstName);
            ps.setString(2, MiddleName);
            ps.setString(3, LastName);
            ps.setString(4, DoB);
            if (Gender.equals("Male")) {
                ps.setString(5, "1");
            } else {
                ps.setString(5, "0");
            }
            ps.setString(6, Address);
            ps.setString(7, Mail);
            ps.setString(8, Phone);
            ps.setString(9, Account);
            ps.setString(10, Password);
            ps.setString(11, Role);
            ps.setString(12, Image);
            ps.setString(13, ProfileID);
            ps.executeUpdate();
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
    public int totalAccount() {
        String query = "select count(*) from profile";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1); //tra ve bem dem count

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
        return 0;
    }
    
    public int countCustomer() {
        String sql = "	SELECT COUNT(*) as total FROM profile \n"
                + "WHERE role=0 ";      
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1); //tra ve bem dem count

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
        return 0;
    }
    public int countDoctor() {
        String sql = "	SELECT COUNT(*) as total FROM profile \n"
                + "WHERE role=2 ";      
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(sql); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                return rs.getInt(1); //tra ve bem dem count
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
        return 0;
    }

    public List<Account> page(int index) {
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
    public List<Account> pageAdmin(int index) {
        List<Account> list = new ArrayList<>();
        String query = "SELECT * FROM profile where Role = 0 ORDER BY ProfileID asc LIMIT ?, 10";
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
}
