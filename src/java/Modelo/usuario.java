package Modelo;
import java.sql.*;
public class usuario {
    private Connection con;
    private Statement stm;
    private ResultSet rs;
    
    public usuario()
    {
        this.con=null;
        this.stm=null;
        this.rs=null;
    }
    
    public int buscarUsuario(String usuario, String password)
    {
        int idPerfil=0;
        //String consulta = "SELECT idPerfil FROM usuario WHERE usuario='" + usuario + "' AND password='" + password + "'";
        conexion c = new conexion();
        con = c.conectar();
        try
        {
            stm = con.createStatement();
            rs = stm.executeQuery("SELECT idPerfil FROM usuario WHERE usuario='" + usuario + "' AND password='" + password + "'");
            while(rs.next())
            {
            idPerfil = rs.getInt("idPerfil");
            }
            c.desconectar(); con.close(); stm.close();
            return idPerfil;
        }
        catch (Exception ex)
        {
            return idPerfil;
        }
    }
    private int correlativoUsuario()
    {
        conexion c = new conexion();
        con = c.conectar();
        int idUsuario=0;
        try
        {
            stm = con.createStatement();
            rs = stm.executeQuery("SELECT MAX(idUsuario)+1 AS correlativo FROM usuario");
            while(rs.next())
            {
                idUsuario = rs.getInt("correlativo");
            }
            c.desconectar();
            con.close();
            stm.close();
            return idUsuario;
        }
        catch(Exception ex)
        {
            return idUsuario;
        }
    }
    public int insertarUsuario(String usuario, String password, byte perfil)
    {
        conexion c = new conexion();
        con = c.conectar();
        int respuesta = 0;
        int idUsuario = 0;
        idUsuario = correlativoUsuario();
        String comando = "INSERT INTO usuario(idUsuario,usuario,password,idPerfil) VALUES("+idUsuario+",'"+usuario+"','"+password+"',"+perfil+")";
        try
        {
            stm = con.createStatement();
            respuesta = stm.executeUpdate(comando);
            c.desconectar();
            con.close();
            stm.close();
            return respuesta;
        }
        catch(Exception ex)
        {
            return respuesta;
        }
    }
    public int actualizarUsuario(int idUsuario, String usuario, String password, byte perfil)
    {
        int respuesta = 0;
        String comando = "UPDATE usuario SET usuario='"+usuario+"', password='"+password+"', idPerfil='"+perfil+"' WHERE idUsuario='"+idUsuario+"'";
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
        catch(Exception ex)
        {
            return respuesta;
        }
    }
    public int eliminarUsuario(int idUsuario)
    {
        int respuesta = 0;
        String comando = "DELETE FROM usuario WHERE idUsuario='"+idUsuario+"'";
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
}
