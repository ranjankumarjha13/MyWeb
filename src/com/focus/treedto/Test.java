package com.focus.treedto;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * Created by admin on 16-01-2019.
 */
public class Test {
    public static void main(String[] args)throws Exception
    {
        AddressDTO addressDTO=new AddressDTO("Ujan","8474074","Darbhanga","Bihar");
        StudentDTO studentDTO=new StudentDTO("Ranjan","8107512","JAVA","2012",addressDTO);
        ObjectMapper objectMapper=new ObjectMapper();
        String jsondataformat=objectMapper.writeValueAsString(studentDTO);
        System.out.println(jsondataformat);
    }
}
