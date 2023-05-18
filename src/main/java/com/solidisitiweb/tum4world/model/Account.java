package com.solidisitiweb.tum4world.model;

import java.io.Serializable;

public class Account implements Serializable {
    private String Nome;
    private String Cognome;
    private String Email;
    private String Cellulare;
    private String DataDiNascita;
    private String Username;

    public Account() {
    }

    public Account(String nome, String cognome, String email, String cellulare, String dataDiNascita, String username) {
        Nome = nome;
        Cognome = cognome;
        Email = email;
        Cellulare = cellulare;
        DataDiNascita = dataDiNascita;
        Username = username;
    }

    public void setNome(String nome) {
        Nome = nome;
    }

    public void setCognome(String cognome) {
        Cognome = cognome;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public void setCellulare(String cellulare) {
        Cellulare = cellulare;
    }

    public void setDataDiNascita(String dataDiNascita) {
        DataDiNascita = dataDiNascita;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public String getNome() {
        return Nome;
    }

    public String getCognome() {
        return Cognome;
    }

    public String getEmail() {
        return Email;
    }

    public String getCellulare() {
        return Cellulare;
    }

    public String getDataDiNascita() {
        return DataDiNascita;
    }

    public String getUsername() {
        return Username;
    }
}
