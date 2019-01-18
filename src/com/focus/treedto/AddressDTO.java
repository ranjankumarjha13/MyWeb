package com.focus.treedto;

import java.io.Serializable;

/**
 * Created by admin on 16-01-2019.
 */
public class AddressDTO implements Serializable{
    @Override
    public String toString() {
        return "AddressDTO{" +
                "street='" + street + '\'' +
                ", pincode='" + pincode + '\'' +
                ", dist='" + dist + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    private String street;
    private String pincode;
    private String dist;
    private String state;

    public AddressDTO(String street, String pincode, String dist, String state) {
        this.street = street;
        this.pincode = pincode;
        this.dist = dist;
        this.state = state;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getDist() {
        return dist;
    }

    public void setDist(String dist) {
        this.dist = dist;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
