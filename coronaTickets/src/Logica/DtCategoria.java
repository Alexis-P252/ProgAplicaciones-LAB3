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
import java.util.Date;

/**
 *
 * @author User
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class DtCategoria implements Serializable {
    
    private String nombre;


    public DtCategoria (){
    }

    public DtCategoria (String nombre){
        this.nombre=nombre;
    }
    
    public String getNombre (){
        return this.nombre;
    }
    
}
