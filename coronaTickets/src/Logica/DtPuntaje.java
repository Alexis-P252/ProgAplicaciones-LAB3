/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.beans.*;
import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

/**
 *
 * @author usuario
 */

@XmlAccessorType(XmlAccessType.FIELD)
public class DtPuntaje implements Serializable {
    
    private int Id;
    private int puntaje;
    private String espectaculo;

    public int getPuntaje() {
        return puntaje;
    }
    public int getId() {
        return Id;
    }

    public String getEspectaculo() {
        return espectaculo;
    }

    public DtPuntaje(){

    }

    public DtPuntaje(int Id,int puntaje, String espec){
        this.Id = Id;
        this.puntaje = puntaje;
        this.espectaculo = espec;
    }
}
