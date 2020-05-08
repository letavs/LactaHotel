/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistencia;

import dominio.Funcionario;
import java.util.ArrayList;

/**
 *
 * @author leandro
 */
public class FuncionarioBD {

    private static ArrayList<Funcionario> listaFuncionarios = new ArrayList<Funcionario>();
    
    public static void inserir(Funcionario novoFuncionario) {
        LiderBD.lerXml();
        listaFuncionarios.add(novoFuncionario);
    }
    

}
