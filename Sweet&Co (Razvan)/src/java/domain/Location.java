/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

public class Location {
    private Address address;
    private String description, img, name, phoneNo;

    public Location() {
    }

    public Address getAddress() {
        return address;
    }

    @Override
    public String toString() {
        return "Location{" + "address=" + address + ", description=" + description + ", img=" + img + ", name=" + name + ", phoneNo=" + phoneNo + '}';
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public Location(Address address, String description, String img, String name, String phoneNo) {
        this.address = address;
        this.description = description;
        this.img = img;
        this.name = name;
        this.phoneNo = phoneNo;
    }

}
