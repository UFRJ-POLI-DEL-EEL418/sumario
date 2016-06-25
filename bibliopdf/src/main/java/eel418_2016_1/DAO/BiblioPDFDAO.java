package eel418_2016_1.DAO;

import eel418_2016_1.DTOs.RespostaCompletaDTO;
import eel418_2016_1.DTOs.RespostaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.json.JsonObject;
import utils.Utils;

public class BiblioPDFDAO extends BaseDAO {

//------------------------------------------------------------------------------    
    public RespostaCompletaDTO buscarListaPorPalavraDoTitulo(JsonObject dados){
        RespostaCompletaDTO listaRefsDTO = new RespostaCompletaDTO();
        RespostaDTO umaRefDTO = null;

        String[] palavrasDaBusca = extrairPalavrasDaBusca(dados);
        String preparedStatement = prepararComandoSQL(palavrasDaBusca);
        try(Connection conexao = getConnection()){
            PreparedStatement comandoSQL = conexao.prepareStatement(preparedStatement);
            
            for(int i=0;i<palavrasDaBusca.length;i++){
                comandoSQL.setString(i+1, palavrasDaBusca[i]);
            }
            
            ResultSet rs = comandoSQL.executeQuery();
            while(rs.next()){
                umaRefDTO = new RespostaDTO();
                umaRefDTO.setPatrimonio(Long.toString(rs.getLong("patrimonio")));
                umaRefDTO.setTitulo(rs.getString("titulo"));
                umaRefDTO.setAutoria(rs.getString("autoria"));
                listaRefsDTO.addResposta(umaRefDTO);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaRefsDTO;
    }
//------------------------------------------------------------------------------    
    private String[] extrairPalavrasDaBusca(JsonObject dados){
        JsonObject dados2 = dados.getJsonObject("titulo");
        String busca = dados2.getString("texto");
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

    public String salvarNovo(JsonObject dados) {
        ResultSet rst = null;
        long patrimonio = 0L;
        String titulo = dados.getString("titulo").trim();
        titulo = titulo.replaceAll("\\s+", " ");
        
        try (Connection conexao = getConnection()) {
            // BEGIN TRANSACTION
            conexao.setAutoCommit(false);
            // PRIMEIRA TABELA
            PreparedStatement comandoSQL = conexao.prepareStatement(
            "INSERT INTO dadoscatalogo (titulo,autoria) VALUES(?,?) "+
            "RETURNING patrimonio;");
            
            comandoSQL.setString(1, titulo);
            comandoSQL.setString(2, dados.getString("autoria"));
            rst = comandoSQL.executeQuery();
            rst.next();
            patrimonio = rst.getLong("patrimonio");
            // SEGUNDA TABELA
            String[] palavrasDaBusca = extrairPalavrasDaBusca(dados);
            for (String cadaPalavra : palavrasDaBusca) {
                comandoSQL = conexao.prepareStatement(
            "INSERT INTO palavrastitulonormal (palavra_titulo_normal,patrimonio) "+
            "VALUES(?,?);");
                comandoSQL.setString(1, cadaPalavra);
                comandoSQL.setLong(2, patrimonio);
                comandoSQL.executeUpdate();
            }
            // COMMIT TRANSACTION
            conexao.commit();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "{\"patrimonio\":\""+Long.toString(patrimonio)+"\"}";
    }

//------------------------------------------------------------------------------
}
