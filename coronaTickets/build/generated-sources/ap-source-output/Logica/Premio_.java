package Logica;

import Logica.Funcion;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-10-26T11:31:48")
@StaticMetamodel(Premio.class)
public class Premio_ { 

    public static volatile SingularAttribute<Premio, Date> fecha_caduca;
    public static volatile SingularAttribute<Premio, String> espectaculo;
    public static volatile SingularAttribute<Premio, String> desc_premio;
    public static volatile SingularAttribute<Premio, Integer> id;
    public static volatile SingularAttribute<Premio, Funcion> funcion;
    public static volatile SingularAttribute<Premio, Date> fecha_sorteo;

}