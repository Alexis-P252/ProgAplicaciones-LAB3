/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;
import java.util.Date;

/**
 *
 * @author User
 */
public class DtPremio {
    private int id;
    private Date fecha_sorteo;
    private Date fecha_caduca;
    private String desc_premio;
    private String espectaculo;
    private String funcion;

    public DtPremio(){}
    
    public DtPremio(int id, Date fecha_sorteo, Date fecha_caduca, String desc_premio, String espectaculo, String funcion) {
        this.id = id;
        this.fecha_sorteo = fecha_sorteo;
        this.fecha_caduca = fecha_caduca;
        this.desc_premio = desc_premio;
        this.espectaculo = espectaculo;
        this.funcion = funcion;
    }

    public int GetID(){
        return id;
    }
    
    public Date getFecha_sorteo() {
        return fecha_sorteo;
    }
    
    public Date getFecha_caduca() {
        return fecha_caduca;
    }

    public String getDesc_premio() {
        return desc_premio;
    }

    public String getEspectaculo() {
        return espectaculo;
    }

    public String getFuncion() {
        return funcion;
    }
    
    
    
    
    
}
