package com.solidisitiweb.tum4world.model;

import java.io.Serializable;
import java.util.Random;

public class FraseMotivazionale implements Serializable {

    String[] frasi = {"Uniamo le nostre forze per guarire il mondo, un gesto alla volta","Ogni donazione, grande o piccola, fa la differenza nella vita delle persone che serviamo",
            "Insieme possiamo superare le sfide e costruire un futuro piu sano e luminoso","Il nostro impegno e' guidato dalla speranza di creare un mondo in cui nessuno sia lasciato indietro nella lotta per la salute e il benessere",
            "Insieme possiamo superare le sfide, guarire le ferite e costruire una comunita' globale basata sulla solidarieta' e sulla cura reciproca",
            "La vera ricchezza si trova nell'aiutare gli altri. Unisciti a noi e scopri il valore di un gesto altruistico con Tum4World",
            "Il cambiamento inizia da una scintilla di compassione. Sii quella scintilla e aiuta Tum4World a brillare più forte"};

    int index;

    public FraseMotivazionale() {
         index = new Random().nextInt(frasi.length);
    }

    public String getFrase() {
        return frasi[index];
    }
}
