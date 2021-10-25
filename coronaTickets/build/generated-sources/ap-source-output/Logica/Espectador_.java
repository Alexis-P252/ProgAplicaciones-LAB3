package Logica;

import Logica.Espectaculo;
import Logica.Paquete;
import Logica.Premio;
import Logica.Puntaje;
import Logica.Registro;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.MapAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-25T10:16:49")
@StaticMetamodel(Espectador.class)
public class Espectador_ extends Usuario_ {

    public static volatile ListAttribute<Espectador, Puntaje> puntajes;
    public static volatile MapAttribute<Espectador, String, Paquete> paquetes;
    public static volatile ListAttribute<Espectador, Premio> premios;
    public static volatile MapAttribute<Espectador, String, Registro> registros;
    public static volatile ListAttribute<Espectador, Espectaculo> favoritos;

}