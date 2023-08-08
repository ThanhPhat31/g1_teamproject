/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author buitr
 */
public class Cart {
    private List<Item> items ;

    public Cart() {
        items= new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    // mua them tim san trong gio hang
    public String getQuantityByID(String id){
        return getItemByID(id).getQuantity();
    }
    // lay item
   private Item  getItemByID(String id){
       for (Item i : items) {
           if (i.getProduct().getProductid().equals(id)) {
               return i;
           }
       }
       return null;
   }
    public void addItem(Item t){
        // san pham co san
        if(getItemByID(t.getProduct().getProductid()) != null){
            Item m = getItemByID(t.getProduct().getProductid());
            int pos = items.indexOf(m);
            items.get(pos).setQuantity(m.getIntQuatity()+t.getIntQuatity());
            items.get(pos).setPrice(String.valueOf(this.getTotalMoney()));
        } 
        // neu san pham chua co thi add vao list
        else {
            items.add(t);
        }
    }
    public void removeItem(String id){
        // neu san pham co trong gio hang
        if(getItemByID(id) != null){
            //xoa
            items.remove(getItemByID(id));
        } 
    }
    // tong so tien
 public double getTotalMoney(){
        double t=0;
        for (Item i : items) {
            t+=Double.parseDouble(i.getQuantity())*Double.parseDouble(i.getProduct().getPrice());
        }
        return t;
    }
}
