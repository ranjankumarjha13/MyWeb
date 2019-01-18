package com.focus.newdto;

import com.focus.dto.TableDto;

import java.util.ArrayList;

/**
 * Created by admin on 02-01-2019.
 */
public class FormDTO {
    String name;
    String age;
    ArrayList<TabDTO> tabDTOs;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public ArrayList<TabDTO> getTabDTOs() {
        return tabDTOs;
    }

    public void setTabDTOs(ArrayList<TabDTO> tabDTOs) {
        this.tabDTOs = tabDTOs;
    }
}
