package com.candidjava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//public static int useridfine=0;
	public static UserBean useridf;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{	    

		     UserBean user = new UserBean();
		     user.setUserName(request.getParameter("username"));
		     user.setPassword(request.getParameter("password"));

		     user = UserDAO.login(user);
			 useridf=user;   
		     if (user.isValid())
		     {
			        
		          HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",user);
		          
		          if(user.checkRole())
		          {
		     
		          response.sendRedirect("userhomepage.jsp"); //logged-in page
		          }
		          else
		          {
		          response.sendRedirect("adminhomepage.jsp");  
		          }
		     }
			        
		     else 
		          response.sendRedirect("error.jsp"); //error page 
		} 
				
				
		catch (Throwable theException) 	    
		{
		     System.out.println(theException); 
		}
		       }
			}