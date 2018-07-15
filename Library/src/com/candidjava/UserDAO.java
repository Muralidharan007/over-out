package com.candidjava;
import java.text.*;
import java.util.*;
import java.sql.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	static Connection currentCon = null;
    static ResultSet rs = null;  

	public static UserBean login(UserBean bean) {
		Statement stmt = null;
		String un = bean.getUsername();    
        String pw = bean.getPassword();
        
        String searchQuery1 =
                "select userName,pass,auid from admin where userName='"
                         + un
                         + "' AND pass='"
                         + pw
                         + "'";
        String searchQuery2 =
                "select userName,pass,uid from student where userName='"
                         + un
                         + "' AND pass='"
                         + pw
                         + "'";
 	    
       // "System.out.println" prints in the console; Normally used to trace the process
       System.out.println("Your user name is " + un);          
       System.out.println("Your password is " + pw);
       System.out.println("Query1: "+searchQuery1);
       System.out.println("Query2: "+searchQuery2);
 	    
       try 
       {
          //connect to DB 
          currentCon = ConnectionManager.getConnection();
          stmt=currentCon.createStatement();
          
          rs = stmt.executeQuery(searchQuery1);	        
          boolean more1 = rs.next();
 	       
          // if user does not exist set the isValid variable to false
          if (!more1) 
          {
             System.out.println("Sorry, you are not a registered user! Please sign up first");
             bean.setValid(false);
          } 
 	        
          //if user exists set the isValid variable to true
          else if (more1) 
          {
             String username = rs.getString("userName");
             
 	     	
             System.out.println("Welcome admin:" + username );
             bean.setRole("admin");
             bean.setValid(true);
             bean.setUserid(rs.getInt("auid"));
             return bean;
          }
          
          
          
          rs = stmt.executeQuery(searchQuery2);	        
          boolean more2 = rs.next();
 	       
          // if user does not exist set the isValid variable to false
          if (!more2) 
          {
             System.out.println("Sorry, you are not a registered user! Please sign up first");
             bean.setValid(false);
          } 
 	        
          //if user exists set the isValid variable to true
          else if (more2) 
          {
             String username = rs.getString("userName");
             
 	     	
             System.out.println("Welcome user:" + username );
             bean.setRole("student");
             bean.setValid(true);
             bean.setUserid(rs.getInt("uid"));
             return bean;
          }
          
       } 

       catch (Exception ex) 
       {
          System.out.println("Log In failed: An Exception has occurred! " + ex);
       } 
 	    
       //some exception handling
       finally 
       {
          if (rs != null)	{
             try {
                rs.close();
             } catch (Exception e) {}
                rs = null;
             }
 	
          if (stmt != null) {
             try {
                stmt.close();
             } catch (Exception e) {}
                stmt = null;
             }
 	
          if (currentCon != null) {
             try {
                currentCon.close();
             } catch (Exception e) {
             }

             currentCon = null;
          }
       }
		return bean;
		
	}
}
