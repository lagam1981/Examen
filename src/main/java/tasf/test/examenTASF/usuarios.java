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

public class usuarios extends databaseClass {

    public int validaAcceso(String usuario, String password) throws Exception{
        int val = 0;
        String sql = "{call obtenDatosAcceso (?,?)}";
        try{

            Connection cnn = getConnect();
            CallableStatement st = cnn.prepareCall(sql);

            st.setString(1, usuario);
            st.setString(2, password);
            st.execute();
            final ResultSet rst =  st.getResultSet();
            
            rst.next();
            val = rst.getInt("acceso");
                    
        }catch(Exception e){
            System.out.print("Error: "+e.toString());
        }
        return val;
    }

    
}
