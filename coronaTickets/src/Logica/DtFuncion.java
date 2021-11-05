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
public class DtFuncion implements Serializable {
    
     private String nombre;
    private Date fecha_registro;
    private Date fecha_hora;
    private String imagen;
    private boolean sorteado;
    private String espectaculo;

    public DtFuncion() {
    }

    public DtFuncion(String nombre, Date fecha_registro, Date fecha_hora, String imagen, boolean sorteado, String espectaculo) {
        this.nombre = nombre;
        this.fecha_registro = fecha_registro;
        this.fecha_hora = fecha_hora;
        this.imagen = imagen;
        this.sorteado = sorteado;
        this.espectaculo = espectaculo;
    }

    public String getNombre() {
        return nombre;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public Date getFecha_hora() {
        return fecha_hora;
    }
    
    public String getImagen(){
        return imagen;
    }
    
    public boolean getSorteado(){
        return sorteado;
    }
    
    public String getEspectaculo(){
        return this.espectaculo;
    }
    
    
}
