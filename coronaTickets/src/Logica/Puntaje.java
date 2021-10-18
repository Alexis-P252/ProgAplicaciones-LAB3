package Logica;
import Logica.Espectaculo;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author felip
 */
@Entity
public class Puntaje {
    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    private int puntaje;
    @OneToOne
    private Espectaculo espectaculo;

   public Puntaje(){}
   
   public Puntaje(int puntaje, Espectaculo espectaculo){
       
       this.puntaje = puntaje;
       this.espectaculo = espectaculo;
   }
   
    public int getPuntaje(){
        return this.puntaje;
    }

    public Espectaculo getEspectaculo(){
        return this.espectaculo;
    }

    public void setPuntaje(int puntaje){
        this.puntaje = puntaje;
    }

    public void setEspectaculo(Espectaculo espectaculo){
        this.espectaculo = espectaculo;
    }
    
    public DtPuntaje ArmarDT(){
        DtPuntaje dt = new DtPuntaje(this.id, this.puntaje, this.espectaculo.getNombre());
        return dt;
    }
}