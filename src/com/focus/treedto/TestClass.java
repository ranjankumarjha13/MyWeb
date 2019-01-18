package com.focus.treedto;

import org.codehaus.jackson.map.ObjectMapper;

/**
 * Created by admin on 14-01-2019.
 */
public class TestClass {
    public static void main(String[] args)throws Exception
    {
        Address johnDoeAddress = new Address("100 Elm Way", "Foo City", "NJ", "01234");
        Person johnDoe = new Person("John", "Doe", null, 29, true, johnDoeAddress);
        ObjectMapper objectMapper=new ObjectMapper();
        String json=objectMapper.writeValueAsString(johnDoe);
        System.out.println(json);
    }
}
