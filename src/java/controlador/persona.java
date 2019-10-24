package controlador;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class persona extends Conexion {

    long documento;
    String tipoDocumento;
    String nombre;
    String apellido;
    long telefono;
    String correo;
    String fecha;
    private ResultSet resultado;

    public persona(){
        Conectar();
    }
    public persona(long documento, String tipoDocumento, String nombre, String apellido, long telefono, String correo, String fecha) {
        this.documento = documento;
        this.tipoDocumento = tipoDocumento;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.correo = correo;
        this.fecha = fecha;
    }

    public long getDocumento() {
        return documento;
    }

    public void setDocumento(long documento) {
        this.documento = documento;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public long getTelefono() {
        return telefono;
    }

    public void setTelefono(long telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public ResultSet getResultado() {
        return resultado;
    }

    public void setResultado(ResultSet resultado) {
        this.resultado = resultado;
    }

    boolean existe(long documento, String tipo) {
        try {
            persona per = null;
            resultado = estam.executeQuery("SELECT * FROM Usuario WHERE documento = " + documento + " && tipodocumento ='" + tipo + "';");
            while (resultado.next()) {
                per = new persona(resultado.getLong(1),resultado.getString(2),resultado.getString(3), resultado.getString(4), resultado.getLong(5),resultado.getString(6), resultado.getString(7));
            }
            if (per == null) {
                return false;
                
            } else {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(persona.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    boolean registrar(long documento, String tipo, String nombre, String apellido, String correo, long celular, String fecha) {
        try {
            pre = conexion.prepareStatement("INSERT INTO Usuario (documento, tipodocumento, nombre, apellido, telefono, correo, fecha)  VALUES(?,?,?,?,?,?,?)");
            pre.setLong(1, documento);
            pre.setString(2, tipo);
            pre.setString(3, nombre);
            pre.setString(4, apellido);
            pre.setLong(5, celular);
            pre.setString(6, correo);
            pre.setString(7, fecha);
            pre.executeUpdate();
            pre.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(persona.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    boolean eliminar(long cel, String tip) {
    try {
            pre=conexion.prepareStatement("DELETE FROM Usuario WHERE documento=? && tipodocumento=?");
            pre.setLong(1, cel);
            pre.setString(2, tip);
            pre.executeUpdate();
            pre.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(persona.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    persona buscar(long cedula, String tipo) {
        try {
            persona per = null;
            resultado = estam.executeQuery("SELECT * FROM Usuario WHERE documento = " + cedula + " && tipodocumento ='" + tipo + "';");
            while (resultado.next()) {
                per = new persona(resultado.getLong(1), resultado.getString(2), resultado.getString(3), resultado.getString(4),resultado.getLong(5), resultado.getString(6), resultado.getString(7));
            }
            if (per != null) {
                return per;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            Logger.getLogger(persona.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

    boolean modificar(long documento, String tipo, String nombre, String apellido, String correo, long celular, String fecha) {
        try {
            pre = conexion.prepareStatement("UPDATE Usuario SET nombre=?, apellido=?, correo=?, telefono=?, fecha=? WHERE documento=? && tipodocumento=?");
            pre.setString(1, nombre);
            pre.setString(2, apellido);
            pre.setString(3, correo);
            pre.setLong(4, celular);
            pre.setString(5, fecha);
            pre.setLong(6, documento);
            pre.setString(7, tipo);
            pre.executeUpdate();
            pre.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(persona.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    ResultSet listarPersonas() {
        try {
            resultado = estam.executeQuery("SELECT * FROM Usuario");
            System.out.printf("se consulto");
            return resultado;
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            return null;
        }
    }
    
}
