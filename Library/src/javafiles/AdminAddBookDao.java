package javafiles;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;



public class AdminAddBookDao {
	static Statement stmt = null;
	static Connection con = null;
	static String sql="null";
	static BookBean b;
private static void insertbook() {
	try {
	
	sql = "SELECT * FROM book where bsno="+b.getBsno()+";";
	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	if(rs.next()) {
		int count=rs.getInt("bookcount");
		System.out.println("count "+count);
		count+=Integer.parseInt(b.getBookcount());
		sql = "update book set bookcount="+count+" where bookname='"+b.getBookname()+"';";
		System.out.println(sql);
		stmt.executeUpdate(sql);
	}else {
		sql = "Insert into book(bsno,bookname,bookcount,bookauthor) values ("+b.getBsno()+",'"+b.getBookname()+"',"+b.getBookcount()+",'"+b.getBookauthor()+"');";
		System.out.println(sql);
		stmt.executeUpdate(sql);
	}
	rs.close();
	
	}catch (Exception e) {
		System.out.println("dao error:  "+e.toString());
	}
}
public static void issuebook(BookBean a) {
	b=a;
	try{  
		con=ProvideDBConn.getCon();  
		stmt = con.createStatement(); 
		DatabaseMetaData dbm = con.getMetaData();
		ResultSet tables = dbm.getTables(null, null, "book", null);
		if (tables.next()) {
			insertbook();
		}
		else {
			sql = "CREATE TABLE Book(bsno INTEGER(5) PRIMARY KEY,bookname VARCHAR(100),bookcount INTEGER(5),bookauthor VARCHAR(100));";
			stmt.executeUpdate(sql); 
			insertbook();
		}
		
		}catch(Exception e){
			System.out.println("dao error:  "+e.toString());
		}  
}
}
