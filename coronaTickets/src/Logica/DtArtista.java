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
public class DtArtista extends DtUsuario {
    
    private String descripcion;
    private String biografia;
    private String link;
    
    public DtArtista(String nombre, String apellido, String email, String nickname, Date fecha_nac, String descripcion, String biografia, String link, String imagen){
        
        super(nombre, apellido, email, nickname, fecha_nac, imagen);
        this.descripcion = descripcion;
        this.biografia = biografia;
        this.link = link;
    }


   
    
    public String GetDescripcion(){
        return this.descripcion;
    }
    
    public String GetBiografia(){
        return this.biografia;
    }
    
     public String GetLink(){
        return this.link;
    }
    
    
}
