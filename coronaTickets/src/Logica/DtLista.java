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
import java.util.List;

/**
 *
 * @author User
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class DtLista implements Serializable {
    
    private List lista;
    
    public DtLista(){}
    
    public DtLista(List lista){
        this.lista = lista;
    }
    
    public List getLista(){
        return this.lista;
    }
    
}
