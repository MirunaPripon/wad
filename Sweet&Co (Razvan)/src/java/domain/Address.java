/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package domain;


public class Address {
    public String city, street, bell;
    public int district, no, zip, floorN, apt;

    public Address() {
    }
    
    public Address(String city, String street, String bell, int district, int no, int zip, int floorN, int apt) {
        this.city = city;
        this.street = street;
        this.bell = bell;
        this.district = district;
        this.no = no;
        this.zip = zip;
        this.floorN = floorN;
        this.apt = apt;
    }

    public Address(String city, String street, int no) {
        this.city = city;
        this.street = street;
        this.no = no;
    }

    
    
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getBell() {
        return bell;
    }

    public void setBell(String bell) {
        this.bell = bell;
    }

    public int getDistrict() {
        return district;
    }

    public void setDistrict(int district) {
        this.district = district;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getZip() {
        return zip;
    }

    public void setZip(int zip) {
        this.zip = zip;
    }

    public int getFloorN() {
        return floorN;
    }

    public void setFloorN(int floorN) {
        this.floorN = floorN;
    }

    public int getApt() {
        return apt;
    }

    public void setApt(int apt) {
        this.apt = apt;
    }

    @Override
    public String toString() {
        return "" + city + "," + street + ", bell:" + bell + ", district:" + district + ", no:" + no + ", zip:" + zip + ", floor:" + floorN + ", apt:" + apt;
    }
    
}
