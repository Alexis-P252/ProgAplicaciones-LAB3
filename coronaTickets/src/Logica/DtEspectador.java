/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;
import Logica.DtUsuario;
import java.util.Date;
/**
 *
 * @author User
 */
public class DtEspectador extends DtUsuario {
    
    public DtEspectador(String nombre, String apellido, String email, String nickname, Date fecha_nac, String imagen){
    
        super(nombre, apellido, email, nickname, fecha_nac, imagen);
    }
    
}

