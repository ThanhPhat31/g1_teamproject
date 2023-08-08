/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import controll.javaHelper.DateTimeHelper;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Account;
import entity.Medicine;

public class AccDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public Account login(String Account, String Password) {
        // Tạo câu truy vấn SQL để tìm kiếm tài khoản có tên đăng nhập và mật khẩu tương ứng
        String query = "select * from profile where Account = ? and Password = ?";
        try {
            // Mở kết nối tới cơ sở dữ liệu
            conn = new DBConnection().getConnection();
            // Chuẩn bị câu truy vấn PreparedStatement với tham số đầu vào
            ps = conn.prepareStatement(query);
            // Đặt giá trị của tham số đầu vào truy vấn là tên đăng nhập và mật khẩu
            ps.setString(1, Account);
            ps.setString(2, Password);
            // Thực hiện truy vấn SQL và lấy kết quả ResultSet
            rs = ps.executeQuery();
            // Duyệt qua các bản ghi trả về từ ResultSet
            while (rs.next()) {
                // Nếu tìm thấy tài khoản, trả về đối tượng Account mới
                return new Account(
                        rs.getString(1),
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
            // Xử lý ngoại lệ nếu có lỗi trong quá trình thực hiện truy vấn
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
        // Nếu không tìm thấy tài khoản, trả về giá trị null
        return null;
    }

    public Account forgetpass(String newPassword, String email) {
        String query = "UPDATE profile\n"
                + "SET Password = ? \n"
                + "where Mail  = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
//            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            ps.setString(1, newPassword);
            ps.setString(2, email);
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
        return null;

    }

    public Account checkAccount(String Account) {
        String query = "select * from profile\n"
                + "where Account = ?\n";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Account);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getString(1),
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

    public Account checkEmail(String Email) {
        String query = "select * from profile\n"
                + "where Mail = ?\n";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, Email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getString(1),
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

    public Account getAccount(String Account, String opass) {
        String query = "select * from profile where Account=? and Password=?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, Account);
            ps.setString(2, opass);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(Account, opass);

            }
        } catch (Exception e) {

        }
        return null;
    }

    public void updatePassWord(Account a) {
        String query = "UPDATE profile SET Password = ? WHERE Account = ?;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
//            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            ps.setString(1, a.getPassword());
            ps.setString(2, a.getAccount());
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

    public void getforgotpass(Account a) {
        String query = "UPDATE profile SET Password = ? WHERE Mail = ?;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
//            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            ps.setString(1, a.getPassword());
            ps.setString(2, a.getMail());
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

    public void signup(
            String Account, String Password, String FirstName, String MiddleName, String LastName,
            String gender,
            String DoB, String Address,
            String Mail, String Phone) {
        String query = "INSERT INTO `profile` (`ProfileID`, `FirstName`, `MiddleName`, `LastName`, `DoB`, `Gender`, `Address`, `Mail`, `Phone`, `Account`, `Password`, `Role`,`Image`)\n"
                + " VALUES (0,?,?,?,?,?,?,?,?,?,?,3,?);";
        try {

            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, FirstName);
            ps.setString(2, MiddleName);
            ps.setString(3, LastName);
            ps.setString(4, DoB);
            if (gender.equals("Male")) {
                ps.setString(5, "1");
            } else {
                ps.setString(5, "0");
            }
            ps.setString(6, Address);
            ps.setString(7, Mail);
            ps.setString(8, Phone);
            ps.setString(9, Account);
            ps.setString(10, Password);
            ps.setString(11, "Default.jpg");
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

    public String getNewestProfile() {
        String query = "SELECT * FROM profile order by ProfileID desc limit 1";
        try {

            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
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

    public void insertPatientByProfile(String ProfielID) {

        String query = "INSERT INTO `patient` (`ProfileID`) VALUES (?) ";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ProfielID);
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

    public String getUserRole(String account) {
        try {
            String query = "Select role from profile where account = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, account);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Get user role error: " + e.getMessage());
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

    //SELECT * FROM (SELECT ProfileID, CONCAT(FirstName,' ', MiddleName,' ',LastName) as FullName,DoB,Gender,Address,Mail,Phone,Account,Password,Role FROM profile) as t WHERE FullName like "%n%" or Mail like "%n%"
    public void deleteAcc(String id) {
        try {
            String query = "delete from profile\n"
                    + "where ProfileID = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
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

    public void SendMessContact(String name, String email, String phone, String mess) {

        String query = "INSERT INTO `contact` (`ContactID`, `Name`, `Mail`, `Phone`, `Message`, `Date`, `Time`, `Status`)\n"
                + " VALUES (0, ?, ?, ?, ?, ?, ?, 1);";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, mess);
            ps.setString(5, DateTimeHelper.getCurrentDay());
            ps.setString(6, DateTimeHelper.getCurrentTime());
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

    
        public void insert(String FirstName, String MiddleName, String LastName,
            String gender,
            String DoB, String Address,
            String Mail, String Phone,
            String Account, String Password, String Role,String Image) {
        String query = "INSERT INTO `profile` (`FirstName`, `MiddleName`, `LastName`, `DoB`, `Gender`, `Address`, `Mail`, `Phone`, `Account`, `Password`, `Role`, `Image`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, FirstName);
            ps.setString(2, MiddleName);
            ps.setString(3, LastName);
            ps.setString(4, DoB);
            if (gender.equals("Male")) {
                ps.setString(5, "1");
            } else 
                ps.setString(5, "0");
            ps.setString(6, Address);
            ps.setString(7, Mail);
            ps.setString(8, Phone);
            ps.setString(9, Account);
            ps.setString(10, Password);
            ps.setString(11, Role);
            ps.setString(12, Image);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
