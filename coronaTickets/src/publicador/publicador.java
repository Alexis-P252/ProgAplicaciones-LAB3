/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package publicador;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.ParameterStyle;
import javax.jws.soap.SOAPBinding.Style;
import javax.xml.ws.Endpoint;
import java.util.Date;

import Logica.ISistema;
import Logica.Sistema;
import Logica.SistemaFactory;
import Logica.*;
import java.util.List;

/**
 *
 * @author user
 */
@WebService
@SOAPBinding(style = Style.RPC, parameterStyle = ParameterStyle.WRAPPED)
public class publicador {

    private Endpoint endpoint = null;
    //Constructor
    public publicador(){}

    //Operaciones que quiero publicar

    @WebMethod(exclude = true)
    public void publicar(){
         endpoint = Endpoint.publish("http://192.168.1.45:9191/publicador", this);
    }

    @WebMethod(exclude = true)
    public Endpoint getEndpoint() { 
            return endpoint;
    }
    
//    @WebMethod
//    public void crearEspectaculo(String Plataforma,String nombre,Date fecha_registro,float costo, String url,int cant_max_espec,int cant_min_espec,int duracion,String descripcion, String artista, List categorias, int estado, String imagen, String video, String desc_premio, int cant_premios){
//     SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     s.crearEspectaculo(Plataforma, nombre, fecha_registro, costo, url, cant_max_espec, cant_min_espec, duracion, descripcion, artista, categorias, estado, imagen, video, desc_premio, cant_premios);
//     
//    }
    @WebMethod
    public boolean ComprobarLogin(String user, String password, String tipo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.ComprobarLogin(user,password,tipo);
    }
    
    
    @WebMethod
    public boolean verificarEspectaculo(String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.verificarEspectaculo(espectaculo);
    }
    
    @WebMethod
    public String[] listarArtistas(){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarArtistas();
    }
    
    @WebMethod
    public String[] listarEspectadores(){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectadores();
    }
    
    @WebMethod
    public String[] listarPlataformas(){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarPlataformas();
    }
    
    @WebMethod
    public void ingresarEspectador(String nombre, String apellido, String correo, String nickname, Date fecha_nac, String password, String imagen){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.ingresarEspectador(nombre,apellido,correo,nickname,fecha_nac,password,imagen);
    }
    
    @WebMethod
    public void ingresarArtista(String nombre, String apellido, String correo, String nickname, Date fecha_nac,String password, String descripcion, String biografia, String link, String imagen){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.ingresarArtista(nombre, apellido, correo, nickname, fecha_nac,password, descripcion, biografia, link, imagen);
    }
    @WebMethod
    public boolean UsuarioxNickname(String nickname){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.UsuarioxNickname(nickname);
    }
    
    @WebMethod
    public boolean UsuarioxEmail(String email){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.UsuarioxEmail(email);
    }
    
    @WebMethod
    public String[] ColNickname(){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.ColNickname();
    }
    
    @WebMethod
    public DtUsuario GetDtUsuario(String nickname){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.GetDtUsuario(nickname);
    }
    
    @WebMethod
    public void modificarEspectador(String nickname, String nombre, String apellido, Date f, String imagen){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.modificarEspectador(nickname, nombre, apellido, f, imagen);
    }
    
    @WebMethod
    public void ModificarArtista (String nickname, String nombre,String apellido, Date f,String descripcion, String biografia, String link, String imagen){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.ModificarArtista(nickname, nombre, apellido, f, descripcion, biografia, link, imagen);
    }
    
    @WebMethod
    public String[] listarEspectaculos(String n){
        SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectaculos(n);
    }
    
    
    @WebMethod
    public DtEspectaculo mostrarEspectaculo (String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.mostrarEspectaculo(espectaculo);
    }
    
    @WebMethod
    public String[] listarespectaculosXArtista(String artista){
        SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarespectaculosXArtista(artista);
    }
    
    @WebMethod
    public String[] listarespectaculosAceptadosXArtista(String artista){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarespectaculosAceptadosXArtista(artista);
    }
    
//    @WebMethod
//    public List listarespectaculosAceptadosXArtistaWeb(String artista){
//     SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.listarespectaculosAceptadosXArtistaWeb(artista);
//    }
    
    @WebMethod
    public boolean ExistePaquete(String paquete){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.ExistePaquete(paquete);
    }
    
    @WebMethod
    public void AgregarPaquete(String nombre, String descripcion, float descuento, Date fecha_alta, Date fecha_fin, Date fecha_ini, String imagen){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.AgregarPaquete(nombre, descripcion, descuento, fecha_alta, fecha_fin, fecha_ini, imagen);
    }
    
    @WebMethod
    public String[] listarPaquetes(){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarPaquetes();
    }
    
    @WebMethod
    public String[] listarPaquetesVigentes(){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarPaquetesVigentes();
    }
    
//    @WebMethod
//    public List listarPaquetesVigentesWeb(){
//        SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.listarPaquetesVigentesWeb();
//    }
    
