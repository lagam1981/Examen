/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tasf.test.examenTASF;

/**
 *
 * @author AT_Fam
 */

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class databaseClass {
    
    public Connection conectar = null;
    //private String url = "jdbc:mysql://localhost:3306/Examen";
    //private String usuario = "angel";
    //private String pass = "4ng3L1981#";
    
    private String url = "jdbc:mysql://sql10.freemysqlhosting.net/sql10587843";
    private String usuario = "sql10587843";
    private String pass = "ZGFfxYrmKv";


    public Connection getConnect() throws Exception{

        try{
            Class.forName("com.mysql.jdbc.Driver"); 
            conectar = DriverManager.getConnection(url,usuario,pass);
        }catch(SQLException throwables) {
            throwables.printStackTrace();
        }

        return conectar;
    }
    
    public String chequeo(){
        String cadena = "";
        String sql = "{call obtenVentasFactura (?)}";
        
        try{

            Connection cnn = getConnect();
            CallableStatement st = cnn.prepareCall(sql);
            String folio = "2";
            
            st.setString(1, folio);
            st.execute();
            final ResultSet rst =  st.getResultSet();
    
            while(rst.next()){
                cadena = cadena + "<tr>";
                cadena = cadena + "<td>"+rst.getString("id")+"</td>";
                cadena = cadena + "<td>"+rst.getString("producto")+"</td>";
                cadena = cadena + "<td class='cant'>"+rst.getString("piezas")+"</td>";
                cadena = cadena + "<td align='right'>"+rst.getString("precioUnitario")+"</td>";
                cadena = cadena + "<td align='right' style='padding-right: 5px;' class='venta'>"+rst.getString("totalPago")+"</td>";
                cadena = cadena + "</tr>";

            }

        }catch(Exception e){
            cadena = "<tr><td colspan='10'> Error: "+e.toString()+"</td></tr>";
        }
        
        
        return cadena;
    }
    
    
    
}
