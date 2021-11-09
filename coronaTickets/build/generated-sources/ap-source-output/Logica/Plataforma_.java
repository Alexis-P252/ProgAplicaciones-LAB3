package Logica;

import Logica.Espectaculo;
import javax.annotation.Generated;
import javax.persistence.metamodel.MapAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-11-05T10:37:49")
@StaticMetamodel(Plataforma.class)
public class Plataforma_ { 

    public static volatile SingularAttribute<Plataforma, String> descripcion;
    public static volatile MapAttribute<Plataforma, String, Espectaculo> Espectaculos;
    public static volatile SingularAttribute<Plataforma, String> nombre;
    public static volatile SingularAttribute<Plataforma, String> url;

}