    @WebMethod
    public DtPaquete mostrarPaquete(String paquete){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.mostrarPaquete(paquete);
    }
    
    @WebMethod
    public boolean EspectaculoenPaq (String paquete, String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.EspectaculoenPaq(paquete, espectaculo);
    }
    
    
    @WebMethod
    public int EspectaculoenPaqWeb (String paquete, String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.EspectaculoenPaqWeb(paquete, espectaculo);
    }
    
    @WebMethod
    public void AddEspectaculoaPaquete(String paquete, String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.AddEspectaculoaPaquete(paquete, espectaculo);
    
    }
    
    
    @WebMethod
    public String[] listarEspectaculosxPaq(String paquete){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectaculosxPaq(paquete);
    }
    
    
    @WebMethod
    public String[] listarPaquetesdeEsp(String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarPaquetesdeEsp(espectaculo);
     
    }
    
    
//    @WebMethod
//    public void AgregarFuncion(String nombre, Date fecha_hora, Date fecha_registro, String espectaculo, List artistas, String imagen){
//     SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     s.AgregarFuncion(nombre,fecha_hora,fecha_registro,espectaculo,artistas,imagen);
//    }
    @WebMethod
    public String[] Artistasinvitados(String funcion){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.Artistasinvitados(funcion);
    }
    
    @WebMethod
    public boolean ExisteFuncion(String funcion){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.ExisteFuncion(funcion);
    }
    
    @WebMethod
    public DtFuncion MostrarFuncion (String funcion){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.MostrarFuncion(funcion);
    }
    
    @WebMethod
    public String[] listarArtistasmenosOrganizador(String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarArtistasmenosOrganizador(espectaculo);
    }
    
    @WebMethod
    public String[] listarFuncionesxEspectaculo(String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarFuncionesxEspectaculo(espectaculo);
    }
    
    @WebMethod
    public float darPrecioEspectaculo(String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.darPrecioEspectaculo(espectaculo);
    }
    
    @WebMethod
    public boolean espectadorRegistrado(String espectador, String funcion){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.espectadorRegistrado(espectador,funcion);
    }
    
    @WebMethod
    public boolean espectadorComproPaquete(String espectador, String paquete){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.espectadorComproPaquete(espectador,paquete);
    }
    
    @WebMethod
    public void comprarPaquete(String nickname, String paquete){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.comprarPaquete(nickname, paquete);
    }
    
    @WebMethod
    public boolean cantMaxAsistentes(String espectaculo, String funcion){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.cantMaxAsistentes(espectaculo,funcion);
    }
    
    @WebMethod
    public void agregarRegistro(String espectador,String funcion, String espectaculo, Date f, int costo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.agregarRegistro(espectador, funcion, espectaculo, f, costo);
    }
    
    @WebMethod
    public boolean alMenos3Registros (String espectador){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.alMenos3Registros(espectador);
    }
    
    
//    @WebMethod
//    public List ListarRegistros (String espectador){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.ListarRegistros(espectador);
//    }
    
//    @WebMethod
//    public void CanjeoRegistros(List RegistrosSeleccionados, String espectador){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     s.CanjeoRegistros(RegistrosSeleccionados,espectador);
//    }
    @WebMethod
    public String[] listarfuncionesxEspectador(String nickname){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarfuncionesxEspectador(nickname);
    }
    
//    @WebMethod
//    public List listarfuncionesRealizadasxEspectador(String nickname){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.listarfuncionesRealizadasxEspectador(nickname);
//    
//    }
    
//    @WebMethod
//    public List listaEspectaculosSegunFunciones(List funciones){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.listaEspectaculosSegunFunciones(funciones);
//    }
    @WebMethod
    public void AgregarCategoria(String categoria){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.AgregarCategoria(categoria);
    }
    
    @WebMethod
    public boolean ExisteCategoria(String nombre){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.ExisteCategoria(nombre);
    }
    
    @WebMethod
    public String[] listarCategorias(){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarCategorias();
    }
    
    @WebMethod
    public String[] listarCategoriasxEspectaculo(String nombre){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarCategoriasxEspectaculo(nombre);
    }
    
    @WebMethod
    public String[] listarCategoriasxPaquete(String nombre){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarCategoriasxPaquete(nombre);
    }
    
    @WebMethod
    public String[] listarEspectaculosxCategoria(String categoria){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectaculosxCategoria(categoria);
    }
    
    @WebMethod
    public String [] listarEspectaculosSinAceptar(){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectaculosSinAceptar();
    }
    
    @WebMethod
    public String[] listarEspectaculosAceptadosxPlataforma(String n){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
        return s.listarEspectaculosAceptadosxPlataforma(n);
    }
    
    @WebMethod
    public String[] listarEspectaculosAceptados(){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
        return s.listarEspectaculosAceptados();
    }
    
//    @WebMethod
//    public List listarEspectaculosAceptadosxPlataformaWeb(String n){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//        return s.listarEspectaculosAceptadosxPlataformaWeb(n);
//    }
    
