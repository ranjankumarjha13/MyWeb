package com.focus.controller;

import com.focus.dto.ContactsDTO;
import com.focus.dto.MobileButtonActionDto;
import com.focus.dto.MobileDTO;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 07-01-2019.
 */
public class MobileController extends ActionSupport {
    MobileDTO mobileDTO= new MobileDTO();
    MobileDTO mobileDTO1=new MobileDTO();
    List<MobileDTO> list=new ArrayList<>();
    public String getMobileDetails()
    {
        HttpServletRequest request= ServletActionContext.getRequest();
        mobileDTO.setMobilename("SAMSUNG");
        mobileDTO.setManufactureyear("19th Feb 2007");
        mobileDTO.setMobileDescription("Samsung Mobile Is one of the good mobile in the existing market .Internally It consists 4 GB" +
                "RAM along with quadcore Processor with 1.2Ghhz ");
        mobileDTO.setMobileImei("EMS181N6YDEF");
        mobileDTO.setMobilemodel("J210");
        MobileButtonActionDto mobileButtonActionDto=new MobileButtonActionDto();
        mobileButtonActionDto.setButtonlabel("Back");
        mobileButtonActionDto.setMobileaction("CLcard.callCardfirstmobile()");
        MobileButtonActionDto mobileButtonActionDto1=new MobileButtonActionDto();
        mobileButtonActionDto1.setButtonlabel("Contacts");
        mobileButtonActionDto1.setMobileaction("CLcard.secondmoble()");
         mobileDTO.setMobileButtonActionDtos(new MobileButtonActionDto[]{mobileButtonActionDto, mobileButtonActionDto1});
        list.add(mobileDTO);
        if(list!=null&& list.size()>0)
        {
            request.setAttribute("mobiledetails",list);
        }
        else
        {
           return ERROR;
        }
        return "mobiledetails";
    }
    public String getContacts()
    {
        HttpServletRequest request= ServletActionContext.getRequest();
        List<ContactsDTO> l=new ArrayList<>();
        ContactsDTO contactsDTO=new ContactsDTO();
        ContactsDTO contactsDTO1=new ContactsDTO();
        ContactsDTO contactsDTO2=new ContactsDTO();
        ContactsDTO contactsDTO3=new ContactsDTO();
        ContactsDTO contactsDTO4=new ContactsDTO();
        ContactsDTO contactsDTO5=new ContactsDTO();
        ContactsDTO contactsDTO6=new ContactsDTO();
        contactsDTO.setName("Ranjan Kumar jha");
        contactsDTO.setNumber("9939877992");
        contactsDTO1.setName("Tapas");
        contactsDTO1.setNumber("9689547825");
        contactsDTO2.setName("Mayur Legishetthhi");
        contactsDTO2.setNumber("7524145412");
        contactsDTO3.setName("Manish Kumar Jha");
        contactsDTO3.setNumber("7524145412");
        contactsDTO4.setName("Manishanand Watsa");
        contactsDTO4.setNumber("7524145412");
        contactsDTO5.setName("Prabhakar Prasad");
        contactsDTO5.setNumber("7524145412");
        contactsDTO6.setName("Khawaza Zohaib Quadri");
        contactsDTO6.setNumber("7524145412");
        l.add(contactsDTO);
        l.add(contactsDTO1);
        l.add(contactsDTO2);
        l.add(contactsDTO3);
        l.add(contactsDTO4);
        l.add(contactsDTO5);
        l.add(contactsDTO6);
        if(l!=null&&l.size()>0)
        {
            request.setAttribute("contact",l);
            return "contacts";
        }
        else
        {
            return ERROR;
        }
    }
    public  String callNumber()
    {
        return "call";
    }
}
