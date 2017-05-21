/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

import java.util.ArrayList;


public class Order {
    private int id;
    private ArrayList<Food> foods;
    private double totalPrice;
    private Address address;

    public Order(ArrayList<Food> foods, double totalPrice, Address address) {
        this.foods = foods;
        this.totalPrice = totalPrice;
        this.address = address;
    }
    public Order(ArrayList<Food> foods, double totalPrice, Address address,int id) {
        this.foods = foods;
        this.totalPrice = totalPrice;
        this.address = address;
        this.id=id;
    }

    public Order() {
    }

    public ArrayList<Food> getFoods() {
        return foods;
    }

    public void setFoods(ArrayList<Food> foods) {
        this.foods = foods;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }
    public int getId(){
        return id;
    }

    @Override
    public String toString() {
        return "Order{" + "foods=" + foods + ", totalPrice=" + totalPrice + ", address=" + address + '}';
    }
    
}
