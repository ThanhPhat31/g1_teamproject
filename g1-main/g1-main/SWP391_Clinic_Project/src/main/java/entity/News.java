/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import controll.javaHelper.DateTimeHelper;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ThangDT
 */
public class News {

    //
    private int id;
    private int category;
    private String title;
    private String content;
    private Date date;
    private String author;
    private String image1;
    private String image2;

    //Contructor
    
    public News() {
    }

    public News(int id, int category, String title, String content, Date date, String author, String image1, String image2) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.content = content;
        this.date = date;
        this.author = author;
        this.image1 = image1;
        this.image2 = image2;
    } 
    //Getter and Setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return DateTimeHelper.formatDate(date.toString());
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }
     public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }
    //Show   

    @Override
    public String toString() {
        return "News{" + "id=" + id + ", category=" + category + ", title=" + title + ", content=" + content + ", date=" + date + ", author=" + author + ", image1=" + image1 + ", image2=" + image2 + '}';
    }
   
    
}
