package Modelo;
import java.sql.*;
import java.util.ArrayList;

public class puesto {
    private Connection con;
    private Statement stm;
    private ResultSet rs;
    
    public puesto()
    {
        this.con = null;
        this.stm = null;
        this.rs = null;
    }
    public ArrayList <Estructuras.puesto> listadoPuesto()
    {
        ArrayList <Estructuras.puesto> lp = new ArrayList <Estructuras.puesto>();
        Estructuras.puesto p = null;
        conexion c = new conexion();
        try
        {
            con = c.conectar();
            stm=con.createStatement();
            rs=stm.executeQuery("SELECT * FROM puesto");
            while(rs.next())
            {
                p = new Estructuras.puesto(rs.getInt("idPuesto"), rs.getString("nombrePuesto"), rs.getString("descripPuesto"));
                lp.add(p);
            }
            c.desconectar();
            con.close();
            stm.close();
            return lp;
        }
        catch(Exception e)
        {
            return null;
        }
    }
}
