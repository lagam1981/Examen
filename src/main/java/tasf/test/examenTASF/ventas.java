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

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;


public class ventas extends databaseClass {
    
    public String listadoVenta(String folio) throws SQLException{
        String cadena = "";
        String sql = "{call obtenVentasFactura (?)}";
        try{

            Connection cnn = getConnect();
            CallableStatement st = cnn.prepareCall(sql);
            
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
