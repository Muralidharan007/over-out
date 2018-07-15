package com.candidjava;
import java.sql.*;

public class ConnectionManager {
	static Connection con;
    static String url;
          
    public static Connection getConnection()
    {
      
       try
       {
          String url = "jdbc:mysql://localhost:3306/library"; 
          // assuming "DataSource" is your DataSource name

          Class.forName("com.mysql.jdbc.Driver");
          
          try
          {            	
             con = DriverManager.getConnection(url,"root","imarota"); 
              								
          }
          
          catch (SQLException ex)
          {
             ex.printStackTrace();
          }
       }

       catch(ClassNotFoundException e)
       {
          System.out.println(e);
       }

    return con;
}
}
