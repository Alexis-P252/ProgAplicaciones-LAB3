package Logica;

import Logica.Artista;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.MapAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-28T17:53:52")
@StaticMetamodel(Funcion.class)
public class Funcion_ { 

    public static volatile SingularAttribute<Funcion, Boolean> sorteado;
    public static volatile SingularAttribute<Funcion, String> espectaculo;
    public static volatile SingularAttribute<Funcion, Date> fecha_registro;
    public static volatile SingularAttribute<Funcion, Date> fecha_hora;
    public static volatile SingularAttribute<Funcion, String> imagen;
    public static volatile MapAttribute<Funcion, String, Artista> Artistas;
    public static volatile SingularAttribute<Funcion, String> nombre;

}