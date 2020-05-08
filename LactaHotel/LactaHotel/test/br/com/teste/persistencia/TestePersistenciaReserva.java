/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.teste.persistencia;

import dominio.Reserva;
import persistencia.ReservaBD;

/**
 *
 * @author leandro
 */
public class TestePersistenciaReserva {
    public static void main(String[] args) {
        Reserva reserva1 = new Reserva();
        reserva1.setNumReserva(120);
        reserva1.setQuantDarias(6);

       ReservaBD reservaBD = new ReservaBD();
       reservaBD.inserir(reserva1);
       
       System.out.println("Reserva inserida com sucesso!!!!!");
       System.out.println("Numero da reserva:"+reserva1.getNumReserva()+ "\n"+
                "quat de diarias: "+reserva1.getQuantDarias() );
        
    }
}