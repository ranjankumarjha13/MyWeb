package com.focus.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 20-12-2018.
 */
public class FormDto {

    private String name;
    private String age;
    private String weight;
    private String city;
    private String dob;
   private ArrayList<TableDto> tableDtos;
    public List<TableDto> getTableDtos() {
        return tableDtos;
    }
    public void setTableDtos(ArrayList<TableDto> tableDtos) {
        this.tableDtos = tableDtos;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getAge() {
        return age;
    }
    public void setAge(String age) {
        this.age = age;
    }
    public String getWeight() {
        return weight;
    }
    public void setWeight(String weight) {
        this.weight = weight;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    public String getDob() {
        return dob;
    }
    public void setDob(String dob) {
        this.dob = dob;
    }
}
