package mypack;

import java.sql.*;
public class Connectionclass extends Object{
    Connection con;
    Statement stm1;
    PreparedStatement stm2;
    Connectionclass()
    {
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con=DriverManager.getConnection("jdbc:derby://localhost:1527/practice","root","root");
            stm1=con.createStatement();
            stm2=con.prepareStatement("");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void main(String[] ar){
        new Connectionclass();
    }
}
