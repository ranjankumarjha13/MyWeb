package com.focus.newdto;

import java.util.ArrayList;

/**
 * Created by admin on 02-01-2019.
 */
public class TabDTO {
    int tabindex;
    ArrayList<TableDTO> tableDTOs;
    public int getTabindex() {
        return tabindex;
    }
    public void setTabindex(int tabindex) {
        this.tabindex = tabindex;
    }
    public ArrayList<TableDTO> getTableDTOs() {
        return tableDTOs;
    }
    public void setTableDTOs(ArrayList<TableDTO> tableDTOs) {
        this.tableDTOs = tableDTOs;
    }
}
