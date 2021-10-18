/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Logica;

import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author User
 */
public class ArtistaTest {
    
    public ArtistaTest() {
    }

    @Test
    public void testGetDescripcion() {
        System.out.println("GetDescripcion");
        Artista instance = new Artista();
        String expResult = "";
        String result = instance.GetDescripcion();
        assertEquals(expResult, result);
        
    }

    @Test
    public void testGetBiografia() {
        System.out.println("GetBiografia");
        Artista instance = new Artista();
        String expResult = "";
        String result = instance.GetBiografia();
        assertEquals(expResult, result);
        
    }

    @Test
    public void testGetLink() {
        System.out.println("GetLink");
        Artista instance = new Artista();
        String expResult = "";
        String result = instance.GetLink();
        assertEquals(expResult, result);
        
    }

    @Test
    public void testSetDescripcion() {
        System.out.println("SetDescripcion");
        String des = "";
        Artista instance = new Artista();
        instance.SetDescripcion(des);
       
    }

    @Test
    public void testSetLink() {
        System.out.println("SetLink");
        String _link = "";
        Artista instance = new Artista();
        instance.SetLink(_link);
        
    }

    @Test
    public void testSetBiografia() {
        System.out.println("SetBiografia");
        String bio = "";
        Artista instance = new Artista();
        instance.SetBiografia(bio);
        
    }

    @Test
    public void testArmarDT() {
        System.out.println("ArmarDT");
        Artista instance = new Artista();
        DtArtista expResult = null;
        DtArtista result = instance.ArmarDT();
        assertEquals(expResult, result);
        
    }

    @Test
    public void testAsociarEspectaculo() {
        System.out.println("asociarEspectaculo");
        Espectaculo e = new Espectaculo();
        Artista instance = new Artista();
        instance.asociarEspectaculo(e);
        
    }

    @Test
    public void testListarEspectaculosOrganizo() {
        System.out.println("listarEspectaculosOrganizo");
        Artista instance = new Artista();
        String[] expResult = new String[0];
        String[] result = instance.listarEspectaculosOrganizo();
        assertArrayEquals(expResult, result);
        
    }
    
}
