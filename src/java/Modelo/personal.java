package Modelo;
import java.sql.*;
//import java.text.SimpleDateFormat;
public class personal {
    private Connection con;
    private Statement stm;
    private ResultSet rs;
    
    public personal()
    {
        this.con=null;
        this.stm=null;
        this.rs=null;
    }
    private int correlativoPersonal()
    {
        conexion c = new conexion();
        con = c.conectar();
        int idPersonal=0;
        try
        {
            stm = con.createStatement();
            rs = stm.executeQuery("SELECT MAX(idPersonal)+1 AS correlativo FROM personal");
            while(rs.next())
            {
                idPersonal = rs.getInt("correlativo");
            }
            c.desconectar();
            con.close();
            stm.close();
            return idPersonal;
        }
        catch(Exception e)
        {
            return idPersonal;
        }
    }
    public int insertarPersonal(String nombres, String apellidos, String dpi, String nacimiento, String direccion, String profesion, String telefono, String email, double salario, int idPuesto, String estatus)
    {
        int respuesta = 0;
        int idPersonal = 0;
        idPersonal = correlativoPersonal();
        //SimpleDateFormat ajustar = new SimpleDateFormat("yyyy-MM-dd");
        String comando = "INSERT INTO personal(idPersonal,nombres,apellidos,dpi,nacimiento,direccion,profesion,telefono,email,salario,idPuesto,estatus) VALUES("+idPersonal+",'"+nombres+"','"+apellidos+"','"+dpi+"',TO_DATE('"+nacimiento+"','YYYY-MM-DD'),'"+direccion+"','"+profesion+"','"+telefono+"','"+email+"',"+salario+","+idPuesto+",'"+estatus+"')";
        /*String comando = "INSERT INTO personal(idPersonal,idPuesto,nombres,apellidos,dpi,nacimiento,direccion) VALUES("+idPersonal+","+idPuesto+",'"+nombres+"','"+apellidos+"','"+dpi+"',TO_DATE('"+nacimiento+"','YYYY-MM-DD'),'"+direccion+"')";*/
        conexion c = new conexion();
        con = c.conectar();
        try
        {
            stm = con.createStatement();
            respuesta = stm.executeUpdate(comando);
            c.desconectar();
            con.close();
            stm.close();
            return respuesta;
        }
        catch(Exception e)
        {
            return respuesta;
        }
    }
    /*public int insertarPersonal(int idPuesto)
    {
        
        int r=0;
        int idPersonal;
        idPersonal = correlativoPersonal();
        conexion cn = new conexion();
        con=cn.conectar();
        try{
            stm=con.createStatement();
            r=stm.executeUpdate("INSERT INTO personal(idPersonal,idPuesto) VALUES('" + idPersonal + "','"+idPuesto+"')");
            cn.desconectar();
            con.close();
            stm.close();
            return r;
        }
        catch(Exception e)
        {
            return r;
        }
    }*/
}
