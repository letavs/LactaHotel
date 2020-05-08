/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dominio;

import java.util.Date;

/**
 *
 * @author leandro
 */
public class Reserva {

    private Date dataCadastro;
    private Date dataReserva;
    private int quantDarias;
    private Lider lider;
    private Romaria romaria;
    private int numReserva;

    public int getNumReserva() {
        return numReserva;
    }

    public void setNumReserva(int numReserva) {
        this.numReserva = numReserva;
    }
    
    

    public Lider getLider() {
        return lider;
    }

    public void setLider(Lider lider) {
        this.lider = lider;
    }

    public Romaria getRomaria() {
        return romaria;
    }

    public void setRomaria(Romaria romaria) {
        this.romaria = romaria;
    }
 

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public Date getDataReserva() {
        return dataReserva;
    }

    public void setDataReserva(Date dataReserva) {
        this.dataReserva = dataReserva;
    }

    public int getQuantDarias() {
        return quantDarias;
    }

    public void setQuantDarias(int quantDarias) {
        this.quantDarias = quantDarias;
    }

}
