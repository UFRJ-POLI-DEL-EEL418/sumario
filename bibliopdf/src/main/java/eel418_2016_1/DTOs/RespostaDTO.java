package eel418_2016_1.DTOs;

import java.io.Serializable;
import javax.json.Json;
import javax.json.JsonObject;

public class RespostaDTO implements Serializable{
    
    private String patrimonio = "";
    private String titulo = "";
    private String autoria = "";
    private String veiculo = "";
    private String datapublicacao = "";
    private String palchave = "";

    public String getPatrimonio() {
        return patrimonio;
    }

    public void setPatrimonio(String patrimonio) {
        this.patrimonio = patrimonio!=null?patrimonio:"";
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo!=null?titulo:"";
    }

    public String getAutoria() {
        return autoria;
    }

    public void setAutoria(String autoria) {
        this.autoria = autoria!=null?autoria:"";
    }

    public String getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(String veiculo) {
        this.veiculo = veiculo!=null?veiculo:"";
    }

    public String getDatapublicacao() {
        return datapublicacao;
    }

    public void setDatapublicacao(String datapublicacao) {
        this.datapublicacao = datapublicacao;
    }

    public String getPalchave() {
        return palchave;
    }

    public void setPalchave(String palchave) {
        this.palchave = palchave!=null?palchave:"";
    }
    
    public JsonObject toJson(){
        return Json.createObjectBuilder()
                    .add("patrimonio",this.patrimonio)
                    .add("titulo",this.titulo)
                    .add("autoria",this.autoria)
                    .add("veiculo",this.veiculo)
                    .add("datapublicacao",this.datapublicacao)
                    .add("palchave",this.palchave)
                    .build();
    }
    
    @Override
    public String toString(){
        return toJson().toString();
    }
}
