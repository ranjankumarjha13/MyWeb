package com.focus.controller;

import com.focus.tabdto.STableDto;
import com.focus.tabdto.Tab1FormDto;
import com.focus.tabdto.Tab1TableDto;
import com.focus.tabdto.Tab2TableDto;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
/**
 * Created by admin on 28-12-2018.
 */
public class TabController extends ActionSupport {
    Tab1FormDto tab1FormDto;
    public Tab1FormDto getTab1FormDto() {
        return tab1FormDto;
    }
    public void setTab1FormDto(Tab1FormDto tab1FormDto) {
        this.tab1FormDto = tab1FormDto;
    }

    public String getTab1data()throws Exception
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request=ServletActionContext.getRequest();
        int result=0;
        String insert_Query="insert into student1 values(?,?,?,?)";
        Connection con=null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
            PreparedStatement ps=con.prepareStatement(insert_Query);
            ps.setString(1,tab1FormDto.getName());
            ps.setString(2,tab1FormDto.getAge());
            ps.setString(3,tab1FormDto.getWeight());
            ps.setString(4,tab1FormDto.getCity());
            result=ps.executeUpdate();
            ArrayList<Tab1TableDto> l1=tab1FormDto.getTab1TableDtos();
            for(int i=0;i< l1.size();i++)
            {
                Tab1TableDto tab1TableDto=l1.get(i);
                PreparedStatement ps2=con.prepareStatement(insert_Query);
                ps2.setString(1,tab1TableDto.getName());
                ps2.setString(2,tab1TableDto.getAge());
                ps2.setString(3,tab1TableDto.getWeight());
                ps2.setString(4,tab1TableDto.getCity());
                ps2.executeUpdate();
            }
            ArrayList<Tab2TableDto> l2=tab1FormDto.getTab2TableDtos();
            for(int i=0;i< l2.size();i++)
            {
               Tab2TableDto tab2TableDto=l2.get(i);
                PreparedStatement ps3=con.prepareStatement(insert_Query);
                ps3.setString(1,tab2TableDto.getName());
                ps3.setString(2,tab2TableDto.getAge());
                ps3.setString(3,tab2TableDto.getWeight());
                ps3.setString(4,tab2TableDto.getCity());
                ps3.executeUpdate();
            }
          /* Tab1FormDto tab1FormDto=getTab1FormDto();*/
       if(result!=0)
        {
            response.getOutputStream().print("Data Posted Successfully");/**/
        }
        else
        {
            response.getOutputStream().print("Failed ! Try again");
        }

        Tab1FormDto tab1FormDto=getTab1FormDto();
        return null;
    }
    public String getStable()
    {
        return "tab";
    }

}
