package Estructuras;

public class personal {
    //Atributos
    public int idPersonal;
    public String nombres;
    public String apellidos;
    public String dpi;
    public String nacimiento;
    public String direccion;
    public String profesion;
    public String telefono;
    public String email;
    public double salario;
    public int idPuesto;
    public String estatus;
    //Constructor
    public personal(int idPersonal, String nombres, String apellidos, String dpi, String nacimiento, String direccion, String profesion, String telefono, String email, double salario, int idPuesto, String estatus) {
        this.idPersonal = idPersonal;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dpi = dpi;
        this.nacimiento = nacimiento;
        this.direccion = direccion;
        this.profesion = profesion;
        this.telefono = telefono;
        this.email = email;
        this.salario = salario;
        this.idPuesto = idPuesto;
        this.estatus = estatus;
    }
    //Getters
    public int getIdPersonal() {
        return idPersonal;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDpi() {
        return dpi;
    }

    public String getNacimiento() {
        return nacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getProfesion() {
        return profesion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getEmail() {
        return email;
    }

    public double getSalario() {
        return salario;
    }

    public int getIdPuesto() {
        return idPuesto;
    }

    public String getEstatus() {
        return estatus;
    }
}
