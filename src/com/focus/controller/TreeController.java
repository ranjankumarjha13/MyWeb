package com.focus.controller;

import com.focus.treedto.Address;
import com.focus.treedto.Person;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by admin on 14-01-2019.
 */
public class TreeController extends ActionSupport {
    public String getTreeview() throws IOException {
        Person p=new Person();
        Address a=new Address();
        a.setZipCode("5656");
        a.setCity("mubai");
        a.setState("Telangan");
        a.setStreet("ameerpet");
        p.setFirstName("Ranjan");
        p.setLastName("kumarjha");
        p.setAge(25);
        p.setAlias("nuull");
        p.setMale(true);
        p.setAddress(a);
        ObjectMapper objectMapper = new ObjectMapper();
        String value = objectMapper.writeValueAsString(p);
        HttpServletRequest request= ServletActionContext.getRequest();
        request.setAttribute("jsondata",value);
        return "getTreeview";
    }
}
