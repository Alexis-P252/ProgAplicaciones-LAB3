package Logica;

import Logica.Categoria;
import Logica.Espectaculo;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.MapAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-28T19:26:30")
@StaticMetamodel(Paquete.class)
public class Paquete_ { 

    public static volatile SingularAttribute<Paquete, String> descripcion;
    public static volatile SingularAttribute<Paquete, Float> descuento;
    public static volatile SingularAttribute<Paquete, Date> fecha_fin;
    public static volatile SingularAttribute<Paquete, Date> fecha_alta;
    public static volatile MapAttribute<Paquete, String, Categoria> categorias;
    public static volatile SingularAttribute<Paquete, String> imagen;
    public static volatile MapAttribute<Paquete, String, Espectaculo> espectaculos;
    public static volatile SingularAttribute<Paquete, String> nombre;
    public static volatile SingularAttribute<Paquete, Date> fecha_ini;

}