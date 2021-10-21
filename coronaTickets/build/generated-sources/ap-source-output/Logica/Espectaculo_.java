package Logica;

import Logica.Categoria;
import Logica.Funcion;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.MapAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-21T11:14:49")
@StaticMetamodel(Espectaculo.class)
public class Espectaculo_ { 

    public static volatile SingularAttribute<Espectaculo, String> descripcion;
    public static volatile SingularAttribute<Espectaculo, Integer> estado;
    public static volatile SingularAttribute<Espectaculo, Float> costo;
    public static volatile MapAttribute<Espectaculo, String, Categoria> categorias;
    public static volatile SingularAttribute<Espectaculo, Integer> cant_premios;
    public static volatile SingularAttribute<Espectaculo, String> imagen;
    public static volatile MapAttribute<Espectaculo, String, Funcion> Funciones;
    public static volatile SingularAttribute<Espectaculo, String> nombre;
    public static volatile SingularAttribute<Espectaculo, String> url;
    public static volatile SingularAttribute<Espectaculo, Integer> cant_max_espec;
    public static volatile SingularAttribute<Espectaculo, String> URL_video;
    public static volatile SingularAttribute<Espectaculo, Date> fecha_registro;
    public static volatile SingularAttribute<Espectaculo, Integer> cant_min_espec;
    public static volatile SingularAttribute<Espectaculo, String> plataforma;
    public static volatile SingularAttribute<Espectaculo, String> desc_premio;
    public static volatile SingularAttribute<Espectaculo, Integer> duracion;

}