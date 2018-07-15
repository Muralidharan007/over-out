package javafiles;

import java.sql.Connection;
import java.sql.DriverManager;
import static javafiles.DbData.*;  

public class ProvideDBConn {
	private static Connection con=null;  
	static{  
		try{  
		Class.forName(DRIVER);  
		con=DriverManager.getConnection(CONNECTION_URL,USERNAME,PASSWORD);  
		}catch(Exception e){
			System.out.println("conprovider error:  "+e.toString());
		}  
		}  
	public static Connection getCon(){  
	    return con;  
	}  
}
