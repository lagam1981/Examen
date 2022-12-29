/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.mavenproject2;

/**
 *
 * @author Angel Arevalo
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;

public class usuarios extends dataBaseClass {

    public String validaAcceso(String usuario, String password) throws Exception{
        String cadena = "";
        String sql = "{call obtenDatosAcceso (?,?)}";
        try{

            Connection cnn = getConnect();
            CallableStatement st = cnn.prepareCall(sql);
            cadena = "invalido";
            st.setString(1, usuario);
            st.setString(2, password);
            st.execute();
            final ResultSet rst =  st.getResultSet();
            
            rst.next();
            if (rst.getInt("acceso") > 0){
                cadena = "valido";
            }
        }catch(Exception e){
            cadena = "Error: "+e.toString();
        }

        

        return cadena;
    }
}
