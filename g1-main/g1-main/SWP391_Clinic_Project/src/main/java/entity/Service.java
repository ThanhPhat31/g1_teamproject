/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author buitr
 */
public class Service {
    int serviceid;
    String name;
    String description;
    String content;
    String image;

    public Service() {
    }

    public Service(int serviceid, String name, String description, String content, String image) {
        this.serviceid = serviceid;
        this.name = name;
        this.description = description;
        this.content = content;
        this.image = image;
    }

    public int getServiceid() {
        return serviceid;
    }

    public void setServiceid(int serviceid) {
        this.serviceid = serviceid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
     public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    @Override
    public String toString() {
        return "Service{" + "serviceid=" + serviceid + ", name=" + name + ", description=" + description + ", content=" + content + ", image=" + image + '}';
    }
    
}
