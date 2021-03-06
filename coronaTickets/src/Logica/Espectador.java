/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;
import Logica.Usuario;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

/**
 *
 * @author User
 */
@Entity
public class Espectador extends Usuario {
    
    
    @OneToMany
    private Map<String,Registro> registros;
    @OneToMany
    private Map<String,Paquete> paquetes;
    @OneToMany
    private List<Premio> premios;
    private List<Puntaje> puntajes;
    private List<Espectaculo> favoritos;
    
    public Espectador(String nombre, String apellido, String email, String nickname, Date fecha_nac, String password, String imagen){
    
        super(nombre, apellido, email, nickname, fecha_nac, password, imagen);
        this.registros = new HashMap();
        this.paquetes = new HashMap();
        this.premios = new ArrayList();
        this.puntajes = new ArrayList();
        this.favoritos = new ArrayList();
      
    }
    
    public Espectador(){}
    
    @Override
    public DtEspectador ArmarDT(){
        DtEspectador dt = new DtEspectador(nombre, apellido, email, nickname, fecha_nac, imagen);
        return dt;
    }
    
    public void agregarRegistro(Registro r, String funcion){
        this.registros.put(funcion,r);
    }
    
    
    public void comprarPaquete(Paquete p){
        this.paquetes.put(p.getNombre(), p);
    }
    
    public void AgregarPuntaje(Puntaje p){
        
        this.puntajes.add(p);
        
    }
    
    public void addFav(Espectaculo esp){
        this.favoritos.add(esp);
    }
    
    public void deleteFav(Espectaculo esp){
        this.favoritos.remove(esp);
    }
    
    public void AgregarPremio(Premio p){
        this.premios.add(p);
    }
    
}
