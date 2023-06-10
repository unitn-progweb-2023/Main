package com.solidisitiweb.tum4world.model;

import java.io.Serializable;

public class Visita implements Serializable {
    private String page;
    private int visit;

    public int getVisit() {
        return visit;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public void setVisit(int visit) {
        this.visit = visit;
    }
}
