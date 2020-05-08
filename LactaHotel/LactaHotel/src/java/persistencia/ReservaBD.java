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
    
    public static ArrayList<Reserva> listaResevas = new ArrayList<>();
    public static String destino = "/home/leandro/Documentos/listaReservas.xml";
    
    public void inserir(Reserva novaReserva){
        lerXml();
        listaResevas.add(novaReserva);
        salvarXml();
    }
    
    public void alterar(Reserva reservaAlterada){
        excluir(reservaAlterada.getNumReserva());
        inserir(reservaAlterada);
    }
    
    public void excluir(int id){
        lerXml();
        for (int i = 0; i < listaResevas.size(); i++) {
            Reserva cadaReserva = listaResevas.get(i);
            if(cadaReserva.getNumReserva() == id);
            listaResevas.remove(i);
        }
       salvarXml();
    }
    public ArrayList<Reserva> listar(){
        lerXml();
        return listaResevas;
    }
    
    public static void lerXml(){
    File arquivo = new File(destino);
        if(arquivo.exists()){
            XStream stream = new XStream();
            stream.alias("lista", Reserva.class);
            listaResevas = (ArrayList<Reserva>) stream.fromXML(arquivo);
        }else{
            listaResevas = new ArrayList<Reserva>();
        }
        
    }
    
    public static void salvarXml(){
        XStream stream = new XStream();
        stream.alias(destino, Reserva.class);
        try {
            FileWriter fileWriter = new FileWriter(destino);
            fileWriter.write(stream.toXML(listaResevas));
            fileWriter.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
