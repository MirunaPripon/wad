/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;


public class Table {
    private int tableNo;
    private boolean available;
    private int noOfSeats;

    public Table(int tableNo, boolean available, int noOfSeats) {
        this.tableNo = tableNo;
        this.available = available;
        this.noOfSeats = noOfSeats;
    }

    public Table(){
    
    }
    
    public int getTableNo() {
        return tableNo;
    }

    public void setTableNo(int tableNo) {
        this.tableNo = tableNo;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public int getNoOfSeats() {
        return noOfSeats;
    }

    public void setNoOfSeats(int noOfSeats) {
        this.noOfSeats = noOfSeats;
    }

    @Override
    public String toString() {
        return "Table number: " + tableNo + " is available and has : " + noOfSeats + "seats";
    }

    
    
    
}