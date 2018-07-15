package javafiles;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class SearchResultUserSet {
	static Statement stmt = null;
	static Connection con = null;
	static String sql="null";
public static ResultSet searchrs(String bookname) {
	ResultSet rs=null;
	try {
	con=ProvideDBConn.getCon();  
	stmt = con.createStatement(); 
	sql = "SELECT * FROM student where (username LIKE '"+bookname+"%"+"');";
	System.out.println(sql);
	rs=stmt.executeQuery(sql);
	} catch (Exception e) {
		System.out.println("searchrserror error:  "+e.toString());
	}
	return rs;
}
}
