/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import com.thoughtworks.xstream.XStream;
import dominio.Reserva;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import static persistencia.ReservaBD.salvarXml;

/**
 *
 * @author leandro
 */
public class ReservaBD {
    
    private static ArrayList<Reserva> lista = new ArrayList<>();
    private static String destino = "/home/leandro/Documentos/listaReservas.xml";
    
    public static void inserir(Reserva novaReserva){
        lerXml();
        lista.add(novaReserva);
        salvarXml();
    }
    
    public static void alterar(Reserva reservaAlterada){
        excluir(reservaAlterada.getNumReserva());
        inserir(reservaAlterada);
    }
    
    public static void excluir(int id){
        lerXml();
        for (int i = 0; i < lista.size(); i++) {
            Reserva cadaReserva = lista.get(i);
            if(cadaReserva.getNumReserva() == id);
            lista.remove(i);
        }
       salvarXml();
    }
    public static ArrayList<Reserva> listar(){
        lerXml();
        return lista;
    }
    
    public static void lerXml(){
    File arquivo = new File(destino);
        if(arquivo.exists()){
            XStream stream = new XStream();
            stream.alias("reserva", Reserva.class);
            lista = (ArrayList<Reserva>) stream.fromXML(arquivo);
        }else{
            lista = new ArrayList<Reserva>();
        }
        
    }
    
    public static void salvarXml(){
        XStream stream = new XStream();
        stream.alias(destino, Reserva.class);
        try {
            FileWriter fileWriter = new FileWriter(destino);
            fileWriter.write(stream.toXML(lista));
            fileWriter.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
