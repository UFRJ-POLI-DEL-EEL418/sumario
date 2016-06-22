package eel418_2016_1.DTOs;

import java.io.Serializable;

public class ReferenciaBibliografica implements Serializable{
    private long serialno;
    private String titulo;
    private String autoria;
    private String palchave;

    public long getSerialno() {
        return serialno;
    }

    public void setSerialno(long serialno) {
        this.serialno = serialno;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutoria() {
        return autoria;
    }

    public void setAutoria(String autoria) {
        this.autoria = autoria;
    }

    public String getPalchave() {
        return palchave;
    }

    public void setPalchave(String palchave) {
        this.palchave = palchave;
    }


}