    @WebMethod
    public void CambiarEstadoEspectaculo(String espectaculo, int estado){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.CambiarEstadoEspectaculo(espectaculo, estado);
    }
    
    @WebMethod
    public void AddSeguidor(String usuario1, String usuario2){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.AddSeguidor(usuario1, usuario2);
    }
    
    @WebMethod
    public void DejardeSeguir(String usuario1, String usuario2){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.DejardeSeguir(usuario1,usuario2);
    }
    @WebMethod
    public boolean EsSeguidor(String usuario1, String usuario2){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.EsSeguidor(usuario1,usuario2);
    }
    @WebMethod
    public String[] listarSeguidores(String nickname){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarSeguidores(nickname);
    }
    
    @WebMethod
    public String[] listarSeguidos(String nickname){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarSeguidos(nickname);
    }
    
    @WebMethod
    public String[] listarPaquetesComprados(String espectador){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarPaquetesComprados(espectador);
    }
    
//    @WebMethod
//    public List BuscadorEspectaculo(String texto, int orden){
//     SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.BuscadorEspectaculo(texto, orden);
//    }
    
//    @WebMethod
//    public List BuscadorPaquete(String texto, int orden){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.BuscadorPaquete(texto,orden);
//    }
    
    @WebMethod
    public boolean UsuarioTienePaqueteconEspectaculo(String nickname, String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.UsuarioTienePaqueteconEspectaculo(nickname, espectaculo);
    }
    
//    @WebMethod
//    public List FiltrarEspectaculoxCat(List espectaculos, String[] categorias){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.FiltrarEspectaculoxCat(espectaculos,categorias);
//    }
//    
//    @WebMethod
//    public List FiltrarPaquetexCat(List paquetes, String[] categorias){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.FiltrarPaquetexCat(paquetes,categorias);
//    }
    
    @WebMethod
    public float PuntajePromedioEspectaculo(String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.PuntajePromedioEspectaculo(espectaculo);
    }
    
     @WebMethod
     public int[] CantEstrellasEspectaculo(String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.CantEstrellasEspectaculo(espectaculo);
     }
     
     @WebMethod
     public boolean EspectadorValoroEspectaculo(String nickname, String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.EspectadorValoroEspectaculo(nickname,espectaculo);
     }
     
     @WebMethod
     public int PuntajedeEspectador(String nickname, String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.PuntajedeEspectador(nickname,espectaculo);
     }
     
     @WebMethod
     public void AgregarPuntaje(String nickname, String espectaculo, int puntaje){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.AgregarPuntaje(nickname, espectaculo, puntaje);
     }
     
     @WebMethod
     public boolean TieneFavorito(String nickname, String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.TieneFavorito(nickname, espectaculo);
     }
     
     @WebMethod
     public void AgregarFavorito(String nickname, String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.AgregarFavorito(nickname, espectaculo);
     }
     
     @WebMethod
     public void EliminarFavorito(String nickname, String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.EliminarFavorito(nickname, espectaculo);
     }
     
     @WebMethod
     public String[] listarEspectaculosFavoritos(String nickname){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectaculosFavoritos(nickname);
     }
     
     @WebMethod
     public boolean Pertenecea(String[] arreglo, String s){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema si = fabrica.getISistema();
     return si.Pertenecea(arreglo, s);
     }
     
     @WebMethod
     public long CantFavxEspectaculo(String espectaculo){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.CantFavxEspectaculo(espectaculo);
     }
     @WebMethod
    public void FinalizarEspectaculo(String espectaculo){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.FinalizarEspectaculo(espectaculo);
    }
    
    @WebMethod
    public String [] SortearPremios(String[] espectadores,int premios){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.SortearPremios(espectadores, premios);
    }
    
    @WebMethod
    public String [] listarEspectadoresxFuncion(String funcion){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     return s.listarEspectadoresxFuncion(funcion);
    }
    
    @WebMethod
    public void SortearFuncion(String funcion, String espectaculo, String desc_premio, int cant_premios, Date actual, Date fecha_vencimiento, String[] ganadores){
    SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();
     s.SortearFuncion(funcion, espectaculo, desc_premio, cant_premios, actual, fecha_vencimiento, ganadores);
    }
    
//    @WebMethod
//    public List GanadoresdeSorteo(String funcion){
//    SistemaFactory fabrica = SistemaFactory.getInstance();
//     ISistema s = fabrica.getISistema();
//     return s.GanadoresdeSorteo(funcion);
//    }
    
    @WebMethod
    public DtLista SorteosGanadosxEspectador (String espectador){
    SistemaFactory fabrica = SistemaFactory.getInstance();
    ISistema s = fabrica.getISistema();
    DtLista lista = new DtLista(s.SorteosGanadosxEspectador(espectador));
    return lista;
    }
    
    @WebMethod
    public DtPremio GetDtPremio(int id){
     SistemaFactory fabrica = SistemaFactory.getInstance();
     ISistema s = fabrica.getISistema();  
    return s.GetDtPremio(id);
    }
    

     
}
