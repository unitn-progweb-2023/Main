package com.solidisitiweb.tum4world.model;

import java.io.Serializable;

public class FraseBean implements Serializable {

    private String frase;

    public FraseBean(){ this.frase= "Frase motivazionale"; };

    public FraseBean(String frase) {
        this.frase = frase;
    }

    public String getFrase() {
        return frase;
    }

    public void setFrase(String frase) {
        this.frase = frase;
    }

    @Override
    public String toString() {
        return this.frase;
    }
}
