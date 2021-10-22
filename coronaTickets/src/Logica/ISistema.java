/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;
import java.util.Date;
import java.util.List;
/**
 *
 * @author User
 */
public interface ISistema {
    
    // FUNCIONES DE LISTAR
    
    public abstract String[] listarfuncionesxEspectador(String nickname);
    public abstract List listarfuncionesRealizadasxEspectador(String nickname);
    public abstract List listaEspectaculosSegunFunciones(List funciones);
    public abstract String[] listarFuncionesxEspectaculo(String espectaculo);
    public abstract String[] listarEspectadores();
    public abstract String[] listarEspectaculosxPaq(String paquete);
    public abstract String[] listarPaquetesdeEsp(String espectaculo);
    public abstract String[] listarEspectaculos(String n);
    public abstract String[] listarArtistas();
    public abstract String[] listarPlataformas();
    public abstract String[] listarPaquetes();
    public abstract String[] listarPaquetesVigentes();
    public abstract String[] listarPaquetesComprados(String espectador);
    public abstract List listarPaquetesVigentesWeb();
    public abstract String[] Artistasinvitados(String funcion);
    public abstract String[] listarArtistasmenosOrganizador(String espectaculo);
    public abstract String[] listarespectaculosXArtista(String artista);
    public abstract String[] listarespectaculosAceptadosXArtista(String artista);
    public abstract List listarespectaculosAceptadosXArtistaWeb(String artista);
    public abstract String[] ColNickname();
    public abstract List ListarRegistros (String espectador);
    public abstract String[] listarCategorias();
    public abstract String[] listarCategoriasxEspectaculo(String nombre);
    public abstract String[] listarCategoriasxPaquete(String nombre);
    public abstract String[] listarEspectaculosxCategoria(String categoria);
    public abstract String[] listarSeguidores(String nickname);
    public abstract String[] listarSeguidos(String nickname);
    public abstract String [] listarEspectaculosSinAceptar();
    public abstract String[] listarEspectaculosAceptados();
    public abstract String[] listarEspectaculosAceptadosxPlataforma(String n);
    public abstract List listarEspectaculosAceptadosxPlataformaWeb(String n);
    public abstract List BuscadorEspectaculo(String texto, int orden);
    public abstract List BuscadorPaquete(String texto, int orden);
    public abstract int[] CantEstrellasEspectaculo(String espectaculo);
    public abstract String[] listarEspectaculosFavoritos(String nickname);
    
    // INGRESAR DATOS
    
    public abstract void ingresarEspectador(String nombre, String apellido, String correo, String nickname, Date fecha_nac, String password, String imagen);
    public abstract void ingresarArtista(String nombre, String apellido, String correo, String nickname, Date fecha_nac,String password, String descripcion, String biografia, String link, String imagen);
    public abstract void crearEspectaculo(String Plataforma,String nombre,Date fecha_registro,float costo, String url,int cant_max_espec,int cant_min_espec,int duracion,String descripcion, String artista, List categorias, int estado, String imagen, String video, String desc_premio, int cant_premios);
    public abstract void AgregarPaquete(String nombre, String descripcion, float descuento, Date fecha_alta, Date fecha_fin, Date fecha_ini, String imagen);
    public abstract void AgregarFuncion(String nombre, Date fecha_hora, Date fecha_registro, String espectaculo, List artistas, String imagen);
    public abstract void AddEspectaculoaPaquete(String paquete, String espectaculo);
    public abstract void agregarRegistro(String espectador,String funcion, String espectaculo, Date f, int costo);
    public abstract void AgregarCategoria(String categoria);
    public abstract void AddSeguidor(String usuario1, String usuario2);
    public abstract void comprarPaquete(String nickname, String paquete);
    public abstract void AgregarPuntaje(String nickname, String espectaculo, int puntaje);
    
    // CONTROL DE INFORMACION
    
    public abstract boolean UsuarioxNickname(String nickname);
    public abstract boolean UsuarioxEmail(String email);
    public abstract boolean verificarEspectaculo(String espectaculo);
    public abstract boolean ExisteFuncion(String funcion);
    public abstract boolean ExistePaquete(String paquete);
    public abstract boolean espectadorRegistrado(String espectador, String funcion);
    public abstract boolean cantMaxAsistentes(String espectaculo, String funcion);
    public abstract boolean alMenos3Registros (String espectador);
    public abstract boolean EspectaculoenPaq (String paquete, String espectaculo);
    public abstract boolean ExisteCategoria(String nombre);
    public abstract boolean EsSeguidor(String usuario1, String usuario2);
    public abstract boolean espectadorComproPaquete(String espectador, String paquete);
    public abstract boolean ComprobarLogin(String user, String password, String tipo);
    public abstract int EspectaculoenPaqWeb (String paquete, String espectaculo);
    public abstract boolean UsuarioTienePaqueteconEspectaculo(String nickname, String espectaculo);
    public abstract List FiltrarEspectaculoxCat(List espectaculos, String[] categorias);
    public abstract List FiltrarPaquetexCat(List paquetes, String[] categorias);
    public abstract boolean Pertenecea(String[] arreglo, String s);
    public abstract boolean EspectadorValoroEspectaculo(String nickname, String espectaculo);
    public abstract boolean TieneFavorito(String nickname, String espectaculo);
    
    // MOSTRAR DATOS
    
    public abstract DtUsuario GetDtUsuario(String nickname);
    public abstract DtEspectaculo mostrarEspectaculo (String espectaculo);
    public abstract DtPaquete mostrarPaquete(String paquete);
    public abstract DtFuncion MostrarFuncion (String funcion);
    public abstract float darPrecioEspectaculo(String espectaculo);
    public abstract float PuntajePromedioEspectaculo(String espectaculo);
    public abstract int PuntajedeEspectador(String nickname, String espectaculo);
    public abstract long CantFavxEspectaculo(String espectaculo);
    
    // MODIFICAR DATOS
   
    public abstract void modificarEspectador(String nickname, String nombre, String apellido, Date f, String imagen);
    public abstract void ModificarArtista (String nickname, String nombre,String apellido, Date f,String descripcion, String biografia, String link, String imagen);
    public abstract void CanjeoRegistros(List RegistrosSeleccionados, String espectador);
    public abstract void CambiarEstadoEspectaculo(String espectaculo, int estado);
    public abstract void DejardeSeguir(String usuario1, String usuario2);
    public abstract void AgregarFavorito(String nickname, String espectaculo);
    public abstract void EliminarFavorito(String nickname, String espectaculo);
    public abstract void FinalizarEspectaculo(String espectaculo);
    
}

    // EL FUNCIONAMIENTO DE CADA FUNCION ESTA ESPECIFICADO EN EL ARCHIVO Sistema.java




