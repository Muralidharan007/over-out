package javafiles;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;

public class BookProcess {
	static Statement stmt = null;
	static Statement stmt1 = null;
	static Connection con = null;
	static PreparedStatement pstmt=null;
	static String sql="null";
	static Calendar cal=null;

public static void issuebookcode(String userid,String bookid) {
	try {
		sql = "SELECT * FROM user"+userid+" where bookid="+bookid+";";
		System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql);
		System.out.println(rs.getRow()+"---------=======");
		rs.last();
		int size = rs.getRow();
		rs.beforeFirst();
	if(size==0) {
	pstmt = con.prepareStatement("INSERT INTO user"+userid+"(bookid,issuedate,renewdate,fine) VALUES ("+bookid+",?,?,0)");
	cal = Calendar.getInstance();
	//pstmt.setTimestamp(1, new java.sql.Timestamp(new java.util.Date().getTime()));
	pstmt.setTimestamp(1,new java.sql.Timestamp(cal.getTimeInMillis()));
	cal.add(Calendar.DATE, 7);
	pstmt.setTimestamp(2, new java.sql.Timestamp(cal.getTimeInMillis()));
	//System.out.println("Date = "+ cal.getTimeInMillis());
	pstmt.executeUpdate();
	sql = "SELECT * FROM book where bsno="+bookid+";";
	System.out.println(sql);
	ResultSet rs1 = stmt.executeQuery(sql);
	System.out.println(sql);
	if(rs1.next()) {
		int count=rs1.getInt("bookcount")-1;
		System.out.println(count+"-----------afkjha");
		sql = "update book set bookcount="+count+" where bsno="+bookid+";";
		stmt.executeUpdate(sql);
	}
	rs.close();
	rs1.close();
	}else {
		pstmt = con.prepareStatement("update user"+userid+" set issuedate=?,renewdate=? where bookid="+bookid+";");
		cal = Calendar.getInstance();
		//pstmt.setTimestamp(1, new java.sql.Timestamp(new java.util.Date().getTime()));
		pstmt.setTimestamp(1,new java.sql.Timestamp(cal.getTimeInMillis()));
		cal.add(Calendar.DATE, 7);
		pstmt.setTimestamp(2, new java.sql.Timestamp(cal.getTimeInMillis()));
		//System.out.println("Date = "+ cal.getTimeInMillis());
		pstmt.executeUpdate();
	}
	}catch (Exception e) {
		System.out.println("bookprocess error:  "+e.toString());
	}
	}
public static void issueBook(String userid,String bookid) {
	try{  
		con=ProvideDBConn.getCon();  
		stmt = con.createStatement();
		DatabaseMetaData dbm = con.getMetaData();
		ResultSet tables = dbm.getTables(null, null,"user"+userid, null);
		if (tables.next()) {
			//insertbook();
			issuebookcode(userid, bookid);
			
		}
		else {
			sql = "CREATE TABLE user"+userid+"(bookid integer(20),issuedate timestamp,renewdate timestamp,fine integer(20));";
			stmt.executeUpdate(sql); 
			issuebookcode(userid, bookid);
		}
		
		}catch(Exception e){
			System.out.println("bookprocess error:  "+e.toString());
		}  
}
public static void returnBook(String userid,String bookid) {
	try {
	    con=ProvideDBConn.getCon();  
		stmt = con.createStatement();
		DatabaseMetaData dbm = con.getMetaData();
		ResultSet tables = dbm.getTables(null, null,"user"+userid, null);
		tables.last();
		int size1 = tables.getRow();
		tables.beforeFirst();
		if(size1>0) {
		sql = "SELECT * FROM user"+userid+" where bookid="+bookid+";";
		ResultSet rs = stmt.executeQuery(sql);
		rs.last();
		int size = rs.getRow();
		rs.beforeFirst();
		if(size>0) {
		sql = "delete from user"+userid+" where bookid="+bookid+";";
		stmt.executeUpdate(sql);
		sql = "SELECT * FROM book where bsno="+bookid+";";
		System.out.println(sql);
		ResultSet rs1 = stmt.executeQuery(sql);
		if(rs1.next()) {
			int count=rs1.getInt("bookcount")+1;
			System.out.println(count+"-----------afkjha");
			sql = "update book set bookcount="+count+" where bsno="+bookid+";";
			stmt.executeUpdate(sql);
		}
		rs.close();
		rs1.close();
		}
		}
	} catch (SQLException e) {
	System.out.println("bookprocess returnbook error:  "+e.toString());
	}
	
}
public static void renewbook(String userid) {
	try {
		int bookid,fine;
		 con=ProvideDBConn.getCon();  
			stmt = con.createStatement();
	sql = "SELECT * FROM user"+userid+";";
	System.out.println(sql);
	ResultSet rs = stmt.executeQuery(sql);
	fine=UserTable.getFine(userid);
	if(fine==0) {
	while(rs.next()) {
		
		bookid=rs.getInt("bookid");
		pstmt = con.prepareStatement("update user"+userid+" set issuedate=?,renewdate=? where bookid="+bookid+";");
		cal = Calendar.getInstance();
		//pstmt.setTimestamp(1, new java.sql.Timestamp(new java.util.Date().getTime()));
		pstmt.setTimestamp(1,new java.sql.Timestamp(cal.getTimeInMillis()));
		cal.add(Calendar.DATE, 7);
		pstmt.setTimestamp(2, new java.sql.Timestamp(cal.getTimeInMillis()));
		//System.out.println("Date = "+ cal.getTimeInMillis());
		pstmt.executeUpdate();
		}
	}
	} catch (SQLException e) {
		System.out.println("bookprocess renewbook error:  "+e.toString());
	}
}
public static void clearFine(int userid) {
	try {
		int bookid;
	con=ProvideDBConn.getCon();  
	stmt = con.createStatement();
	stmt1 = con.createStatement();
sql = "SELECT * FROM user"+userid+";";
System.out.println(sql);
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()) {
	bookid=rs.getInt("bookid");
	sql = "update user"+userid+" set fine=0 where bookid="+bookid+";";
	System.out.println(sql);
	stmt1.executeUpdate(sql);
}
} catch (SQLException e) {
	System.out.println("bookprocess clearfinebook error:  "+e.toString());
}
}
}
