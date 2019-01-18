package com.focus.controller;
import com.focus.EmployeeBean;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 12-12-2018.
 */
public class Maincontroller extends ActionSupport {
    public String viewDetails()throws Exception
    {
     HttpServletRequest request= ServletActionContext.getRequest();
        String searchValue=request.getParameter("searchValue");
        searchValue=searchValue+'%';
      List<EmployeeBean> l=new ArrayList<EmployeeBean>();
        String Fetch_Query="select * from emp where name like ?";
        Connection con=null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
            PreparedStatement ps=con.prepareStatement(Fetch_Query);
            ps.setString(1,searchValue);
            ResultSet rs=ps.executeQuery();
            while (rs.next())
            {
                  EmployeeBean eb=new EmployeeBean();
                  eb.setName(rs.getString(1));
                  eb.setMobile(rs.getString(2));
                  eb.setEmail(rs.getString(3));
                eb.setAddress(rs.getString(4));
                eb.setZipcode(rs.getString(5));
                l.add(eb);

            }
        }catch(Exception e){
            System.out.println(e);
        }
        if(l!=null && l.size()>0)
            request.setAttribute("data",l);
        return SUCCESS;

    }
    public String execute()
    {
        HttpServletRequest hrq = ServletActionContext.getRequest();
        String status = hrq.getParameter("Status");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
            PreparedStatement ps = conn.prepareStatement("select status from  likeunliketable");
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                String s = rs.getString(1);
                hrq.setAttribute("Status",s);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "success";
    }
    public String like()
    {
        HttpServletRequest hrq = ServletActionContext.getRequest();
        String status = hrq.getParameter("Status");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
            PreparedStatement ps = conn.prepareStatement("update likeunliketable set status = ?");
            ps.setString(1,status);
            ps.executeUpdate();
            hrq.setAttribute("Status",status);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public String likeunlike()
    {
        return SUCCESS;
    }
}
