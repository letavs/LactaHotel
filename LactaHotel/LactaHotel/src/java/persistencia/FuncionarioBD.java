/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Funcionario;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author leandro
 */
public class FuncionarioBD {

    private static ArrayList<Funcionario> lista = new ArrayList();
    private static String caminho = "/home/leandro/NetBeansProjects/funcionarios.xml";
    
    public static void inserir(Funcionario novoFuncionario) {
        lerXml();
        lista.add(novoFuncionario);
        salvarXml();
        
    }
       public static void alterar(Funcionario funcAlterado){
        excluir(funcAlterado.getId());
        inserir(funcAlterado);
    }
       
    public static void excluir(String id){
        lerXml();
        for (int i = 0; i < lista.size(); i++) {
            Funcionario cadaFun = lista.get(i);
            if(cadaFun.getId().equals(id)){
            lista.remove(i);
            break;
            }
        }salvarXml();
    }
 
    public static Funcionario getId(String id){
        lerXml();
        for (int i = 0; i < lista.size(); i++) {
            Funcionario cadaFun = lista.get(i);
            if (cadaFun.getId().equals(id)) {
                return cadaFun;
            } 
        }return null;
    } 
    
    public static ArrayList<Funcionario> listar(){
        lerXml();
        return lista;
    }
    
    public static void lerXml() {
        File arquivo = new File(caminho);
        
        if (arquivo.exists()) {
            XStream xStream = new XStream();
            xStream.alias("funcionario", Funcionario.class);
            lista = (ArrayList<Funcionario>) xStream.fromXML(arquivo);
        
        }else{
            lista = new ArrayList<Funcionario>();
        }
    }
    
    public static void salvarXml() {
        XStream xStream = new XStream();
        xStream.alias("funcionario", Funcionario.class);
        
        try {
            File file = new File("/home/leandro/NetBeansProjects/");
            if(!file.exists()){
            }
            
            FileWriter escritor = new FileWriter(caminho);
            escritor.write(xStream.toXML(lista));
            escritor.close();
            
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
    
    public static Funcionario buscarUsuarioSenha(String usuario, String senha){
      lerXml();
      Funcionario usuarioEncontrado = null;
        for (int i = 0; i < lista.size(); i++) {
            Funcionario cadaUsuario = lista.get(i);
            if(cadaUsuario.getLogin().equals(usuario) && (cadaUsuario.getSenha().equals(senha))){
                usuarioEncontrado = cadaUsuario;
                break;
            }
        }
      return usuarioEncontrado;
    }
}

