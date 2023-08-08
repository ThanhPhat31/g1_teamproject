/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author vusyl
 */
public class Product {

    private String productid;
    private String price; //double
    private String description;
    private String productname;
    private String quantity;
    private String image;
    private String category;

    public Product() {
    }

    public Product(String productid, String price, String description, String productname, String quantity, String image, String category) {
        this.productid = productid;
        this.price = price;
        this.description = description;
        this.productname = productname;
        this.quantity = quantity;
        this.image = image;
        this.category = category;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "productid=" + productid + ", price=" + price + ", description=" + description + ", productname=" + productname + ", quantity=" + quantity + ", image=" + image + ", category=" + category + '}';
    }
    
}
