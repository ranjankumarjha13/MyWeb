package com.focus.controller;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by admin on 21-01-2019.
 */
public class Navcontroller extends ActionSupport {
    public String getpage()
    {
        HttpServletRequest request= ServletActionContext.getRequest();
        String page=request.getParameter("option");
        request.setAttribute("optiondata",page);
        return "page";
    }
}
