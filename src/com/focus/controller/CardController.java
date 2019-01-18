package com.focus.controller;

import com.focus.dto.CardActionDTO;
import com.focus.dto.CardDTO;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 * Created by admin on 04-01-2019.
 */
public class CardController extends ActionSupport {
    List<CardDTO> list=new ArrayList<>();
    CardDTO cardDTO=new CardDTO();
    CardDTO cardDTO1=new CardDTO();
    CardDTO cardDTO2=new CardDTO();
    CardDTO cardDTO3=new CardDTO();
    CardDTO cardDTO4=new CardDTO();
    CardDTO cardDTO5=new CardDTO();
    public List<CardDTO> getList() {
        return list;
    }
    String Fetch_Query="select *from card";
    Connection con=null;
    public void setList(List<CardDTO> list) {
        this.list = list;
    }
    public CardDTO getCardDTO() {
        return cardDTO;
    }
    public void setCardDTO(CardDTO cardDTO) {
        this.cardDTO = cardDTO;
    }
    public String getCard()throws  Exception
    {
        CardActionDTO cardActionDTO=new CardActionDTO();
        cardActionDTO.setLabel("Edit");
        cardActionDTO.setAction("alert('hi edit')");
        CardActionDTO cardActionDTO1=new CardActionDTO();
        cardActionDTO1.setLabel("Save");
        cardActionDTO1.setAction("alert('hi save')");
        CardActionDTO cardActionDTO2=new CardActionDTO();
        cardActionDTO2.setLabel("Delete");
        cardActionDTO2.setAction("alert('hi Delete')");
        HttpServletRequest request= ServletActionContext.getRequest();
        cardDTO.setTitle("SAMSUNG");
        cardDTO.setContent("This is good Mobile");
        cardDTO.setButtnclass("btn btn-primary");
        cardDTO.setCardActionDTO(new CardActionDTO[]{cardActionDTO, cardActionDTO1});
        cardDTO1.setTitle("Sony");
        cardDTO1.setContent("Hi am Sony Mobile");
        cardDTO1.setButtnclass("btn btn-danger");
        cardDTO1.setCardActionDTO(new CardActionDTO[]{cardActionDTO2});
        list.add(cardDTO);
        list.add(cardDTO1);
        CardDTO cardDTOe=getCardDTO();
      /*  Class.forName("oracle.jdbc.driver.OracleDriver");
        con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "ranjan");
        PreparedStatement ps=con.prepareStatement(Fetch_Query);
        ResultSet rs=ps.executeQuery();
        int i=0;
        while (rs.next())
        {
            CardDTO cardDTO=new CardDTO();
            cardDTO.setTitle(rs.getString(1));
            cardDTO.setContent(rs.getString(2));
            cardDTO.setButton(rs.getString(3));
            list.add(cardDTO);
        }
        int result=list.size();*/
        if(list.size()>0)
        {
           request.setAttribute("listofcard",list);
            return SUCCESS;
        }
        else
        {
            return ERROR;
        }
    }
}
