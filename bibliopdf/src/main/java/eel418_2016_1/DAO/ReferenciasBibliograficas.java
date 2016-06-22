package eel418_2016_1.DAO;

import eel418_2016_1.DTOs.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.*;

public class ReferenciasBibliograficas extends BaseDAO{

//------------------------------------------------------------------------------    
    public ArrayList<ReferenciaBibliografica> buscarListaPorPalavraDoTitulo(DadosDaBusca dados){
        ArrayList<ReferenciaBibliografica> lista = new ArrayList<>();
        ReferenciaBibliografica ref = null;

        String[] palavrasDaBusca = extrairPalavrasDaBusca(dados);
        String preparedStatement = prepararComandoSQL(palavrasDaBusca);
        
        try(Connection conexao = getConnection()){
            PreparedStatement comandoSQL = conexao.prepareStatement(preparedStatement);
            
            for(int i=0;i<palavrasDaBusca.length;i++){
                comandoSQL.setString(i+1, palavrasDaBusca[i]);
            }
            
            ResultSet rs = comandoSQL.executeQuery();
            while(rs.next()){
                ref = new ReferenciaBibliografica();
                ref.setSerialno(rs.getLong("patrimonio"));
                ref.setTitulo(rs.getString("titulo"));
                ref.setAutoria(rs.getString("autoria"));
                lista.add(ref);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return lista;
    }
//------------------------------------------------------------------------------    
    private String[] extrairPalavrasDaBusca(DadosDaBusca dados){
        String busca = dados.getTitulo();
        busca = Utils.removeDiacriticals(busca);
        String[] temp = busca.split(" ");
        for(int i=0;i<temp.length;i++){
            temp[i] = temp[i].trim();
        }
        return temp;    
    }
//------------------------------------------------------------------------------    
    private String prepararComandoSQL(String[] palavrasDaBusca){
/*
Exemplo:
        
SELECT T1.patrimonio, T1.titulo, T1.autoria, (count(*)) AS nrohits
FROM dadoscatalogo T1
INNER JOIN palavrastitulonormal T2 ON(T1.patrimonio = T2.patrimonio) WHERE

T2.palavra_titulo_normal LIKE 'MAVEN'        
OR        
T2.palavra_titulo_normal LIKE 'STYLES'
        
GROUP BY T1.patrimonio, T1.titulo, T1.autoria ORDER BY nrohits DESC, titulo ASC;        
*/
        String inicioSelectExterno = 
        "SELECT T1.patrimonio, T1.titulo, T1.autoria, (count(*)) AS nrohits \n" +
        "FROM dadoscatalogo T1 \n" +
        "INNER JOIN palavrastitulonormal T2 ON(T1.patrimonio = T2.patrimonio) WHERE \n";
        
        String finalSelectExterno = 
        "GROUP BY T1.patrimonio, T1.titulo, T1.autoria ORDER BY nrohits DESC, titulo ASC;";
        
        String baseComando = "T2.palavra_titulo_normal LIKE ? \n";
        
        String comando = "";
        for(int i=0;i<palavrasDaBusca.length;i++){
            comando = comando + baseComando;
            if(i<(palavrasDaBusca.length-1)){
                comando = comando + "OR \n";
            }
        }
        comando = inicioSelectExterno + comando + finalSelectExterno;
        return comando;
    }    
//------------------------------------------------------------------------------
}
        