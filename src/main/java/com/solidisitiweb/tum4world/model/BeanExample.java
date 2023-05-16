package com.solidisitiweb.tum4world.model;

import java.io.Serializable;

public class BeanExample implements Serializable {
    /* private attributes */
    private String a;
    private int b;

    public BeanExample() {
    }

    public BeanExample(String a, int b) {
        this.a = a;
        this.b = b;
    }

    public void setA(String a) {
        this.a = a;
    }

    public void setB(int b) {
        this.b = b;
    }

    public String getA() {
        return a;
    }

    public int getB() {
        return b;
    }
}
