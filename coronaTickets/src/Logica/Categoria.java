/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author User
 */
@Entity
public class Categoria {
    @Id
    private String nombre;
    
    public Categoria(){}
    
    public Categoria(String nombre){
        this.nombre = nombre;
    }

    
    public String getNombre() {
        return nombre;
    }
    
    public DtCategoria ArmarDT(){
        DtCategoria dtC = new DtCategoria(this.nombre);
        return dtC;
    }
    
}
