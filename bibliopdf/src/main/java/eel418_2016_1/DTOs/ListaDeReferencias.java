package eel418_2016_1.DTOs;

import java.io.Serializable;
import java.util.ArrayList;

public class ListaDeReferencias implements Serializable{
    private ArrayList<ReferenciaBibliografica> listaReferencias = new ArrayList<>();

    public void add(ReferenciaBibliografica ref){
        listaReferencias.add(ref);
    }
    
    public ArrayList<ReferenciaBibliografica> getListaReferencias() {
        return listaReferencias;
    }

    public void setListaReferencias(ArrayList<ReferenciaBibliografica> listaReferencias) {
        this.listaReferencias = listaReferencias;
    }


}
