package com.focus.controller;

import com.focus.bean.StudentBean;
import com.focus.dto.FormDto;
import com.focus.dto.TableDto;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 18-12-2018.
 */
public class StudentController extends ActionSupport {
    StudentBean sb;
    FormDto formDto;
    public FormDto getFormDto() {
        return formDto;
    }
    public void setFormDto(FormDto formDto) {
        this.formDto = formDto;
    }
    public StudentBean getSb() {
        return sb;
    }
    public void setSb(StudentBean sb) {
        this.sb = sb;
    }
    public String addStudent()throws Exception
    {
        FormDto f=getFormDto();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request=ServletActionContext.getRequest();
        int result=0;
        String insert_Query="insert into student values(?,?,?,?,?)";
        Connection con=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
            PreparedStatement ps=con.prepareStatement(insert_Query);
            ps.setString(1, formDto.getName());
            ps.setString(2,formDto.getAge());
            ps.setString(3,formDto.getWeight());
            ps.setString(4,formDto.getCity());
            ps.setString(5,formDto.getDob());
            result=ps.executeUpdate();
             ArrayList<TableDto> l= (ArrayList<TableDto>) formDto.getTableDtos();
            List<TableDto> list = formDto.getTableDtos();
            for (int i=0;i<l.size();i++){
                TableDto tableDto = (TableDto) l.get(i);
                PreparedStatement ps2=con.prepareStatement(insert_Query);
                ps2.setString(1,request.getParameter("formDto.tableDtos["+i+"].name"));
                ps2.setString(2,tableDto.getAge());
                ps2.setString(3,tableDto.getWeight());
                ps2.setString(4,tableDto.getCity());
                ps2.setString(5,tableDto.getDob());
                result=ps2.executeUpdate();
            }
        }catch(Exception e){
            System.out.println(e);
        }
        if(result!=0)
        {
            response.getOutputStream().print("Data Posted Successfully");
        }
        else
        {
            response.getOutputStream().print("Failed ! Try again");
        }
        return null;
    }
    public  String getStudentDetails()
    {
        HttpServletRequest request=ServletActionContext.getRequest();
        List<StudentBean> l=new ArrayList<StudentBean>();
        String Fetch_Query="select *from student";
        Connection con=null;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
            PreparedStatement ps=con.prepareStatement(Fetch_Query);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                StudentBean sb=new StudentBean();
                sb.setName(rs.getString(1));
                sb.setAge(rs.getString(2));
                sb.setWeight(rs.getString(3));
                sb.setCity(rs.getString(4));
                sb.setDob(rs.getString(5));
                l.add(sb);
                System.out.println(l);
            }
        }
        catch (Exception e){e.getCause();}
        if(l!=null && l.size()>0)
            request.setAttribute("data",l);
        return SUCCESS;
    }
    public String upadateStudent()
    {
        int result=0;
        Connection con=null;
      String UPDATE_QUERY="UPDATE STUDENT SET NAME=?,AGE=?,WEIGHT=?,CITY=?,DOB=? WHERE NAME=?";
      try{
          Class.forName("oracle.jdbc.driver.OracleDriver");
          con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
          PreparedStatement ps=con.prepareStatement(UPDATE_QUERY);
          ps.setString(1,sb.getName());
          ps.setString(2,sb.getAge());
          ps.setString(3,sb.getWeight());
          ps.setString(4,sb.getCity());
          ps.setString(5,sb.getDob());
          ps.executeUpdate();
      }
      catch (Exception e){
          e.getCause();
      }
        return SUCCESS;
    }
    public String deleteRow()
    {
        HttpServletRequest request=ServletActionContext.getRequest();
        String DELETE_QUERY="DELETE FROM student WHERE name=?";
        Connection con=null;
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            System.out.println("class loaded");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","ranjan");
            System.out.println("Connection esatblished");
        }
        catch (Exception e)
        {

        }

        return SUCCESS;
    }

    public String getFormData()
    {
            FormDto dto = getFormDto();
        return  null;
    }
    public String addStudentdetails()throws Exception
    {
        StudentBean s=getSb();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request=ServletActionContext.getRequest();
        int result=0;
        String insert_Query="insert into student values(?,?,?,?,?)";
        Connection con=null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
        PreparedStatement ps=con.prepareStatement(insert_Query);
        ps.setString(1,sb.getName());
        ps.setString(2,sb.getAge());
        ps.setString(3,sb.getWeight());
        ps.setString(4,sb.getCity());
        ps.setString(5,sb.getDob());
        result=ps.executeUpdate();
        if(result!=0)
        {
            response.getOutputStream().print("Data Posted Successfully");
        }
        else
        {
            response.getOutputStream().print("Failed ! Try again");
        }
        return null;
    }
    public  String deletestudentDetails()throws Exception
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request=ServletActionContext.getRequest();
        String name=request.getParameter("name");
        String DELETE_QUERY="DELETE FROM STUDENT WHERE NAME=?";
        Connection con=null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
        PreparedStatement ps=con.prepareStatement(DELETE_QUERY);
        ps.setString(1, name);
        int ret = ps.executeUpdate();
        if(ret!=0)
        {
            response.getOutputStream().print("Data Deleted  Successfully");
        }
        else
        {
            response.getOutputStream().print("Try again!!!!!!!!");
        }
        return null;
    }
}
