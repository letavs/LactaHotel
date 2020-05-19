/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.teste.persistencia;

import dominio.Lider;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import persistencia.LiderBD;

/**
 *
 * @author leandro
 */
public class ExcluirLider {

    public static void main(String[] args) {

        ArrayList<Lider> listaLideres = LiderBD.listar();

        System.out.println("\nINICIO DO TESTE 1| ");
        for (int idx = 0; idx < listaLideres.size(); idx++) {
            String buscar = "777777";
            Lider cadaLider = listaLideres.get(idx);

            System.out.print("Indice: " + idx + "| ");
            System.out.print(cadaLider.getCpf() + ",");
            System.out.print(cadaLider.getNome());

            if (cadaLider.getCpf().equals(buscar)) {
                System.out.print(" *** Encontrado *** ");
//                 listaLideres.remove(idx);// Desse removeu do vetor**  
                LiderBD.excluir(buscar);
                LiderBD.salvarXml(); // Salvou no Xml

            }
            System.out.println();
        }
        System.out.println("\nTESTE 2| ");

        for (int i = 0; i < listaLideres.size(); i++) {
            Lider outrosLider = listaLideres.get(i);
            System.out.print("Indice: " + i + "| ");
            System.out.print(outrosLider.getCpf() + ", ");
            System.out.print(outrosLider.getNome() + "\n");
        }

/////////////////////////////////////////////////////////////////////////
//    ArrayList<Lider> testelistaLideres= new ArrayList<>();
//    Lider novoLider = new Lider();
//    Lider novoLider2 = new Lider();
//    novoLider.setCpf("12345675");
//    novoLider.setNome("Nostradamus Picachu");
//    
//    novoLider2.setCpf("98756312");
//    novoLider2.setNome("Valetino Picasho ");
//    testelistaLideres.add(novoLider);
//    testelistaLideres.add(novoLider2);
//
//    System.out.println("TESTE 1| ");
//    for (int idx = 0; idx < testelistaLideres.size(); idx++) {
//        Lider cadaLider = testelistaLideres.get(idx);
//        System.out.print("Indice: "+idx+"| ");
//        System.out.print(cadaLider.getCpf()+", ");
//        System.out.print(cadaLider.getNome()+"\n");
//    }    
//    testelistaLideres.remove(0);
//            
//    System.out.println("\nTESTE 2| ");
//    for (int i = 0; i < testelistaLideres.size(); i++) {
//        Lider outrosLider = testelistaLideres.get(i);
//        System.out.print("Indice: "+i+"| ");
//        System.out.print(outrosLider.getCpf()+", ");
//        System.out.print(outrosLider.getNome()+"\n");
//    }
    }
}
