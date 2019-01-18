package com.focus;

import java.lang.reflect.Field;

/**
 * Created by admin on 14-01-2019.
 */
public class TestJson {
    String name;
    String age;
    String mobile;

    String address;

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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

  /*  @Override
    public String toString() {
        return "TestJson{" +
                "name='" + name + '\'' +
                ", age='" + age + '\'' +
                ", mobile='" + mobile + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
*/
 /*   public TestJson(String name, String age, String mobile, String address) {
        this.name = name;
        this.age = age;
        this.mobile = mobile;
        this.address = address;
    }*/
    public  String getJsonTypeData(Class clas)
    {
        Field fields[]=clas.getDeclaredFields();
        for(Field field:fields)
        {
            System.out.println(field.getName());
        }
        return null;
    }
    public  static  void main(String[] args)
    {
       /* TestJson testJson=new TestJson("Ranjan","25","99398","Hyderabad");*/
        TestJson testJson=new TestJson();
        testJson.setName("Ranjan");
        testJson.setAge("24");
        testJson.setMobile("666");
        testJson.setAddress("hyderabad");
        String fieldssss=testJson.getJsonTypeData(TestJson.class);
        for(int  i=0;i<fieldssss.length();i++)
        {
            System.out.println(fieldssss);
            System.out.println(testJson.getName());
        }

    }


}
