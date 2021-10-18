package Logica;

import Logica.Funcion;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-18T10:39:51")
@StaticMetamodel(Registro.class)
public class Registro_ { 

    public static volatile SingularAttribute<Registro, Date> fecha;
    public static volatile SingularAttribute<Registro, Float> costo;
    public static volatile SingularAttribute<Registro, Integer> id;
    public static volatile SingularAttribute<Registro, Boolean> canjeado;
    public static volatile SingularAttribute<Registro, Funcion> funcion;

}