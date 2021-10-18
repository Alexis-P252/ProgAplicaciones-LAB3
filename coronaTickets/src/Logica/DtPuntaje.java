package Logica;

/**
 *
 * @author felip
 */
public class DtPuntaje {
    private int Id;
    private int puntaje;
    private String espectaculo;

    public int getPuntaje() {
        return puntaje;
    }
    public int getId() {
        return Id;
    }

    public String getEspectaculo() {
        return espectaculo;
    }

    public DtPuntaje(){

    }

    public DtPuntaje(int Id,int puntaje, String espec){
        this.Id = Id;
        this.puntaje = puntaje;
        this.espectaculo = espec;
    }
}