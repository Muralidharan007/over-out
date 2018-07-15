package javafiles;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;

public class AutoFineDb extends TimerTask {
	static Statement stmt = null;
	static Statement stmt1 = null;
	static Statement stmt2 = null;
	static Connection con = null;
	static String sql="null";
	static ResultSet rs=null;
	ResultSet rs1;
    public void run() {
    		con=ProvideDBConn.getCon(); 
    		try {
    		stmt = con.createStatement();
    		stmt1 = con.createStatement();
    		stmt2 = con.createStatement();}
    		catch (Exception e) {
    			System.out.println("autotask"+e.toString());
			}
    		int count,uid,bookid;
    		Timestamp curdate,renewdate;
    		Date curentdate,rendate;  
			int diff_in_days,fine;
    		long diff_in_millis;
    		Calendar cal;
    	sql = "SELECT * FROM student;";
    	System.out.println(sql);
    	try {
    	rs1 = stmt.executeQuery(sql);
    	while(rs1.next()) {
    		uid=rs1.getInt("uid");
    		sql = "SELECT * FROM user"+uid+";";
    		System.out.println(sql);
    		try {
        	AutoFineDb.rs = stmt1.executeQuery(sql);
    		}catch (Exception e) {
				System.out.println("autotask inner"+e.toString());
				continue;
			}
        	while(AutoFineDb.rs.next()) {
        		bookid=AutoFineDb.rs.getInt("bookid");
        		cal = Calendar.getInstance();
        		curdate=new java.sql.Timestamp(cal.getTimeInMillis());
        		renewdate=AutoFineDb.rs.getTimestamp("renewdate");
        		curentdate=new Date(curdate.getTime());
        		rendate=new Date(renewdate.getTime());
        		diff_in_millis = rendate.getTime() - curentdate.getTime();
        		//diff_in_days =(int) (diff_in_millis / (1000  * 60 * 60 * 24));
        		diff_in_days=(int) TimeUnit.DAYS.convert(diff_in_millis,TimeUnit.MILLISECONDS);
        		System.out.println("different in days uid==>"+uid+ "bookid==>"+bookid+"==>"+diff_in_days);
        		if(diff_in_days<0) {
        			fine=AutoFineDb.rs.getInt("fine")+1;
        			sql = "update user"+uid+" set fine="+fine+" where bookid="+bookid+";";
        			System.out.println(sql);
            		stmt2.executeUpdate(sql);
        		}
        	}
    	}
    	}catch (Exception e) {
    		System.out.println("autotask outer"+e.toString());
		}
    	//rs1.close(); 
    	
    }
}
