package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public Connection getConnection() {
        try {
            // Initialize all the information regarding
            // Database Connection
            String dbDriver = "com.mysql.cj.jdbc.Driver";
            String dbURL = "jdbc:mysql:// localhost:3306/";
            // Database name to access
            String dbName = "swp391";
            String dbUsername = "root";
            String dbPassword = "123456";

            Class.forName(dbDriver);
            Connection con = DriverManager.getConnection(dbURL + dbName,
                    dbUsername,
                    dbPassword);
//            System.out.println("Connect Successfully");
            return con;
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public static void main(String[] args) {
        DBConnection connection = new DBConnection();
        try {
            System.out.println("thanh cong");
        } catch (Exception e) {
            System.out.println("falied");
        }

    }

}
