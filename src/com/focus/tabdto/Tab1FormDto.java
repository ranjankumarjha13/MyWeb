
/**
 * Created by admin on 27-12-2018.
 */
package com.focus.tabdto;
import java.util.ArrayList;
import java.util.List;
public class Tab1FormDto {
    private String name;
    private  String age;
    private  String weight;
    private  String city;

    List<ArrayList<STableDto>> lists;
    public List<ArrayList<STableDto>> getLists() {
        return lists;
    }
    public void setLists(List<ArrayList<STableDto>> lists) {
        this.lists = lists;
    }
    ArrayList<Tab1TableDto> tab1TableDtos;
    ArrayList<Tab2TableDto> tab2TableDtos;

    public ArrayList<Tab2TableDto> getTab2TableDtos() {
        return tab2TableDtos;
    }

    public void setTab2TableDtos(ArrayList<Tab2TableDto> tab2TableDtos) {
        this.tab2TableDtos = tab2TableDtos;
    }

    public ArrayList<Tab1TableDto> getTab1TableDtos() {
        return tab1TableDtos;
    }
    public void setTab1TableDtos(ArrayList<Tab1TableDto> tab1TableDtos) {
        this.tab1TableDtos = tab1TableDtos;
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
}
