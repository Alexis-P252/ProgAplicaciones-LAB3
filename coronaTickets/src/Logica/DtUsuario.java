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
public class DtUsuario {
    
    protected String nombre;
    protected String apellido;
    protected String email;
    protected String nickname;
    protected Date fecha_nac;
    protected String imagen;
    
    public DtUsuario(String nombre, String apellido, String email, String nickname, Date fecha_nac, String imagen){
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nickname = nickname;
        this.fecha_nac = fecha_nac;
        this.imagen = imagen;
        
    }
    
    public String GetNombre(){
        return this.nombre;
    }
    
    public String GetApellido(){
        return this.apellido;
    }
    
    public String GetEmail(){
        return this.email;
    }
    
    public String GetNickname(){
        return this.nickname;
    }
    
    public Date GetFecha_Nac(){
        return this.fecha_nac;
    }
    
    public String GetImagen(){
        return this.imagen;
    }
}
