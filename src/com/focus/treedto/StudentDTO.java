package com.focus.treedto;

import java.io.Serializable;

/**
 * Created by admin on 16-01-2019.
 */
public class StudentDTO implements Serializable {

    private String name;
    private String rollno;
    private String courses;
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRollno() {
        return rollno;
    }

    public void setRollno(String rollno) {
        this.rollno = rollno;
    }

    public String getCourses() {
        return courses;
    }

    public void setCourses(String courses) {
        this.courses = courses;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public AddressDTO getAddressDTO() {
        return addressDTO;
    }

    public void setAddressDTO(AddressDTO addressDTO) {
        this.addressDTO = addressDTO;
    }

    private String year;
    private AddressDTO addressDTO;

    @Override
    public String toString() {
        return "StudentDTO{" +
                "name='" + name + '\'' +
                ", rollno='" + rollno + '\'' +
                ", courses='" + courses + '\'' +
                ", year='" + year + '\'' +
                ", addressDTO=" + addressDTO +
                '}';
    }

    public StudentDTO(String name, String rollno, String courses, String year, AddressDTO addressDTO) {
        this.name = name;
        this.rollno = rollno;
        this.courses = courses;
        this.year = year;
        this.addressDTO = addressDTO;
    }
}
