package javafiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

public class UserTable {
	static Statement stmt = null;
	static Connection con = null;
	static PreparedStatement pstmt=null;
	static Calendar cal=null;
	static String sql="null";
public static ResultSet fulltable(String userid) {
	ResultSet rs=null;
	try {
	con=ProvideDBConn.getCon();  
	stmt = con.createStatement(); 
	sql = "SELECT * FROM user"+userid+";";
	System.out.println(sql);
	rs=stmt.executeQuery(sql);
	} catch (Exception e) {
		System.out.println("searchrserror error:  "+e.toString());
	}
	return rs;
}
public static int getFine(String userid) {
	int fine=0;
	try {	
		con=ProvideDBConn.getCon();  
		stmt = con.createStatement();
	sql = "SELECT * FROM user"+userid+";";
	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()) {
		fine+=rs.getInt("fine");
	}
	} catch (SQLException e) {
		System.out.println("bookprocess renewbook error:  "+e.toString());
	}
	System.out.println("fine=  "+fine);
	return fine;
}
}
