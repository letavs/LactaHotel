/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.teste.persistencia;

import dominio.Lider;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import persistencia.LiderBD;

/**
 *
 * @author leandro
 */
public class CadastrarLider {
    
    public static void main(String[] args) throws ParseException {
    
        Lider lider = new Lider();
        SimpleDateFormat formart = new SimpleDateFormat("dd/MM/YYYY");
        
      
        LocalDate novaData =  LocalDate.of(1960, 6, 10);
        Date date = new Date(1960, 6, 1);
        String dt = formart.format(01/06/1960);
        
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String nd = novaData.format(dtf);
        
        lider.setNome("Elieze");
        lider.setCpf("20");
        lider.setDtNasc(date);
        lider.setCidade("Paraiba");
        lider.setEstado("PB");

//        LiderBD.inserir(lider);
        System.out.println("Date "+lider.getDtNasc());
        System.out.println("DateTimeFormatter "+nd);
        System.out.println("SimpleDateFormat "+dt);
    }
    
}
