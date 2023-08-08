/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import entity.normalprioritypatientlist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buitr
 */
public class patientDAO {
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public List<normalprioritypatientlist> getAllPatient() {
        List<normalprioritypatientlist> list = new ArrayList<>();
        String query = "select nm.id,pr.FirstName,pr.MiddleName,pr.LastName, pr.DoB,pr.Gender,pr.Address,pr.Mail,pr.Phone,nm.Date,nm.Time,c.Description,c.Result\n"
                + "from normal_priority_patient_list as nm\n"
                + "join patient as p on nm.PatientID=p.PatientID\n"
                + "join profile as pr on p.ProfileID=pr.ProfileID\n"
                + "join `case` as c on p.PatientID=c.PatientID";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new normalprioritypatientlist(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13)
                )
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
        patientDAO pd = new patientDAO();
        List<normalprioritypatientlist> list = pd.getAllPatient();
        System.out.println(list);
    }   
}
