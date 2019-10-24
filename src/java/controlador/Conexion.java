package controlador;

import java.sql.*;

public class Conexion {
    protected Connection conexion;
    protected Statement estam=null;
    protected PreparedStatement pre=null;
    public Connection Conectar(){
        try {
            conexion=null;
            Class.forName("com.mysql.jdbc.Driver");
            conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto","root","root");
            estam=conexion.createStatement();
            System.out.printf("Conectado");
        } catch (ClassNotFoundException | SQLException ex) {
            System.err.println("SQLException: " + ex.getMessage());
            System.out.printf("Error de conexion");
            return null;
        }
        return conexion;
    }
}
