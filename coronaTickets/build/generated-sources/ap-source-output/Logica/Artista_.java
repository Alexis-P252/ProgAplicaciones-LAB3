package Logica;

import Logica.Espectaculo;
import javax.annotation.Generated;
import javax.persistence.metamodel.MapAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-11-05T10:37:49")
@StaticMetamodel(Artista.class)
public class Artista_ extends Usuario_ {

    public static volatile SingularAttribute<Artista, String> descripcion;
    public static volatile SingularAttribute<Artista, String> biografia;
    public static volatile SingularAttribute<Artista, String> link;
    public static volatile MapAttribute<Artista, String, Espectaculo> organiza;

}