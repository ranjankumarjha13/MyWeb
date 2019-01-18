package com.focus.controller;
import com.focus.newdto.FormDTO;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
/**
 * Created by admin on 02-01-2019.
 */
public class SController extends ActionSupport {
    FormDTO formDTO;
    public FormDTO getFormDTO() {
        return formDTO;
    }
    public void setFormDTO(FormDTO formDTO) {
        this.formDTO = formDTO;
    }
    public  String getStable()
    {
        HttpServletRequest request= ServletActionContext.getRequest();
        request.setAttribute("index",request.getParameter("index"));
        return SUCCESS;
    }
    public String getFormData()throws Exception
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request=ServletActionContext.getRequest();
        int result=0;
        String insert_Query="insert into stable values(?,?)";
        Connection con=null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
        PreparedStatement ps=con.prepareStatement(insert_Query);
        ps.setString(1,formDTO.getName());
        ps.setString(2,formDTO.getAge());
        result=ps.executeUpdate();
        if(result!=0)
        {
            response.getOutputStream().print("Data Added Successfully");
        }
        else
        {
            response.getOutputStream().print("Internal issue");
        }
            FormDTO f=getFormDTO();
            return null;
}
        }
