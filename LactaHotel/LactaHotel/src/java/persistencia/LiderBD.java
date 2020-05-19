/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Lider;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author leandro
 */
public class LiderBD {
    private static ArrayList<Lider> lista = new ArrayList();
    private static String caminho = "/home/leandro/NetBeansProjects/lideres.xml";
    
    public static void inserir(Lider novoLider){
        lerXml();
        lista.add(novoLider);   
        salvarXml();
    }
   
    public static void alterar(Lider liderAlterado){
        excluir(liderAlterado.getCpf());
        inserir(liderAlterado);
    }
    
     
    public static void excluir(String buscandoPor){
        String cpfFormatado = buscandoPor.replace(" ","");
        lerXml();
        for (int i = 0; i < lista.size(); i++) {
            Lider cadaLider = lista.get(i);
            if (cadaLider.getCpf().equals(cpfFormatado)){
            lista.remove(i);
            break;
            }
        }
        salvarXml();
        
    }
    public static Lider getId(String cpf){
     String cpfFormatado = cpf.replace(" ","");
        lerXml();
        for (int i = 0; i < lista.size(); i++) {
            Lider cadaLider = lista.get(i);
            if (cadaLider.getCpf().equals(cpfFormatado)){
            return cadaLider;
            }
        }return null;
    }
    
    public static ArrayList<Lider> listar(){
        lerXml();
        return lista;
    }
    
    public static void lerXml(){
        File arquivo = new File(caminho);
       
        if (arquivo.exists()) {
            XStream xstream = new XStream();
            xstream.alias("lider", Lider.class);
            lista = (ArrayList<Lider>) xstream.fromXML(arquivo);
                
            } else {
             lista = new ArrayList<Lider>();
            }
    }
    public static void salvarXml(){
        XStream xstream = new XStream();
        xstream.alias("lider", Lider.class);
        
        try {
            File file = new File("/home/leandro/NetBeansProjects/");
            if (!file.exists()){
     //           file.mkdirs(); cria um novo diretorio se ele nao existir
            }
            
//            FileWriter escritor = new FileWriter(new File(file, "lideres.xml"));
              FileWriter escritor = new FileWriter(caminho);
            escritor.write(xstream.toXML(lista));
            escritor.close();
            
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
              
    }
}
