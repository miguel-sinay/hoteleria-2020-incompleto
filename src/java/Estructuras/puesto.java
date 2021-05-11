package Estructuras;

public class puesto {
    //Atributos
    public int idPuesto;
    public String nombrePuesto;
    public String descripPuesto;
    //Constructor
    public puesto(int idPuesto, String nombrePuesto, String descripPuesto) {
        this.idPuesto = idPuesto;
        this.nombrePuesto = nombrePuesto;
        this.descripPuesto = descripPuesto;
    }
    //Getters
    public int getIdPuesto() {
        return idPuesto;
    }

    public String getNombrePuesto() {
        return nombrePuesto;
    }

    public String getDescripPuesto() {
        return descripPuesto;
    }
}
