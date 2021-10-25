/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.Date;

/**
 *
 * @author Nicolás Guillén
 */
public class DtEspectaculo {
    private String nombre;
    private Date fecha_registro;
    private float costo;
    private String url;
    private int cant_max_espec;
    private int cant_min_espec;
    private int duracion;
    private String descripcion;
    private String imagen;
    private String video;
    private String desc_premio;
    private int cant_premios;
    private boolean finalizado;
    
    public DtEspectaculo(){
    }
    
    public DtEspectaculo(String nombre, Date fecha, float costo, String url, int cant_max_espec, int cant_min_espec, int duracion, String descripcion, String imagen, String video, String desc_premio, int cant_premios, boolean finalizado){
        this.nombre = nombre;
        this.fecha_registro = fecha;
        this.costo = costo;
        this.url = url;
        this.cant_max_espec = cant_max_espec;
        this.cant_min_espec = cant_min_espec;
        this.duracion = duracion;
        this.descripcion = descripcion;
        this.imagen = imagen;
        this.video = video;
        this.desc_premio = desc_premio;
        this.cant_premios = cant_premios;
        this.finalizado = finalizado;
        
    }
    
    public String GetNombre(){
        return this.nombre;
    }
    
    public Date GetFecha_registro(){
        return this.fecha_registro;
    }
    
    public float GetCosto(){
        return this.costo;
    }
    
    public String GetUrl(){
        return this.url;
    }
    
    public int GetCant_max_espec(){
        return this.cant_max_espec;
    }
    
    public int GetCant_min_espec(){
        return this.cant_min_espec;
    }
    
    public int GetDuracion(){
        return this.duracion;
    }
    
    public String GetDescripcion(){
        return this.descripcion;
    }
    
     public String GetImagen(){
        return this.imagen;
    }
    
     public String GetVideo(){
         return this.video;
    }
     
    public String getDesc_premio(){
        return this.desc_premio;
    }
    
    public int getCant_premios(){
        return this.cant_premios;
    } 
}
