/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;
import java.util.List;

/**
 *
 * @author User
 */
public class DtLista {
    private List lista;
    
    DtLista(){}
    
    DtLista(List lista){
        this.lista = lista;
    }
    
    public List getLista(){
        return this.lista;
    }
}

