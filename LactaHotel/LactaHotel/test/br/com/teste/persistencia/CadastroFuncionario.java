/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.teste.persistencia;

import dominio.Funcionario;
import persistencia.FuncionarioBD;

/**
 *
 * @author leandro
 */
public class CadastroFuncionario {
    public static void main(String[] args) {
        
        Funcionario usuario = new Funcionario("Leandro Tavares", "123", "1", "letavs");
        FuncionarioBD.inserir(usuario);

    }
}
