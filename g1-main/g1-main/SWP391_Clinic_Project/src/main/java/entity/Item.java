/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author buitr
 */
public class Item {
    private Product product;
    private String quantity;
    private String price;

    public Item() {
    }

    public Item(Product product, String quantity) {
        this.product = product;
        this.quantity = quantity;
        this.price = String.valueOf(Integer.parseInt(quantity) * Integer.parseInt(product.getPrice()));
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getQuantity() {
        return quantity;
    }

    public int getIntQuatity(){
        return Integer.parseInt(quantity);
    }
    
    public void setQuantity(int quantity) {
        this.quantity = String.valueOf(quantity);
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" + "product=" + product + ", quantity=" + quantity + ", price=" + price + '}';
    }   
}