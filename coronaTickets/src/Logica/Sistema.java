/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Logica;
import Logica.DtEspectaculo;
import Logica.Categoria;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;
import Logica.Plataforma;
import Logica.Usuario;
import Logica.DtEspectaculo;
import Logica.DtUsuario;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.swing.JOptionPane;

/**
 *
 * @author User
 */
public class Sistema implements ISistema {
    
    private EntityManager em;
    
    public Sistema(){
      
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("coronaTicketsPU");
        this.em = emf.createEntityManager();

    }
   
    
    //  ** CREA UN NUEVO ESPECTACULO CON LOS DATOS RECIBIDOS 
    //  ** LO PERSISTE A NIVEL DE LA BASE DE DATOS
    //  ** ASOCIA EL ESPECTACULO CON LA PLATAFORMA EN DONDE SE CREO
    //  ** ASOCIA EL ESPECTACULO CON EL ARTISTA QUE ORGANIZO EL MISMO
    public void crearEspectaculo(String Plataforma,String nombre,Date fecha_registro,float costo, String url,int cant_max_espec,int cant_min_espec,int duracion,String descripcion, String artista, List categorias, int estado, String imagen, String video, String desc_premio, int cant_premios){
        
        em.getTransaction().begin();
        
        Plataforma p = em.find(Plataforma.class, Plataforma);
        Artista a = em.find(Artista.class, artista);
        
        List Listacategorias = new ArrayList();
        
        for(Object s: categorias){
            Categoria c = em.find(Categoria.class, s);
            Listacategorias.add(c);
        }
        
      
        Espectaculo e = new Espectaculo(nombre,fecha_registro,costo,url,cant_max_espec,cant_min_espec,duracion,descripcion, Plataforma, Listacategorias,estado, imagen, video, desc_premio, cant_premios);
        em.persist(e);
        p.agregarEspectaculo(e);
        a.asociarEspectaculo(e);
        em.getTransaction().commit();
 
    }
    
    
    // VERIFICA SI EL NOMBRE DEL ESPECTACULO RECIBIDIDO COMO PARAMETRO PERTENECE A UN ESPECTACULO YA CREADO, DEVUELTE TRUE EN CASO POSITIVO, FALSE EN CASO NEGATIVO
    public boolean verificarEspectaculo(String espectaculo){
        
        if(em.find(Espectaculo.class,espectaculo) == null){
            return false;
        }
        else{
            return true;
        }
      
    }
    
    
    // LISTA TODOS LOS ARTISTAS EXISTENTES, EN CASO DE QUE LA CONSULTA NO DEVUELVA NINGUN ARTISTA, DEVUELVE UN ARREGLO VACIO.
    public String[] listarArtistas(){
        
        Query q = em.createQuery("SELECT a.nickname FROM Artista a");
        try{
            List lista = q.getResultList();
            String res[] = new String[lista.size()];
            int i = 0;
            
            for(Object object: lista){
                res[i] = (String) object;
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // LISTA TODOS LOS ESPECTADORES EXISTENTES, EN CASO DE QUE LA CONSULTA NO DEVUELVA NINGUN ESPECTADOR, DEVUELVE UN ARREGLO VACIO.
    public String[] listarEspectadores(){
        
        Query q = em.createQuery("SELECT e.nickname FROM Espectador e");
        try{
            List lista = q.getResultList();
            String res[] = new String[lista.size()];
            int i = 0;
            
            for(Object object: lista){
                res[i] = (String) object;
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
 
    // LISTA TODAS LAS PLATAFORMAS EXISTENTES, EN CASO DE QUE LA CONSULTA NO DEVUELVA NIGNUNA PLATAFORMA, DEVUELVE UN ARREGLO VACIO
    public String[] listarPlataformas(){
        Query q = em.createQuery("SELECT p FROM Plataforma p");
        try{
            List plataformas = q.getResultList();
            String[] res = new String[plataformas.size()];
            int i = 0;

            for(Object object: plataformas){
                Plataforma p = (Plataforma) object;
                res[i] = p.GetNombre();
                i++;
            }
            return res; 
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // CREA UN NUEVO ESPECTADOR CON LOS DATOS RECIBIDIDOS Y LO PERSISTE.
    public void ingresarEspectador(String nombre, String apellido, String correo, String nickname, Date fecha_nac, String password, String imagen){
        
        Usuario u = new Espectador(nombre, apellido, correo, nickname, fecha_nac, password, imagen);
        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();
    }
    
    
    // CREA UN NUEVO ARTISTA CON LOS DATOS RECIBIDIDOS Y LO PERSISTE.
    public void ingresarArtista(String nombre, String apellido, String correo, String nickname, Date fecha_nac,String password, String descripcion, String biografia, String link, String imagen){
        
        Usuario u = new Artista(nombre, apellido, correo, nickname, fecha_nac,password, descripcion, biografia, link, imagen);
        em.getTransaction().begin();
        em.persist(u);
        em.getTransaction().commit();
    }
    
    
    // VERIFICA SI EXISTE UN USUARIO CON EL NICKNAME RECIBIDO COMO PARAMETRO, EN CASO POSITIVO RETORNA TRUE, EN CASO NEGATIVO RETORNA FALSE 
    public boolean UsuarioxNickname(String nickname){
        
        if(em.find(Artista.class, nickname) == null && em.find(Espectador.class, nickname) == null)
            return false;
        else
            return true;
        
    }
    
    
    // VERIFICA SI EXISTE UN USUARIO CON EL EMAIL RECIBIDO COMO PARAMETRO, EN CASO POSITIVO RETORNA TRUE, EN CASO NEGATIVO RETORNA FALSE 
    public boolean UsuarioxEmail(String email){
        
        try{
            Query q = em.createQuery("SELECT a FROM Artista a WHERE a.email = :email");
            q.setParameter("email", email);
            Artista art = (Artista) q.getSingleResult();
            return true;
        }catch(Exception e){
            
        }
        try{
            Query q2 = em.createQuery("SELECT e FROM Espectador e WHERE e.email = :email");
            q2.setParameter("email", email);
            Espectador esp = (Espectador) q2.getSingleResult();
            return true;
        }
        catch(Exception e){
            
        } 
        return false;
   
    }
    
    
    // DEVUELVE UN ARREGLO CON TODOS LOS NICKNAMES DE LOS USUARIOS, TANTO ESPECTADORES COMO ARTISTAS.
    public String[] ColNickname(){
        //Query q = em.createQuery("Select a.nickname from Artista a UNION Select e.nickname from Espectador e");
        Query q = em.createQuery("Select CONCAT(a.nickname, ' (A)') FROM Artista a UNION Select CONCAT(e.nickname, ' (E)') FROM Espectador e");
        
     
        try{
            List lista = q.getResultList();
            //List listaEspectadores = q1.getResultList();

            String res[] = new String[lista.size()];
            int i = 0;

            for(Object object :lista){
                res[i] =(String) object;
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // DEVUELVE UN DTUSUARIO CON LA INFORMACION DEL USUARIO CON NICKNAME IGUAL AL RECIBIDO COMO PARAMETRO
    public DtUsuario GetDtUsuario(String nickname){

        if(em.find(Artista.class, nickname) == null){
            
            Espectador esp = em.find(Espectador.class, nickname);
            DtEspectador dtEsp = esp.ArmarDT();
            return dtEsp;
        }
        else{
            Artista art = em.find(Artista.class,nickname);
            DtArtista dtArt = art.ArmarDT();
            return dtArt;
       
        }
    }
    
    
    // EJECUTA UNA SENTENCIA SQL PARA MODIFICAR AL ESPECTADOR CON EL NICKNAME DADO.
    public void modificarEspectador(String nickname, String nombre, String apellido, Date f, String imagen){
        em.getTransaction().begin();
        Query q = em.createQuery("UPDATE Espectador e SET e.nombre = :nombre, e.apellido = :apellido, e.fecha_nac = :fecha, e.imagen = :imagen WHERE e.nickname = :nickname");
        q.setParameter("fecha", f);
        q.setParameter("nombre", nombre);
        q.setParameter("apellido", apellido);
        q.setParameter("nickname", nickname);
        q.setParameter("imagen", imagen);
        q.executeUpdate();
       
        Espectador esp = em.find(Espectador.class, nickname);
        em.refresh(esp); // NECESARIO PARA QUE LOS CAMBIOS EN EL ESPECTADOR SE VEAN INMEDIATAMENTE, SIN NECESIDAD DE CERRAR Y VOLVER A ABRIR LA APLICACION.
        em.getTransaction().commit();
    }
    
    
    // EJECUTA UNA SENTENCIA SQL PARA MODIFICAR AL ARTISTA CON EL NICKNAME DADO
    public void ModificarArtista (String nickname, String nombre,String apellido, Date f,String descripcion, String biografia, String link, String imagen){
        em.getTransaction().begin();
        Query q = em.createQuery("UPDATE Artista a SET a.nombre = :nombre, a.apellido = :apellido, a.fecha_nac = :fecha, a.biografia = :biografia, a.descripcion = :descripcion, a.link = :link, a.imagen = :imagen WHERE a.nickname = :nickname");
        q.setParameter("fecha", f);
        q.setParameter("nombre", nombre);
        q.setParameter("apellido", apellido);
        q.setParameter("biografia", biografia);
        q.setParameter("descripcion", descripcion);
        q.setParameter("link", link);
        q.setParameter("nickname", nickname);
        q.setParameter("imagen", imagen);
        q.executeUpdate();
       
        Artista art = em.find(Artista.class, nickname);
        em.refresh(art); // NECESARIO PARA QUE LOS CAMBIOS EN EL ARTISTA SE VEAN INMEDIATAMENTE, SIN NECESIDAD DE CERRAR Y VOLVER A ABRIR LA APLICACION.
        em.getTransaction().commit();
    }
    
    
    // LISTA TODOS LOS ESPECTACULOS DEL SISTEMA QUE PERTENECEN A LA PLATAFORMA CON NOMBRE IGUAL AL PARAMETRO RECIBIDO 
    // EN CASO DE QUE LA CONSULTA NO DEVUELVA NADA, SE RETORNA UN STRING VACIO
    public String[] listarEspectaculos(String n){
  
        Query q = em.createQuery("SELECT pe.Espectaculos FROM Plataforma pe WHERE pe.nombre = :plataforma");
        q.setParameter("plataforma", n);
        
        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;

            for(Object object: espectaculos){
                Espectaculo esp = (Espectaculo) object;
                if(esp.getFinalizado() == false){
                    res[i] = esp.getNombre();
                    i++;
                }
                
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // DEVUELVE UN DTESPECTACULO CON LA INFORMACION DEL ESPECTACULO CON NOMBRE IGUAL AL RECIBIDO POR PARAMETRO
    public DtEspectaculo mostrarEspectaculo (String espectaculo){
       
        Query q = em.createQuery("SELECT esp FROM Espectaculo esp WHERE esp.nombre = :espectaculo");
        q.setParameter("espectaculo", espectaculo);
        
        Espectaculo e =  (Espectaculo) q.getSingleResult();
        DtEspectaculo DtE = e.crearDtEspectaculo();
        return DtE;
    }
    
    
    // LISTA TODOS LOS ESPECTACULOS QUE FUERON ORGANIZADOS POR EL ARTISTA DE NICKNAME IGUAL AL PARAMETRO RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN RESULTADO, SE DEVUELVE UNA LISTA VACIA.
    public String[] listarespectaculosXArtista(String artista){

        Query q = em.createQuery("SELECT a.organiza FROM Artista a WHERE a.nickname = :nickname");
        q.setParameter("nickname", artista);

        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;
           
            for (Object object: espectaculos){
                Espectaculo e = (Espectaculo) object;
                if(e.getFinalizado() == false){
                    res[i] = e.getNombre();
                    i++; 
                }
                
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    // LISTA TODOS LOS ESPECTACULOS QUE FUERON ORGANIZADOS POR EL ARTISTA DE NICKNAME IGUAL AL PARAMETRO RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN RESULTADO, SE DEVUELVE UNA LISTA VACIA.
    public String[] listarespectaculosAceptadosXArtista(String artista){

        Query q = em.createQuery("SELECT a.organiza FROM Artista a WHERE a.nickname = :nickname");
        q.setParameter("nickname", artista);

        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;
           
            for (Object object: espectaculos){
                Espectaculo e = (Espectaculo) object;
                if(e.getEstado() == 1 && e.getFinalizado() == false){
                    res[i] = e.getNombre();
                    i++;
                }
                
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    public List listarespectaculosAceptadosXArtistaWeb(String artista){

        Query q = em.createQuery("SELECT a.organiza FROM Artista a WHERE a.nickname = :nickname");
        q.setParameter("nickname", artista);

        try{
            List espectaculos = q.getResultList();
            return espectaculos;
      
        }catch(Exception e){
            List lista = new ArrayList();
            return lista;
        }
    }
    
    
    // VERIFICA SI EXISTE UN PAQUETE EN EL SISTEMA CON MISMO NOMBRE QUE EL RECIBIDO POR PARAMETRO, EN CASO POSITIVO RETORNA TRUE, EN CASO NEGATIVO FALSE
    public boolean ExistePaquete(String paquete){
        
        if(em.find(Paquete.class, paquete) == null){
            return false;
        }
        else{
            return true;
        }
    }
    
    
    // CREA UN NUEVO PAQUETE CON LOS DATOS RECIBIDOS Y LO PERSISTE
    public void AgregarPaquete(String nombre, String descripcion, float descuento, Date fecha_alta, Date fecha_fin, Date fecha_ini, String imagen){
        Paquete p = new Paquete(nombre, descripcion, descuento, fecha_alta, fecha_fin, fecha_ini, imagen);
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
    }
    
    
    // LISTA TODOS LOS PAQUETES EXISTENTES, EN CASO DE QUE LA QUERY NO RETORNE NI UN PAQUETE, RETORNA UN ARREGLO VACIO
     public String[] listarPaquetes(){
        Query q = em.createQuery("SELECT p FROM Paquete p");
        try{
            List paquetes = q.getResultList();
            String[] res = new String[paquetes.size()];
            int i = 0;

            for(Object object: paquetes){
                Paquete p = (Paquete) object;
                res[i] = p.getNombre();
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
     
     
     // LISTA TODOS LOS PAQUETES EXISTENTES QUE AUN ESTEN VIGENTES, EN CASO DE QUE LA QUERY NO RETORNE NI UN PAQUETE, RETORNA UN ARREGLO VACIO
     public String[] listarPaquetesVigentes(){
        Query q = em.createQuery("SELECT p FROM Paquete p");
        try{
            List paquetes = q.getResultList();
            String[] res = new String[paquetes.size()];
            int i = 0;

            Date actual = new Date();
            
            for(Object object: paquetes){
                Paquete p = (Paquete) object;
                
                if(actual.before(p.getFecha_fin())){
                    res[i] = p.getNombre();
                    i++;
                }
                
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
     
     public List listarPaquetesVigentesWeb(){
        Query q = em.createQuery("SELECT p FROM Paquete p");
        Date actual = new Date();
        try{
            List paquetes = q.getResultList();
            List res = new ArrayList();
            
            for(Object object: paquetes){
                Paquete p = (Paquete) object;
                
                 if(actual.before(p.getFecha_fin())){
                    res.add(p);
                }
            }
            return res;
        }catch(Exception e){
            List lista = new ArrayList();
            return lista;
        }
    }
    
     
    // DEVUELVE UN DTPAQUETE CON LOS DATOS DEL PAQUETE CON NOMBRE IGUAL AL PARAMETRO RECIBIDO 
    public DtPaquete mostrarPaquete(String paquete){
        
        Query q = em.createQuery("SELECT p FROM Paquete p WHERE p.nombre = :nombre ");
        q.setParameter("nombre", paquete);
        
        Paquete p = (Paquete) q.getSingleResult();
        DtPaquete dtP = p.ArmarDT();
        return dtP;
    }
    
    
    // VERIFICA SI EL ESPECTACULO PERTENECE AL PAQUETE, AMBOS DATOS RECIBIDOS POR PARAMETRO
    public boolean EspectaculoenPaq (String paquete, String espectaculo){
        Query q = em.createQuery("SELECT p.espectaculos FROM Paquete p WHERE p.nombre = :paquete");
        q.setParameter("paquete", paquete);
        
        try{
            List espectaculos = q.getResultList();
            for(Object object: espectaculos){
                Espectaculo e = (Espectaculo) object;
                if(e.getNombre().equals(espectaculo)){
                    return true;
                }
            }
            return false;
        }catch(Exception e){
            return false;
        }   
    }
    
     public int EspectaculoenPaqWeb (String paquete, String espectaculo){
        Query q = em.createQuery("SELECT p.espectaculos FROM Paquete p WHERE p.nombre = :paquete");
        q.setParameter("paquete", paquete);
        
        try{
            List espectaculos = q.getResultList();
            for(Object object: espectaculos){
                Espectaculo e = (Espectaculo) object;
                if(e.getNombre().equals(espectaculo)){
                    return 1;
                }
            }
            return 2;
        }catch(Exception e){
            return 3;
        }   
    }
    
    
    // AÑADE EL ESPECTACULO CON NOMBRE IGUAL AL RECIBIDO POR PARAMETRO AL PAQUETE CON NOMBRE IGUAL AL RECIBIDO POR PARAMETRO
    public void AddEspectaculoaPaquete(String paquete, String espectaculo){
        em.getTransaction().begin();
        
        Espectaculo esp = em.find(Espectaculo.class,espectaculo);
        Paquete p = em.find(Paquete.class, paquete);
        
        // OBTENGO TODAS LAS CATEGORIAS DEL PAQUETE Y DEL ESPECTACULO
        String[] catdePaquete = this.listarCategoriasxPaquete(paquete);
        String[] catdeEspectaculo = this.listarCategoriasxEspectaculo(espectaculo);
        
        
        if(catdePaquete[0].equals("Vacio")){ // SI EL PAQUETE NO TIENE NIGNUNA CATEGORIA, SE AGREGAN TODAS LAS DEL ESPECTACULO
            
            for(String cat: catdeEspectaculo){
                Categoria c = em.find(Categoria.class,cat);
                p.addCategoria(c);
            }
        }
        
        else{
            boolean esta;
            // ESTA PORCION DE CODIGO REVISA CADA UNA DE LAS CATEGORIAS DEL ESPECTACULO NUEVO, Y SI NO SE ENCUENTRAN EN EL PAQUETE, LAS AGREGA.
            for(String s: catdeEspectaculo){
                esta = false;
         
                for(String s2: catdePaquete){
                    if(s.equals(s2)){
                        esta = true;
                        break;
                    }
                }
                if(esta == false){
                    Categoria c = em.find(Categoria.class,s);
                    p.addCategoria(c); 
                }

            }
        }
        
        p.addEsp(esp);
        em.getTransaction().commit();
    }
    
    
    // LISTA TODOS LOS ESPECTACULOS PERTENECIENTES AL PAQUETE CON NOMBRE IGUAL AL RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN VALOR, SE RETORNA UN ARREGLO VACIO
    public String[] listarEspectaculosxPaq(String paquete){
        Query q = em.createQuery("SELECT p.espectaculos FROM Paquete p WHERE p.nombre = :paquete");
        q.setParameter("paquete", paquete);
        
        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;
    
            for(Object object: espectaculos){
                Espectaculo e = (Espectaculo) object;
                res[i] = e.getNombre();
                i++;
            }
            
            return res;
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // LISTA TODOS LOS PAQUETES DE LOS CUALES FORMA PARTE EL ESPECTACULO CON NOMBRE IGUAL AL RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN VALOR, SE DEVUELVE UN ARREGLO VACIO
    public String[] listarPaquetesdeEsp(String espectaculo){
        
        //Query q = em.createNativeQuery("SELECT p.paquete_nombre FROM paquete_espectaculo p WHERE p.espectaculos_nombre = '"+ espectaculo+"'");
     
        try{
            Query q = em.createNativeQuery("SELECT p.paquete_nombre FROM paquete_espectaculo p WHERE p.espectaculos_nombre = '"+ espectaculo+"'");
            List lista = q.getResultList();
            String[] res = new String[lista.size()];
            int i=0;
            for(Object object: lista){
                String nombre = (String) object;
                res[i] = nombre;
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // CREA UNA NUEVA FUNCION CON LOS DATOS INTRODUCIDOS
    // PARA CADA UNO DE LOS NICKNAMES DE ARTISTAS RECIBIDOS EN LA LISTA, ASOCIA DICHO ARTISTA A LA NUEVA FUNCION COMO ARTISTAS INVITADOS
    // FINALMENTE ASOCIA A LA FUNCION CON EL ESPECTACULO AL CUAL PERTENECE
    public void AgregarFuncion(String nombre, Date fecha_hora, Date fecha_registro, String espectaculo, List artistas, String imagen){
        
        em.getTransaction().begin();
        Funcion f = new Funcion(nombre, fecha_registro, fecha_hora,espectaculo, imagen);
        
        for(Object object: artistas){
            Artista art = em.find(Artista.class, object);
            f.agregarArtistaInvitado(art);
        }
        
        Espectaculo esp = em.find(Espectaculo.class, espectaculo);
        esp.agregarFuncion(f);
        em.persist(f);
        em.getTransaction().commit();
    }
    
    
    // LISTA TODOS LOS ARTISTAS INVITADOS A LA FUNCION CON NOMBRE IGUAL AL VALOR RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN VALOR SE DEVUELVE UN ARREGLO VACIO.
    public String[] Artistasinvitados(String funcion){
        
        Query q = em.createQuery("SELECT f.Artistas FROM Funcion f WHERE f.nombre = :funcion");
        q.setParameter("funcion", funcion);
        
        try{
            List artistas = q.getResultList();
            String[] res = new String[artistas.size()];
            int i=0;
            
            for(Object object: artistas){
                Artista art = (Artista) object;
                res[i] = art.GetNickname();
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // VERIFICA SI EXISTE UNA FUNCION CON NOMBRE IGUAL AL VALOR RECIBIDO POR PARAMETRO, EN CASO POSITIVO RETORNA TRUE, EN CASO NEGATIVO FALSE
    public boolean ExisteFuncion(String funcion){
        if(em.find(Funcion.class, funcion) == null){
            return false;
        }
        else{
            return true;
        }
    }


    // DEVUELVE UN DTFUNCION CON LOS DATOS DE LA FUNCION CON NOMBRE IGUAL AL VALOR RECIBIDO POR PARAMETRO
    public DtFuncion MostrarFuncion (String funcion){
        
        Query q = em.createQuery("SELECT f FROM Funcion f WHERE f.nombre = :funcion");
        q.setParameter("funcion", funcion);

        Funcion f= (Funcion) q.getSingleResult();
        DtFuncion dtF = f.crearDtFuncion();
        return dtF;
    }
    
    
    // LISTA TODOS LOS ARTISTAS A EXCEPCION DEL ARTISTA ORGANIZADOR DEL ESPECTACULO CON NOMBRE IGUAL AL VALOR RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN VALOR, SE RETORNA UN ARREGLO VACIO.
    public String[] listarArtistasmenosOrganizador(String espectaculo){
        
        Query q = em.createNativeQuery("SELECT DISTINCT a.nickname FROM artista a  WHERE a.nickname NOT IN (SELECT ae.artista_nickname FROM artista_espectaculo ae WHERE ae.organiza_nombre = " +"'" + espectaculo +"')");

        try{
            List lista = q.getResultList();
            String[] res = new String[lista.size()];
            int i=0;
            for(Object object: lista){
                String nombre = (String) object;
                res[i] = nombre;
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // LISTA TODAS LAS FUNCIONES PERTENECIENTES AL ESPECTACULO CON NOMBRE IGUAL AL VALOR RECIBIDO POR PARAMETRO
    // EN CASO DE QUE LA QUERY NO RETORNE NINGUN VALOR, SE DEVUELVE UN ARREGLO VACIO
    public String[] listarFuncionesxEspectaculo(String espectaculo){
        
        Query q = em.createQuery("SELECT e.Funciones FROM Espectaculo e WHERE e.nombre = :nombre");
        q.setParameter("nombre", espectaculo);
        
        try{
            List funciones = q.getResultList();
            String[] res = new String[funciones.size()];
            int i = 0;
            for(Object object: funciones){
                Funcion f = (Funcion) object;
                res[i] = f.getNombre();
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // DADO EL NOMBRE DE UN ESPECTACULO DEVUELVE EL PRECIO DEL MISMO
    public float darPrecioEspectaculo(String espectaculo){
        Query q = em.createQuery("SELECT e.costo FROM Espectaculo e WHERE e.nombre = :espectaculo");
        q.setParameter("espectaculo", espectaculo);
        float costo = (float) q.getSingleResult();
        return costo;
    }
    
    
    // VERIFICA SI EL ESPECTADOR CON NOMBRE IGUAL AL VALOR PASADO POR PARAMETRO YA SE REGISTRO A LA FUNCION CON NOMBRE IGUAL AL VALOR PASADO POR PARAMETRO
    public boolean espectadorRegistrado(String espectador, String funcion){
        
        Query q = em.createNativeQuery("SELECT COUNT(*) FROM espectador_registro er WHERE er.espectador_nickname = '" + espectador +"' AND er.registros_key = '"+funcion+"'");
        
        long cant = (long) q.getSingleResult();
        
        if(cant == 0){
            return false;
        }
        else{
            return true;
        }
    }
    
    // VERIFICA SI EL ESPECTADOR CON NOMBRE IGUAL AL VALOR PASADO POR PARAMETRO YA COMPRO EL PAQUETE CON NOMBRE IGUAL AL VALOR PASADO POR PARAMETRO
    public boolean espectadorComproPaquete(String espectador, String paquete){
        
        Query q = em.createNativeQuery("SELECT COUNT(*) FROM espectador_paquete ep WHERE ep.espectador_nickname = '" + espectador +"' AND ep.paquetes_nombre = '"+paquete+"'");
        
        long cant = (long) q.getSingleResult();
        
        if(cant == 0){
            return false;
        }
        else{
            return true;
        }
    }
    
    
    
    public void comprarPaquete(String nickname, String paquete){
        em.getTransaction().begin();
        Espectador e = em.find(Espectador.class, nickname);
        Paquete p = em.find(Paquete.class, paquete);
        
        e.comprarPaquete(p);
        em.getTransaction().commit();
    }
    
    
    
    // VERIFICA SI TODAVIA NO SE HAN REGISTRADO EL MAXIMO DE PERSONAS PARA UNA FUNCION DE UN ESPECTACULO EN CONCRETO, 
    //COMPARANDO EL ATRIBUTO CANT_MAX_ESPEC DEL ESPECTACULO CON LA CANTIDAD DE REGISTROS A LA FUNCION.
    public boolean cantMaxAsistentes(String espectaculo, String funcion){
        Query q = em.createQuery("SELECT e.cant_max_espec FROM Espectaculo e WHERE e.nombre = :espectaculo");
        q.setParameter("espectaculo", espectaculo);
        int max = (int) q.getSingleResult();
        
        Query q2 = em.createNativeQuery("SELECT COUNT(*) FROM espectador_registro er WHERE  er.registros_key = '"+funcion+"'");
        long cant = (long) q2.getSingleResult();
        
        if(cant < max){
            return false;
        }
        else{
            return true;
        }
        
    }
    
    
    // CREA Y AGREGA UN NUEVO REGISTRO. ASOCIA EL REGISTRO CON EL ESPECTADOR QUE SE REGISTRO.
    public void agregarRegistro(String espectador,String funcion, String espectaculo, Date f, int costo){
        
        em.getTransaction().begin();
        
        Espectador esp = (Espectador) em.find(Espectador.class, espectador);
        Funcion fu = (Funcion) em.find(Funcion.class, funcion);
        Espectaculo e = (Espectaculo) em.find(Espectaculo.class, espectaculo);
        
        if(costo != 0){
             costo = (int) e.getCosto();
        }
        
        Registro r = new Registro(f, costo, fu);
        em.persist(r);
        
        esp.agregarRegistro(r, fu.getNombre());
        
        em.getTransaction().commit();
        
    }
    
    
    // VERIFICA SI EXISTEN AL MENOS 3 REGISTROS DE UN ESPECTADOR QUE CUMPLAN CON LA CONDICION DE QUE PUEDEN SER CANJEADOS PARA OBTENER UN NUEVO REGISTRO GRATIS
    // ESTO LO HACE VERIIFCANDO QUE LOS REGISTROS NO HAYAN SIDO CANJEADOS ANTES Y VERIFICANDO QUE LA FUNCION DEL REGISTRO TODAVIA NO HAYA SUCEDIDO.
    public boolean alMenos3Registros (String espectador){
        Query q = em.createQuery("SELECT e.registros FROM Espectador e WHERE e.nickname = :espectador");
        q.setParameter("espectador", espectador);
        try{
            List registros = q.getResultList();    
            int i = 0;
            Date actual = new Date();
            for(Object object : registros){
                Registro r = (Registro) object;    
                if(r.getCanjeado() != true && r.funcion.getFecha_hora().after(actual)){
                    i++;         
                }
            }
            if(i >= 3){
                return true;
            }
            else{
                return false;
            }
        }catch(Exception e){
           return false;
        }
    }
    
    
    // LISTA LOS REGISTROS QUE CUMPLEN CON LA CONDICION INDICADA EN LA FUNCION DE ARRIBA
    public List ListarRegistros (String espectador){
        Query q = em.createQuery("SELECT e.registros FROM Espectador e WHERE e.nickname = :espectador");
        q.setParameter("espectador", espectador);
        
        try{
            List registros = q.getResultList();
            List<DtRegistro> listaDtRegistros = new ArrayList<DtRegistro>();

            int i = 0;
            Date actual = new Date();
            for(Object object : registros){
                Registro r = (Registro) object;
                if(r.getCanjeado() != true && r.funcion.getFecha_hora().after(actual)){ 
                    DtRegistro dtr = r.ArmarDt();
                    listaDtRegistros.add(dtr);
                }
            }
            return listaDtRegistros;
        }catch(Exception e){
           return null;
        }
        
    }
    
    
    // RECIBE UNA LISTA DE  3 REGISTROS QUE FUERON CANJEADOS, APLICA UN UPDATE A NIVEL DE LA BASE DE DATOS PARA MARCARLOS COMO CANJEADOS
    public void CanjeoRegistros(List RegistrosSeleccionados, String espectador){
        
        em.getTransaction().begin();
        
        for(Object object: RegistrosSeleccionados){
            
            String funcion = (String) object;
            
            Query q = em.createNativeQuery("SELECT r.id FROM registro r  WHERE r.funcion_nombre = '"+funcion+"' AND r.id IN (SELECT er.registros_id FROM espectador_registro er WHERE espectador_nickname = '"+espectador+"')");
            int id = (int) q.getSingleResult();
            
            Query q2 = em.createQuery("UPDATE Registro r SET r.canjeado = true WHERE r.id = :id");
            q2.setParameter("id", id);
            q2.executeUpdate();
            Registro r = em.find(Registro.class, id);
            em.refresh(r);
            
        }
        em.getTransaction().commit();
      
    }
    
    
    // LISTA TODAS LAS FUNCIONES A LAS CUALES SE REGISTRO UN ESPECTADOR EN CONCRETO.
    public String[] listarfuncionesxEspectador(String nickname){
        
        Query q = em.createQuery("SELECT e.registros FROM Espectador e WHERE e.nickname = :nickname");
        q.setParameter("nickname", nickname);
        
        try{
            List registros = q.getResultList();
            String[] res = new String[registros.size()];
            int i = 0;
            
            for(Object object: registros){
                Registro r = (Registro) object;
                res[i] = r.funcion.getNombre();
                i++;
            }
            return res;
            
        }catch(Exception e ){
            return new String[1];
        }
    }
    
    
    
    
    
    // LISTA TODAS LAS FUNCIONES QUE YA FUERON REALIZADAS A LAS CUALES SE REGISTRO UN ESPECTADOR EN CONCRETO.
    public List listarfuncionesRealizadasxEspectador(String nickname){
        
        Query q = em.createQuery("SELECT e.registros FROM Espectador e WHERE e.nickname = :nickname");
        q.setParameter("nickname", nickname);
        
        try{
            List registros = q.getResultList();
            List res = new ArrayList();
            Date actual = new Date();
            
            for(Object object: registros){
                Registro r = (Registro) object;
                if(actual.after(r.funcion.getFecha_hora())){
                    res.add(r.funcion.getNombre());

                }
                
            }
            return res;
            
        }catch(Exception e ){
            return new ArrayList();
        }
    }
    
    
    public List listaEspectaculosSegunFunciones(List funciones){
        
        if(funciones.size() == 0){
            return new ArrayList();
        }
        else{
            List res = new ArrayList();
            for(Object x: funciones){
                String s = (String) x;
                Query q = em.createQuery("SELECT f.espectaculo FROM Funcion f WHERE f.nombre = :funcion");
                q.setParameter("funcion",s );
                String esp = (String) q.getSingleResult();
                res.add(esp);
            }
            // ELIMINAMOS POSIBLES REPETIDOS
            Set<String> set = new HashSet<>(res);
            res.clear();
            res.addAll(set);
            return res;
        }
    }
    
    
    
    public boolean ExisteCategoria(String nombre){
        
        if( em.find(Categoria.class, nombre) == null){
            return false;
        }
        else{
            return true;
        }
        
    }
    
    public void AgregarCategoria(String categoria){
        
        Categoria c = new Categoria(categoria);
        
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
    
    }
    
    public String[] listarCategorias(){
        Query q = em.createQuery("SELECT c FROM Categoria c");
        
        try{
           List categorias = q.getResultList();
           String[] res = new String[categorias.size()];
           int i = 0;
           
           for(Object object: categorias){
               Categoria c = (Categoria) object;
               res[i] = c.getNombre();
               i++;
           }
           return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    public String[] listarCategoriasxEspectaculo(String nombre){
        Query q = em.createQuery("SELECT e.categorias FROM Espectaculo e WHERE e.nombre = :nombre");
        q.setParameter("nombre", nombre);
        
        try{
            List categorias = q.getResultList();
            String res[] = new String[categorias.size()];
            int i = 0;
            
            for(Object object: categorias ){
                Categoria cat = (Categoria) object;
                res[i] = cat.getNombre();
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    public String[] listarCategoriasxPaquete(String nombre){
        Query q = em.createQuery("SELECT p.categorias FROM Paquete p WHERE p.nombre = :nombre");
        q.setParameter("nombre", nombre);
        
        try{
            List categorias = q.getResultList();
            String res[] = new String[categorias.size()];
            int i = 0;
            
            for(Object object: categorias ){
                Categoria cat = (Categoria) object;
                res[i] = cat.getNombre();
                i++;
            }
            return res;
            
        }catch(Exception e){
            String vacio[] = new String[1];
            vacio[0] = "Vacio";
            return vacio;
        }
    }
    
    public String[] listarEspectaculosxCategoria(String categoria){
        
        Query q = em.createNativeQuery("SELECT DISTINCT ec.espectaculo_nombre FROM espectaculo_categoria ec WHERE ec.categorias_nombre = ' " + categoria +" ';");
        
        try{
            List espectaculos = q.getResultList();
            String res[] = new String[espectaculos.size()];
            int i = 0;
            
            for(Object object: espectaculos){
                String s = (String) object;
                res[i] = s;
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    public String [] listarEspectaculosSinAceptar(){
        Query q = em.createQuery("SELECT e FROM Espectaculo e WHERE e.estado = 0");
        
        try{
            List espectaculos = q.getResultList();
            String res[] = new String[espectaculos.size()];
            int i = 0;
            
            for(Object object: espectaculos){
                Espectaculo e = (Espectaculo) object;
                res[i] = e.getNombre();
                i++;
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    
    }
    
    public String[] listarEspectaculosAceptadosxPlataforma(String n){
        Query q = em.createQuery("SELECT pe.Espectaculos FROM Plataforma pe WHERE pe.nombre = :plataforma");
        q.setParameter("plataforma", n);
        
        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;

            for(Object object: espectaculos){
                Espectaculo esp = (Espectaculo) object;
                em.refresh(esp);
                if(esp.getEstado() == 1 && esp.getFinalizado() == false){
                   res[i] = esp.getNombre();
                    i++; 
                }
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    public String[] listarEspectaculosAceptados(){
        Query q = em.createQuery("SELECT e FROM Espectaculo e WHERE e.estado = 1 AND e.finalizado = false");
  
        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;

            for(Object object: espectaculos){
                Espectaculo esp = (Espectaculo) object;
                em.refresh(esp);
                res[i] = esp.getNombre();
                i++;   
            }
            return res;
            
        }catch(Exception e){
            return new String[1];
        }
    }
    
    public List listarEspectaculosAceptadosxPlataformaWeb(String n){
        Query q = em.createQuery("SELECT pe.Espectaculos FROM Plataforma pe WHERE pe.nombre = :plataforma");
        q.setParameter("plataforma", n);
        
        try{
            List espectaculos = q.getResultList();
            return espectaculos;
      
        }catch(Exception e){
            List lista = new ArrayList();
            return lista;
        }
    }
    
    public void CambiarEstadoEspectaculo(String espectaculo, int estado){
        
        Espectaculo e = em.find(Espectaculo.class, espectaculo);
        
        em.getTransaction().begin();
        Query q = em.createQuery("UPDATE Espectaculo e SET e.estado = :estado WHERE e.nombre = :espectaculo");
        q.setParameter("estado", estado); q.setParameter("espectaculo", espectaculo);
        q.executeUpdate();
        em.refresh(e);
        em.getTransaction().commit();
        
        
    
    }
    
    
    
    // EL USUARIO 2 COMIENZA A SER SEGUIDOR DEL USUARIO 1
    public void AddSeguidor(String usuario1, String usuario2){
        
        em.getTransaction().begin();
        Usuario u = em.find(Usuario.class, usuario1);
        Usuario u2 = em.find(Usuario.class, usuario2);
        
        u.addSeguidor(u2);
        em.getTransaction().commit();
    }
    
    
    // EL USUARIO 2 DEJA DE SEGUIR AL USUARIO 1
    public void DejardeSeguir(String usuario1, String usuario2){
        
       em.getTransaction().begin();
       
       Usuario u = em.find(Usuario.class, usuario1);
       Usuario u2 = em.find(Usuario.class, usuario2);
       
       Query q = em.createNativeQuery("DELETE FROM espectador_usuario WHERE espectador_nickname = '"+usuario1+"' AND seguidores_nickname = '"+usuario2+"';");
       Query q2 = em.createNativeQuery("DELETE FROM artista_usuario WHERE artista_nickname = '"+usuario1+"' AND seguidores_nickname = '"+usuario2+"';");
       
       q.executeUpdate();
       q2.executeUpdate();
       
       try{
           u.deleteSeguidor(u2); 
       }catch(Exception e){
           
       }
       em.refresh(u);
       em.refresh(u2);
      
       
       em.getTransaction().commit();
    }
            
    
    
    // VERIFICA SI EL USUARIO 2 SIGUE AL USUARIO 1
    public boolean EsSeguidor(String usuario1, String usuario2){
        
        Query q = em.createNativeQuery("SELECT (( SELECT COUNT(*) FROM artista_usuario au WHERE au.seguidores_nickname = '" + usuario2 +"' AND au.artista_nickname = '"+usuario1+"')\n" +
        "+\n" +
        "+(SELECT COUNT(*) FROM espectador_usuario eu WHERE eu.seguidores_nickname = '"+usuario2+"' AND eu.espectador_nickname = '"+usuario1+"')\n" +
        ") ");
        
        long cant = (long) q.getSingleResult();
        if(cant == 0){
            return false;
        }
        else{
            return true;
        }
    }
    
    public boolean ComprobarLogin(String user, String password, String tipo){
        if(tipo.equals("Artista")){
            Query q = em.createQuery("Select a FROM Artista a WHERE a.nickname = :nickname AND a.password = :password");
            q.setParameter("nickname", user);
            q.setParameter("password", password);
            
            try{
                q.getSingleResult();
                return true;
                
            }catch(Exception e){
                return false;
            }
        }
        else{
            Query q = em.createQuery("Select e FROM Espectador e WHERE e.nickname = :nickname AND e.password = :password");
            q.setParameter("nickname", user);
            q.setParameter("password", password);
            
            try{
                q.getSingleResult();
                return true;
                
            }catch(Exception e){
                return false;
            }
        }
    }
    
    public String[] listarSeguidores(String nickname){
        
        Usuario u = em.find(Usuario.class, nickname);
        if(u instanceof Artista){
            Query q = em.createNativeQuery("SELECT au.seguidores_nickname FROM artista_usuario au WHERE artista_nickname = '"+nickname+"';");
            try{
                List lista = q.getResultList();
                String[] res = new String[lista.size()];
                int i = 0;
                for(Object object: lista){
                    String s = (String) object;
                    res[i] = s;
                    i++;
                }
                return res;
            }catch(Exception e){
                return new String[1];
            }
        } 
        else{
            Query q = em.createNativeQuery("SELECT eu.seguidores_nickname FROM espectador_usuario eu WHERE espectador_nickname = '"+nickname+"';");
            try{
                List lista = q.getResultList();
                String[] res = new String[lista.size()];
                int i = 0;
                for(Object object: lista){
                    String s = (String) object;
                    res[i] = s;
                    i++;
                }
                return res;
            }catch(Exception e){
                return new String[1];
            }
            
        }
    }
    
    public String[] listarSeguidos(String nickname){
        Query q = em.createNativeQuery("SELECT au.artista_nickname FROM artista_usuario au WHERE seguidores_nickname = '"+nickname+"'\n" +
                                    "UNION\n" +
                                    "SELECT eu.espectador_nickname FROM espectador_usuario eu WHERE seguidores_nickname = '"+nickname+"'");
        
        try{
            List lista = q.getResultList();
            String[] res = new String[lista.size()];
            int i = 0;
            for(Object object: lista){
                String s = (String) object;
                res[i] = s;
                i++;
            }
            return res;
        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    // LISTA TODOS LOS PAQUETES COMPRADOS POR UN ESPECTADOR EN ESPECIFICO
     public String[] listarPaquetesComprados(String espectador){
         Query q = em.createQuery("SELECT e.paquetes FROM Espectador e WHERE e.nickname = :nickname");
         q.setParameter("nickname", espectador);
         
         try{
             List lista = q.getResultList();
             String[] res = new String[lista.size()];
             int i = 0;
             for(Object object: lista){
                 Paquete p = (Paquete) object;
                 res[i] = p.getNombre();
                 i++;
             }
             return res;
             
         }catch(Exception e){
             return new String[1];
         }
         
     }
     
     
    // FUNCION USADA PARA ENCONTRAR LOS ESPECTACULOS CUYOS NOMBRE O DESCRIPCION CONTENGAN EL TEXTO PASADO POR PARAMETRO, SE USA EN EL BUSCADOR DE LA PAGINA WEB ORDENADO ALFABETICAMENTE
    public List BuscadorEspectaculo(String texto, int orden){
        
        Query q;
        if(orden == 0){
            q = em.createQuery("SELECT e FROM Espectaculo e WHERE e.estado = 1 AND e.finalizado = false ORDER BY e.nombre ASC");
        }
        else{
            q = em.createQuery("SELECT e FROM Espectaculo e WHERE e.estado = 1 AND e.finalizado = false ORDER BY e.fecha_registro DESC");
        }
        
        try{
           List lista = q.getResultList();
           List res = new ArrayList();
           
           for(Object obj: lista){
               Espectaculo e = (Espectaculo) obj;
               String nombre = e.getNombre();
               String descripcion = e.getDescripcion();
               if( (nombre.toLowerCase().contains(texto.toLowerCase())) || descripcion.toLowerCase().contains(texto.toLowerCase())){
                   res.add(e.getNombre());
               }
           }
           return res;
        }catch(Exception e){
            return new ArrayList();
        }
    }
    
    
    // FUNCION USADA PARA ENCONTRAR LOS PAQUETES CUYOS NOMBRE O DESCRIPCION CONTENGAN EL TEXTO PASADO POR PARAMETRO, SE USA EN EL BUSCADOR DE LA PAGINA WEB ORDENADO ALFABETICAMENTE
    public List BuscadorPaquete(String texto, int orden){
        
        Query q;
        if(orden == 0){
            q = em.createQuery("SELECT p FROM Paquete p ORDER BY p.nombre ASC");
        }
        else{
            q = em.createQuery("SELECT p FROM Paquete p ORDER BY p.fecha_alta DESC");
        }
        
        
        try{
           List lista = q.getResultList();
           List res = new ArrayList();
           
           for(Object obj: lista){
               Paquete p = (Paquete) obj;
               String nombre = p.getNombre();
               String descripcion = p.getDescripcion();
               if( (nombre.toLowerCase().contains(texto.toLowerCase())) || descripcion.toLowerCase().contains(texto.toLowerCase())){
                   res.add(p.getNombre());
               }
           }
           return res;
        }catch(Exception e){
            return new ArrayList();
        }
    }
    
    
    // VERIFICA SI EL USUARIO COMPRO UN PAQUETE QUE CONTENGA AL ESPECTACULO QUE SE PASA POR PARAMETRO
    public boolean UsuarioTienePaqueteconEspectaculo(String nickname, String espectaculo){
        Query q = em.createQuery("SELECT e.paquetes FROM Espectador e WHERE e.nickname = :nickname");
        q.setParameter("nickname", nickname);
       
        try{
            List lista = q.getResultList();
            for(Object x: lista){
                Paquete p = (Paquete) x;
                Query q2 = em.createQuery("SELECT p.espectaculos FROM Paquete p WHERE p.nombre = :nombre");
                q.setParameter("nombre", p.getNombre());
                
                try{
                    List espectaculos = q2.getResultList();
                    for(Object x2: espectaculos){
                        Espectaculo esp = (Espectaculo) x2;
                        if(esp.getNombre().equals("espectaculo")){
                            return true;
                        }
                        
                    }
                }catch(Exception e){
                    
                }
                
            }
            return false;
        }catch (Exception e){
            return false;
        }
    }
    
    
    // RECIBE UNA LISTA DE ESPECTACULOS Y UN ARREGLO DE CATEGORIAS.
    // DEVUELVE UNA NUEVA LISTA CON LOS ESPECTACULOS CUYA ALGUNA DE SUS CATEGORIAS COINCIDE CON LAS CATEGORIAS PASADAS POR PARAMETRO
    // ACTUA A MANERA DE FILTRO PARA EL BUSCADOR DE LA PAGINA WEB.
    public List FiltrarEspectaculoxCat(List espectaculos, String[] categorias){
      
        List res = new ArrayList();
       
        for(Object obj: espectaculos){
            String s = (String) obj;
            
            Query q = em.createQuery("SELECT e.categorias FROM Espectaculo e WHERE e.nombre = :nombre");
            q.setParameter("nombre",s);
            List cat = q.getResultList();
            
            for(Object x: cat){
                Categoria c = (Categoria) x;
                if(Pertenecea(categorias, c.getNombre()) == true){
                    
                    res.add(s);
                    break;
                }  
            }
        }
        return res;
    }
    
    
    
    // RECIBE UNA LISTA DE PAQUETES Y UN ARREGLO DE CATEGORIAS.
    // DEVUELVE UNa NUEVA LSITA CON LOS PAQUETES CUYA ALGUNA DE SUS CATEGORIAS COINCIDE CON LAS CATEGORIAS PASADAS POR PARAMETRO
    // ACTUA A MANERA DE FILTRO PARA EL BUSCADOR DE LA PAGINA WEB.
    public List FiltrarPaquetexCat(List paquetes, String[] categorias){
      
        
        List res = new ArrayList();
        
        for(Object obj: paquetes){
            String s = (String) obj;
            Query q = em.createQuery("SELECT p.categorias FROM Paquete p WHERE p.nombre = :nombre");
            q.setParameter("nombre",s);
            List cat = q.getResultList();
            for(Object x: cat){
                Categoria c = (Categoria) x;
                if(Pertenecea(categorias,c.getNombre()) == true){
                   res.add(s);
                   break;
              
                }  
            }
        }
        return res;
    }
    
    
    // RETORNA EL PUNTAJE PROMEDIO DE UN ESPECTACULO, FIJANDOSE EN TODAS LAS VALORACIONES DADAS POR LOS ESPECTADORES
    public float PuntajePromedioEspectaculo(String espectaculo){
        Query q = em.createNativeQuery("SELECT pun.puntaje FROM puntaje pun WHERE pun.espectaculo_nombre = '"+espectaculo+"';");
        try{
            List lista = q.getResultList();
            float res = 0;
            int i = 0; 
            for(Object x: lista){
                int valor = (int) x;
                res = res + valor;
                i++;
                
            }
            if(i>0){
                res = res/i;
                return res;
            }else{
                return 0;
            }
            
            
        }catch(Exception e){
            return 0;
        }
    }
    
    
    public int[] CantEstrellasEspectaculo(String espectaculo){
        int[] res = new int[5];
        
        //INICIALIZACION
        for(int i=0; i<5;i++ ){
            res[i] = 0;
        }
        
        Query q = em.createNativeQuery("SELECT pun.puntaje FROM puntaje pun WHERE pun.espectaculo_nombre = '"+espectaculo+"';");
        try{
            List lista = q.getResultList();
            for(Object x: lista){
                
                int valor = (int) x;
                res[valor-1]++; 
            }
            return res;
            
        }catch(Exception e){
            return res;
        }
    }
    
    
    // VERIFICA SI EL ESPECTADOR CON DICHO NICKNAME YA VALORO EL ESPECTACULO CON DICHO NOMBRE
    public boolean EspectadorValoroEspectaculo(String nickname, String espectaculo){
        Query q = em.createQuery("SELECT e.puntajes FROM Espectador e WHERE e.nickname = :nickname");
        q.setParameter("nickname", nickname);
        try{
            List lista = q.getResultList();
            for(Object x: lista){
                Puntaje p = (Puntaje) x;
                if(p.getEspectaculo().getNombre().equals(espectaculo)){
                    return true;
                }
            }
            return false; 
            
        }catch(Exception e){
            return false;
        }
        
    }
    
    
    // OBTIENE EL PUNTAJE QUE LE DIO EL ESPECTADOR AL ESPECTACULO
    public int PuntajedeEspectador(String nickname, String espectaculo){
        Query q = em.createQuery("SELECT e.puntajes FROM Espectador e WHERE e.nickname = :nickname");
        q.setParameter("nickname", nickname);
        try{
            List lista = q.getResultList();
            for(Object x: lista){
                Puntaje p = (Puntaje) x;
                if(p.getEspectaculo().getNombre().equals(espectaculo)){
                    return p.getPuntaje();
                }
            }
            return 0; 
            
        }catch(Exception e){
            return 0;
        }
        
    }
    
    
    // CREA UN NUEVO PUNTAJE QUE EL ESPECTADOR CON DICHO NICKNAME HIZO AL ESPECTACULO CON DICHO NOMBRE
    public void AgregarPuntaje(String nickname, String espectaculo, int puntaje){
        
        em.getTransaction().begin();
        
        Espectador e = em.find(Espectador.class, nickname);
        Espectaculo esp = em.find(Espectaculo.class,espectaculo);
        
        Puntaje p = new Puntaje(puntaje, esp);
        e.AgregarPuntaje(p);
        em.persist(p);
        
        
        em.getTransaction().commit();
    }
    
    
    // VERIFICA SI EL ESPECTADOR TIENE COMO FAVORITO AL ESPECTACULO, DEVUELVE TRUE EN ESE CASO, FALSE EN EL CASO CONTRARIO.
    public boolean TieneFavorito(String nickname, String espectaculo){
         Query q = em.createNativeQuery("SELECT COUNT(*) FROM espectador_espectaculo ee WHERE ee.espectador_nickname = '" + nickname +"' AND ee.favoritos_nombre = '"+espectaculo+"'");
        
        long cant = (long) q.getSingleResult();
        
        if(cant == 0){
            return false;
        }
        else{
            return true;
        }
    }
    
    
    // AGREGA A LA LISTA DE FAVORITOS DEL ESPECTADOR AL ESPECTACULO
    public void AgregarFavorito(String nickname, String espectaculo){
        
        em.getTransaction().begin();
        
        Espectador e = em.find(Espectador.class, nickname);
        Espectaculo esp = em.find(Espectaculo.class, espectaculo);
        
        e.addFav(esp);
        
        em.getTransaction().commit();
    }
    
    
    // ELIMINA DE LA LISTA DE FAVORITOS DEL ESPECTADOR AL ESPECTACULO
    public void EliminarFavorito(String nickname, String espectaculo){
        
       em.getTransaction().begin();
       
      Espectador e = em.find(Espectador.class, nickname);
      Espectaculo esp = em.find(Espectaculo.class, espectaculo);
       
       Query q = em.createNativeQuery("DELETE FROM espectador_espectaculo WHERE espectador_nickname = '"+nickname+"' AND favoritos_nombre = '"+espectaculo+"';");
       
       q.executeUpdate();
      
       try{
           e.deleteFav(esp); 
       }
       catch(Exception exception){
           
       }
       em.refresh(e);
       em.getTransaction().commit(); 
    }
    
    
    
    // LISTA TODOS LOS ESPECTACULOS FAVORITOS DE UN ESPECTADOR
    public String[] listarEspectaculosFavoritos(String nickname){
        Query q = em.createQuery("SELECT es.favoritos FROM Espectador es WHERE es.nombre = :nickname");
        q.setParameter("nickname", nickname);

        try{
            List espectaculos = q.getResultList();
            String[] res = new String[espectaculos.size()];
            int i = 0;
            for(Object object: espectaculos){
                Espectaculo esp = (Espectaculo) object;
                  if(esp.getEstado() == 1){
                   res[i] = esp.getNombre();
                    i++; 
                }
            }
            return res;

        }catch(Exception e){
            return new String[1];
        }
    }
    
    
    
    // VERIFICA SI EL STRING s FORMA PARTE DFL ARREGLO arreglo
    public boolean Pertenecea(String[] arreglo, String s){
        for(String str: arreglo){
            if(str.trim().equals(s)){
                return true;
            }
        }
        return false;
    }
    
    
    // DEVUELVE LA CANTIDAD DE FAVORITOS QUE TIENE UN ESPECTACULO, ES DECIR, ESPECTADORES QUE MARCARON COMO FAVORITO AL MISMO
    public long CantFavxEspectaculo(String espectaculo){
        Query q = em.createNativeQuery("SELECT COUNT(*) FROM espectador_espectaculo ee WHERE ee.favoritos_nombre = '"+espectaculo+"'");
        long cant = (long) q.getSingleResult();
        return cant;
        
    }
    
    
    // FINALIZA EL ESPECTACULO CON NOMBRE IGUAL AL PASADO POR PARAMETRO
    public void FinalizarEspectaculo(String espectaculo){
        
        em.getTransaction().begin();
        Espectaculo e = em.find(Espectaculo.class, espectaculo);
        Query q = em.createQuery("UPDATE Espectaculo e SET e.finalizado = true WHERE e.nombre = :espectaculo");
        q.setParameter("espectaculo", espectaculo);
        q.executeUpdate();
        e.FinalizarEspectaculo();
        em.refresh(e);
        em.getTransaction().commit();
        
    }
    
    
        
       
}

