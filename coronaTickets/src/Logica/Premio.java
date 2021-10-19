/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

/**
 *
 * @author User
 */
@Entity
public class Premio {
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    private Date fecha_sorteo;
    private Date fecha_caduca;
    private String desc_premio;
    private String espectaculo;
    @OneToOne
    private Funcion funcion;
    
    public Premio(){
    }
    
    public Premio( Date fecha_sorteo, Date fecha_caduca, String desc_premio, String espectaculo, Funcion funcion){
        this.fecha_sorteo = fecha_sorteo;
        this.fecha_caduca = fecha_caduca;
        this.desc_premio = desc_premio;
        this.espectaculo = espectaculo;
        this.funcion = funcion;
    }

    public Date getFecha_sorteo() {
        return fecha_sorteo;
    }

    public void setFecha_sorteo(Date fecha_sorteo) {
        this.fecha_sorteo = fecha_sorteo;
    }

    public Date getFecha_caduca() {
        return fecha_caduca;
    }

    public void setFecha_caduca(Date fecha_caduca) {
        this.fecha_caduca = fecha_caduca;
    }

    public String getDesc_premio() {
        return desc_premio;
    }

    public void setDesc_premio(String desc_premio) {
        this.desc_premio = desc_premio;
    }

    public String getEspectaculo() {
        return espectaculo;
    }

    public void setEspectaculo(String espectaculo) {
        this.espectaculo = espectaculo;
    }

    public Funcion getFuncion() {
        return funcion;
    }

    public void setFuncion(Funcion funcion) {
        this.funcion = funcion;
    }
    
    public DtPremio ArmarDT(){
        DtPremio dt = new DtPremio(this.id, this.fecha_sorteo, this.fecha_caduca, this.desc_premio, this.espectaculo, this.funcion.getNombre());
        return dt;
    }
    
    

}
