/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;

public class Booking {
    private String date, time;
    private User u;
    private Table t;

    public Booking(String date, String time, User u, Table t) {
        this.date = date;
        this.time = time;
        this.u = u;
        this.t = t;
    }
    
    public Booking(String date, String time, Table t) {
        this.date = date;
        this.time = time;
        
        this.t = t;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public User getU() {
        return u;
    }

    public void setU(User u) {
        this.u = u;
    }

    public Table getT() {
        return t;
    }

    public void setT(Table t) {
        this.t = t;
    }

    @Override
    public String toString() {
        return "Booking{" + "date=" + date + ", time=" + time + ", t=" + t.toString() + '}';
    }
    

    
}