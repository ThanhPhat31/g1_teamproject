/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.db.DBConnection;
import entity.ImageNews;
import entity.News;
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
public class NewsDAO {
    
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

     
    
    /**
     * get News list from DB
     * @return list News
     */
    public List<News> getAllNews() {
        List<News> list = new ArrayList<>();
        String query = "select * from news order by Date desc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new News(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
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
     public List<News> getTop4News() {
        List<News> list = new ArrayList<>();
        String query = "SELECT * from news order by Date desc limit 4";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new News(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * add new News to DB
     * @param category
     * @param title
     * @param content 
     * @param date 
     * @param author 
     */
    public void addNews(int category, String title, String content, Date date, String author, String image1, String image2){
        String query = "insert into news (Category, Title, Content, Date, Author, Image1, Image2) values(?,?,?,?,?,?,?)";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setDate(4, (java.sql.Date) date);
            ps.setString(5, author);
            ps.setString(6, image1);
            ps.setString(7, image2);
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
    
    /**
     * delete a News
     * @param id 
     */
    public void deleteNews(int id){
        String query = "delete from news where NewsID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }        finally {
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
    
    /**
     * Update a News
     * @param id
     * @param category
     * @param description
     * @param content 
     * @param date 
     * @param author 
     */
    public void updateNews(int id,int category, String title, String content, Date date, String author, String image1, String image2){
        String query = "update news set Category = ?, Title = ?, Content = ?, Date=?, Author=?, Image1 =?,Image2=? where NewsID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, category);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setDate(4, (java.sql.Date) date);
            ps.setString(5, author);
            ps.setString(6, image1);
            ps.setString(7, image2);
            ps.setInt(8, id);
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
    
    /**
     * get a News by Id
     * @param id
     * @return News
     */
    public News getNewsById (int id){
        News result = new News();
        String query = "select * from news where NewsID = ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {                
                result.setId(rs.getInt(1));
                result.setCategory(rs.getInt(2));
                result.setTitle(rs.getString(3));
                result.setContent(rs.getString(4));
                result.setDate(rs.getDate(5));
                result.setAuthor(rs.getString(6));
                result.setImage1(rs.getString(7));
                result.setImage2(rs.getString(8));
            }
        } catch (Exception e) {
            System.out.println(e);
        }      finally {
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
        return result;
    } 
    /**
     * get list news by category
     * @param category
     * @return list News
     */
    public List<News> getNewsByCategory(int category) {
        List<News> list = new ArrayList<>();
        String query = "select * from news where Category =? order by Date desc";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, category);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new News(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
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
    
    /**
     * 
     * @param title
     * @param index
     * @return list news
     */
    public List<News> getNewsByTitle(String title, int index) {
        List<News> list = new ArrayList<>();
        //String query = "SELECT * FROM news where Title like ? order by Date desc";
        String query =  "select * from (select *, row_number() over ( order by Date desc) as r from news where Title like ?) as x where r between ?*5-4 and ?*5";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1,"%"+ title+"%");
            ps.setInt(2, index);
            ps.setInt(3, index);
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new News(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                        
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
    
    /**
     * count News
     * @param title
     * @return total News
     */
    public int countTotalNews(String title){
        int result = 0;
        String query = "SELECT Count(*) FROM news where Title like ?";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setString(1,"%"+ title+"%");
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                result = rs.getInt(1);
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
        return result;
    }
    
    public int totalNews() {
        String query = "SELECT Count(*) FROM news";
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
    
    public List<News> page(int index) { // Phan trang lay 3 slide
        List<News> list = new ArrayList<>();
        String query = "SELECT * FROM news ORDER BY NewsID asc LIMIT ?, 5";
        try {
            conn = new DBConnection().getConnection();
            ps = conn.prepareStatement(query); // nem cau lenh query sang sql
            ps.setInt(1, (index - 1) * 5); // lay tu so 0 
            rs = ps.executeQuery();// chay cau lenh query nhan ket qua tra ve
            while (rs.next()) {
                list.add(new News(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
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
