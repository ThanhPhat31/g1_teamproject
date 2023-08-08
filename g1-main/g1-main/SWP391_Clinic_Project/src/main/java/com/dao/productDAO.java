/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
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
import entity.Product;
import static java.util.Collections.list;

public class productDAO {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public int countProduct() {
        String query = "select count(*) from product";
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

    // trang dang try cap index click so nao lay so do
    public List<Product> page(int index) { // Phan trang lay 3 slide
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product LIMIT ?, 3";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, (index - 1) * 3); // lay tu so 0 
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getAll() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getSearchByNamePD(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * from product where ProductName like ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        productDAO pd = new productDAO();
        List<Product> list = pd.searchProductpricebigger("100000", "200000");
        for (Product product : list) {
            System.out.println(product.toString());
        }
    }

    public int count(String txtSearch) {

        try {
            String query = "SELECT count(*) from medicine where Name like ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
        } catch (Exception e) {
        }
        return 0;

    }

    public void delete(String id) {
        try {
            String query = "delete from product\n"
                    + "where ProductID = ?";
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate(); // kh tra ve cai gi het
        } catch (Exception e) {
        }

    }

    public void createProduct(
            String price, String description, String image, String productname,
            String quantity, String category) {
        String query = "insert into product \n"
                + "values (0,?,?,?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, price);
            ps.setString(2, description);
            ps.setString(3, image);
            ps.setString(4, productname);
            ps.setString(5, quantity);
            ps.setString(6, category);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product getProductById(String id) {
        String query = "select * from product \n"
                + "where ProductID =?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery(); // co tra ve bang gi do
            while (rs.next()) {
                return new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateproduct(String productid,
            String price, String description, String image, String productname,
            String quantity, String category) {
        String query = "update product set Price = ?,Description = ?,Image = ?,Productname = ?,Quantity = ?,Category=?\n"
                + "where ProductID = ?;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, price);
            ps.setString(2, description);
            ps.setString(3, image);
            ps.setString(4, productname);
            ps.setString(5, quantity);
            ps.setString(6, category);
            ps.setString(6, productid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> searchProductbypriceasc() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product order by price asc;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductbypricedesc() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product order by price desc;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> listProductbynameasc() {
        List<Product> list = new ArrayList<>();
        String query = "select * from product order by productname asc;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpricebigger100andless200() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN 100000 AND 200000;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpricebigger200andless300() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN 200000 AND 300000;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpricebigger300andless400() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN 300000 AND 400000;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpricebigger400andless500() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price BETWEEN 400000 AND 500000;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpriceless100() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price < 100000;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpricebigger500() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products WHERE price > 500000;";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductbycategory0() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE category='0'";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductbycategory1() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE category='1'";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchProductpricebigger(String minprice, String maxprice) {

        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE price BETWEEN ? AND ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1, minprice);
            ps.setString(2, maxprice);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7))
                );

            }
        } catch (Exception e) {
        }
        return list;
    }
}
