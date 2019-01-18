package com.focus.treedto;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 14-01-2019.
 */
public class TreeViewDto {
    private String rootnode;
    List<ViewNode> viewNodes=new ArrayList<>();

    public String getRootnode() {
        return rootnode;
    }

    public void setRootnode(String rootnode) {
        this.rootnode = rootnode;
    }

    public List<ViewNode> getViewNodes() {
        return viewNodes;
    }

    public void setViewNodes(List<ViewNode> viewNodes) {
        this.viewNodes = viewNodes;
    }
}
