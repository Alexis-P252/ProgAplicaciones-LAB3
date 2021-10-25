/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;
import Logica.DtFuncion;
import Logica.Artista;
import java.util.Date;
//import Logica.Registro;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author usuario
 */
@Entity
public class Funcion {
    @Id private String nombre;
    private Date fecha_registro;
    private Date fecha_hora;
    private String espectaculo;
    private String imagen;
    private boolean sorteado;
    //private Map Registros;
    @OneToMany
    private Map<String,Artista> Artistas;
    

/// Constructores
    public Funcion() {
    }
    public Funcion(String nombre, Date fecha_registro, Date fecha_hora,String espectaculo, String imagen) {
        this.nombre = nombre;
        this.fecha_registro = fecha_registro;
        this.fecha_hora = fecha_hora;
        //this.Registros = new HashMap();
        this.Artistas = new HashMap();
        this.espectaculo = espectaculo;
        this.imagen = imagen;
        this.sorteado = false;
    }      
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }

    public void setFecha_hora(Date fecha_hora) {
        this.fecha_hora = fecha_hora;
    }

    public String getNombre() {
        return nombre;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }
    
    public String getEspectaculo(){
        return this.espectaculo;
    }

    public Date getFecha_hora() {
        return fecha_hora;
    }
    
    public String getImagen(){
        return imagen;
    }
    
    public boolean getSorteado(){
        return this.sorteado;
    }
    
    public DtFuncion crearDtFuncion (){
        DtFuncion dt = new DtFuncion (this.nombre, this.fecha_registro,this.fecha_hora, this.imagen, this.sorteado, this.espectaculo);
        return dt;
    }
    
    public void agregarArtistaInvitado(Artista art){
        this.Artistas.put(art.GetNickname(), art);
    }
    

}
