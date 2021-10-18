/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import java.util.Date;
import java.util.List;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author User
 */
public class SistemaTest {
    
    public SistemaTest() {
    }

    @Test
    public void testCrearEspectaculo() {
        System.out.println("crearEspectaculo");
        String Plataforma = "";
        String nombre = "";
        Date fecha_registro = null;
        float costo = 0.0F;
        String url = "";
        int cant_max_espec = 0;
        int cant_min_espec = 0;
        int duracion = 0;
        String descripcion = "";
        String artista = "";
        List categorias = null;
        int estado = 0;
        String imagen = "";
        Sistema instance = new Sistema();
        instance.crearEspectaculo(Plataforma, nombre, fecha_registro, costo, url, cant_max_espec, cant_min_espec, duracion, descripcion, artista, categorias, estado, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testVerificarEspectaculo() {
        System.out.println("verificarEspectaculo");
        String espectaculo = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.verificarEspectaculo(espectaculo);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarArtistas() {
        System.out.println("listarArtistas");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarArtistas();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectadores() {
        System.out.println("listarEspectadores");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarEspectadores();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarPlataformas() {
        System.out.println("listarPlataformas");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarPlataformas();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testIngresarEspectador() {
        System.out.println("ingresarEspectador");
        String nombre = "";
        String apellido = "";
        String correo = "";
        String nickname = "";
        Date fecha_nac = null;
        String password = "";
        String imagen = "";
        Sistema instance = new Sistema();
        instance.ingresarEspectador(nombre, apellido, correo, nickname, fecha_nac, password, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testIngresarArtista() {
        System.out.println("ingresarArtista");
        String nombre = "";
        String apellido = "";
        String correo = "";
        String nickname = "";
        Date fecha_nac = null;
        String password = "";
        String descripcion = "";
        String biografia = "";
        String link = "";
        String imagen = "";
        Sistema instance = new Sistema();
        instance.ingresarArtista(nombre, apellido, correo, nickname, fecha_nac, password, descripcion, biografia, link, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testUsuarioxNickname() {
        System.out.println("UsuarioxNickname");
        String nickname = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.UsuarioxNickname(nickname);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testUsuarioxEmail() {
        System.out.println("UsuarioxEmail");
        String email = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.UsuarioxEmail(email);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testColNickname() {
        System.out.println("ColNickname");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.ColNickname();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testGetDtUsuario() {
        System.out.println("GetDtUsuario");
        String nickname = "";
        Sistema instance = new Sistema();
        DtUsuario expResult = null;
        DtUsuario result = instance.GetDtUsuario(nickname);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testModificarEspectador() {
        System.out.println("modificarEspectador");
        String nickname = "";
        String nombre = "";
        String apellido = "";
        Date f = null;
        String imagen = "";
        Sistema instance = new Sistema();
        instance.modificarEspectador(nickname, nombre, apellido, f, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testModificarArtista() {
        System.out.println("ModificarArtista");
        String nickname = "";
        String nombre = "";
        String apellido = "";
        Date f = null;
        String descripcion = "";
        String biografia = "";
        String link = "";
        String imagen = "";
        Sistema instance = new Sistema();
        instance.ModificarArtista(nickname, nombre, apellido, f, descripcion, biografia, link, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectaculos() {
        System.out.println("listarEspectaculos");
        String n = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarEspectaculos(n);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testMostrarEspectaculo() {
        System.out.println("mostrarEspectaculo");
        String espectaculo = "";
        Sistema instance = new Sistema();
        DtEspectaculo expResult = null;
        DtEspectaculo result = instance.mostrarEspectaculo(espectaculo);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarespectaculosXArtista() {
        System.out.println("listarespectaculosXArtista");
        String artista = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarespectaculosXArtista(artista);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarespectaculosAceptadosXArtista() {
        System.out.println("listarespectaculosAceptadosXArtista");
        String artista = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarespectaculosAceptadosXArtista(artista);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarespectaculosAceptadosXArtistaWeb() {
        System.out.println("listarespectaculosAceptadosXArtistaWeb");
        String artista = "";
        Sistema instance = new Sistema();
        List expResult = null;
        List result = instance.listarespectaculosAceptadosXArtistaWeb(artista);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testExistePaquete() {
        System.out.println("ExistePaquete");
        String paquete = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.ExistePaquete(paquete);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAgregarPaquete() {
        System.out.println("AgregarPaquete");
        String nombre = "";
        String descripcion = "";
        float descuento = 0.0F;
        Date fecha_alta = null;
        Date fecha_fin = null;
        Date fecha_ini = null;
        String imagen = "";
        Sistema instance = new Sistema();
        instance.AgregarPaquete(nombre, descripcion, descuento, fecha_alta, fecha_fin, fecha_ini, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarPaquetes() {
        System.out.println("listarPaquetes");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarPaquetes();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarPaquetesVigentes() {
        System.out.println("listarPaquetesVigentes");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarPaquetesVigentes();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarPaquetesVigentesWeb() {
        System.out.println("listarPaquetesVigentesWeb");
        Sistema instance = new Sistema();
        List expResult = null;
        List result = instance.listarPaquetesVigentesWeb();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testMostrarPaquete() {
        System.out.println("mostrarPaquete");
        String paquete = "";
        Sistema instance = new Sistema();
        DtPaquete expResult = null;
        DtPaquete result = instance.mostrarPaquete(paquete);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testEspectaculoenPaq() {
        System.out.println("EspectaculoenPaq");
        String paquete = "";
        String espectaculo = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.EspectaculoenPaq(paquete, espectaculo);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testEspectaculoenPaqWeb() {
        System.out.println("EspectaculoenPaqWeb");
        String paquete = "";
        String espectaculo = "";
        Sistema instance = new Sistema();
        int expResult = 0;
        int result = instance.EspectaculoenPaqWeb(paquete, espectaculo);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAddEspectaculoaPaquete() {
        System.out.println("AddEspectaculoaPaquete");
        String paquete = "";
        String espectaculo = "";
        Sistema instance = new Sistema();
        instance.AddEspectaculoaPaquete(paquete, espectaculo);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectaculosxPaq() {
        System.out.println("listarEspectaculosxPaq");
        String paquete = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarEspectaculosxPaq(paquete);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarPaquetesdeEsp() {
        System.out.println("listarPaquetesdeEsp");
        String espectaculo = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarPaquetesdeEsp(espectaculo);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAgregarFuncion() {
        System.out.println("AgregarFuncion");
        String nombre = "";
        Date fecha_hora = null;
        Date fecha_registro = null;
        String espectaculo = "";
        List artistas = null;
        String imagen = "";
        Sistema instance = new Sistema();
        instance.AgregarFuncion(nombre, fecha_hora, fecha_registro, espectaculo, artistas, imagen);
        fail("The test case is a prototype.");
    }

    @Test
    public void testArtistasinvitados() {
        System.out.println("Artistasinvitados");
        String funcion = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.Artistasinvitados(funcion);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testExisteFuncion() {
        System.out.println("ExisteFuncion");
        String funcion = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.ExisteFuncion(funcion);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testMostrarFuncion() {
        System.out.println("MostrarFuncion");
        String funcion = "";
        Sistema instance = new Sistema();
        DtFuncion expResult = null;
        DtFuncion result = instance.MostrarFuncion(funcion);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarArtistasmenosOrganizador() {
        System.out.println("listarArtistasmenosOrganizador");
        String espectaculo = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarArtistasmenosOrganizador(espectaculo);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarFuncionesxEspectaculo() {
        System.out.println("listarFuncionesxEspectaculo");
        String espectaculo = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarFuncionesxEspectaculo(espectaculo);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDarPrecioEspectaculo() {
        System.out.println("darPrecioEspectaculo");
        String espectaculo = "";
        Sistema instance = new Sistema();
        float expResult = 0.0F;
        float result = instance.darPrecioEspectaculo(espectaculo);
        assertEquals(expResult, result, 0.0);
        fail("The test case is a prototype.");
    }

    @Test
    public void testEspectadorRegistrado() {
        System.out.println("espectadorRegistrado");
        String espectador = "";
        String funcion = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.espectadorRegistrado(espectador, funcion);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testEspectadorComproPaquete() {
        System.out.println("espectadorComproPaquete");
        String espectador = "";
        String paquete = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.espectadorComproPaquete(espectador, paquete);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testComprarPaquete() {
        System.out.println("comprarPaquete");
        String nickname = "";
        String paquete = "";
        Sistema instance = new Sistema();
        instance.comprarPaquete(nickname, paquete);
        fail("The test case is a prototype.");
    }

    @Test
    public void testCantMaxAsistentes() {
        System.out.println("cantMaxAsistentes");
        String espectaculo = "";
        String funcion = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.cantMaxAsistentes(espectaculo, funcion);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAgregarRegistro() {
        System.out.println("agregarRegistro");
        String espectador = "";
        String funcion = "";
        String espectaculo = "";
        Date f = null;
        int costo = 0;
        Sistema instance = new Sistema();
        instance.agregarRegistro(espectador, funcion, espectaculo, f, costo);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAlMenos3Registros() {
        System.out.println("alMenos3Registros");
        String espectador = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.alMenos3Registros(espectador);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarRegistros() {
        System.out.println("ListarRegistros");
        String espectador = "";
        Sistema instance = new Sistema();
        List expResult = null;
        List result = instance.ListarRegistros(espectador);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testCanjeoRegistros() {
        System.out.println("CanjeoRegistros");
        List RegistrosSeleccionados = null;
        String espectador = "";
        Sistema instance = new Sistema();
        instance.CanjeoRegistros(RegistrosSeleccionados, espectador);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarfuncionesxEspectador() {
        System.out.println("listarfuncionesxEspectador");
        String nickname = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarfuncionesxEspectador(nickname);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testExisteCategoria() {
        System.out.println("ExisteCategoria");
        String nombre = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.ExisteCategoria(nombre);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAgregarCategoria() {
        System.out.println("AgregarCategoria");
        String categoria = "";
        Sistema instance = new Sistema();
        instance.AgregarCategoria(categoria);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarCategorias() {
        System.out.println("listarCategorias");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarCategorias();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarCategoriasxEspectaculo() {
        System.out.println("listarCategoriasxEspectaculo");
        String nombre = "";
        Sistema instance = new Sistema();
        String[] expResult = null; 
        String[] result = instance.listarCategoriasxEspectaculo(nombre);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarCategoriasxPaquete() {
        System.out.println("listarCategoriasxPaquete");
        String nombre = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarCategoriasxPaquete(nombre);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectaculosxCategoria() {
        System.out.println("listarEspectaculosxCategoria");
        String categoria = "Musical";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarEspectaculosxCategoria(categoria);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectaculosSinAceptar() {
        System.out.println("listarEspectaculosSinAceptar");
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarEspectaculosSinAceptar();
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectaculosAceptadosxPlataforma() {
        System.out.println("listarEspectaculosAceptadosxPlataforma");
        String n = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarEspectaculosAceptadosxPlataforma(n);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarEspectaculosAceptadosxPlataformaWeb() {
        System.out.println("listarEspectaculosAceptadosxPlataformaWeb");
        String n = "";
        Sistema instance = new Sistema();
        List expResult = null;
        List result = instance.listarEspectaculosAceptadosxPlataformaWeb(n);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testCambiarEstadoEspectaculo() {
        System.out.println("CambiarEstadoEspectaculo");
        String espectaculo = "";
        int estado = 0;
        Sistema instance = new Sistema();
        instance.CambiarEstadoEspectaculo(espectaculo, estado);
        fail("The test case is a prototype.");
    }

    @Test
    public void testAddSeguidor() {
        System.out.println("AddSeguidor");
        String usuario1 = "";
        String usuario2 = "";
        Sistema instance = new Sistema();
        instance.AddSeguidor(usuario1, usuario2);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDejardeSeguir() {
        System.out.println("DejardeSeguir");
        String usuario1 = "";
        String usuario2 = "";
        Sistema instance = new Sistema();
        instance.DejardeSeguir(usuario1, usuario2);
        fail("The test case is a prototype.");
    }

    @Test
    public void testEsSeguidor() {
        System.out.println("EsSeguidor");
        String usuario1 = "";
        String usuario2 = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.EsSeguidor(usuario1, usuario2);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testComprobarLogin() {
        System.out.println("ComprobarLogin");
        String user = "";
        String password = "";
        String tipo = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.ComprobarLogin(user, password, tipo);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarSeguidores() {
        System.out.println("listarSeguidores");
        String nickname = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarSeguidores(nickname);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarSeguidos() {
        System.out.println("listarSeguidos");
        String nickname = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarSeguidos(nickname);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListarPaquetesComprados() {
        System.out.println("listarPaquetesComprados");
        String espectador = "";
        Sistema instance = new Sistema();
        String[] expResult = null;
        String[] result = instance.listarPaquetesComprados(espectador);
        assertArrayEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testBuscadorEspectaculo() {
        System.out.println("BuscadorEspectaculo");
        String texto = "";
        int orden = 0;
        Sistema instance = new Sistema();
        List expResult = null;
        List result = instance.BuscadorEspectaculo(texto, orden);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testBuscadorPaquete() {
        System.out.println("BuscadorPaquete");
        String texto = "";
        int orden = 0;
        Sistema instance = new Sistema();
        List expResult = null;
        List result = instance.BuscadorPaquete(texto, orden);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testUsuarioTienePaqueteconEspectaculo() {
        System.out.println("UsuarioTienePaqueteconEspectaculo");
        String nickname = "";
        String espectaculo = "";
        Sistema instance = new Sistema();
        boolean expResult = false;
        boolean result = instance.UsuarioTienePaqueteconEspectaculo(nickname, espectaculo);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }
    
}
