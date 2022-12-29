/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.mavenproject2;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Angel Arevalo
 */


public class dataBaseClass {


    public Connection conectar = null;
    //C:\Users\David\.m2\repository\com\microsoft\sqlserver\mssql-jdbc\12.1.0.jre11-preview\mssql-jdbc-12.1.0.jre11-preview.jar

      private String url = "jdbc:mysql://localhost:3306/Examen";
      private String usuario = "angel";
      private String pass = "4ng3L1981#";


    public Connection getConnect() throws Exception{


        try{
            Class.forName("com.mysql.jdbc.Driver"); 
            conectar = DriverManager.getConnection(url,usuario,pass);
        }catch(SQLException throwables) {
            throwables.printStackTrace();
        }

        return conectar;
    }

    public String obtenDatos(String sql){

        return "Hola Mundo";
    }
}
