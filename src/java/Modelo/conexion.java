package Modelo;
import java.sql.*;
public class conexion {
    private String driver, url, user, password;
    private Connection cn;
    
    public conexion()
    {
        this.driver="oracle.jdbc.OracleDriver";
        this.url="jdbc:oracle:thin:@localhost:1521:XE";
        this.user="system";
        this.password="adminroot";
        this.cn=null;
    }
    
    public Connection conectar()
    {
        try
        {
            Class.forName(this.driver);
            cn = DriverManager.getConnection(this.url,this.user,this.password);
            return cn;
        }
        catch(Exception ex)
        {
            return null;
        }
    }
    
    public void desconectar() throws SQLException
    {
        cn.close();
    }
}
