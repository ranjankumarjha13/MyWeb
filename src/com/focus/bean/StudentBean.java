package com.focus.bean;

import java.util.Date;

/**
 * Created by admin on 18-12-2018.
 */
public class StudentBean {
    private String name;
    private String age;
    private String weight;
    private String city;
    private String dob;

   /* @Override
    public String toString() {
        return "StudentBean{" +
                "name='" + name + '\'' +
                ", age='" + age + '\'' +
                ", weight='" + weight + '\'' +
                ", city='" + city + '\'' +
                ", dob='" + dob + '\'' +
                '}';
    }*/

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
