
		package com.candidjava;

		import java.io.IOException;
		import java.sql.Connection;
		import java.sql.DriverManager;
		import java.sql.PreparedStatement;
		import java.sql.SQLException;

		import javax.servlet.ServletException;
		import javax.servlet.http.HttpServlet;
		import javax.servlet.http.HttpServletRequest;
		import javax.servlet.http.HttpServletResponse;

		/**
		 * Servlet implementation class LoginController
		 */
		public class SignupController extends HttpServlet {
			
			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String first_name = request.getParameter("first_name");
				String last_name = request.getParameter("last_name");
				String username = request.getParameter("username");
				String password =request.getParameter("password");
				String address = request.getParameter("address");
				Integer contact = Integer.parseInt(request.getParameter("contact"));
				//String usrtyp=(String)request.getParameter("user_type");
				
				if(first_name.isEmpty() || last_name.isEmpty() || username.isEmpty() || 
						password.toString().isEmpty() || address.isEmpty() || contact.toString().isEmpty())
				{
					response.sendRedirect("signup.html");
					return;
				}
				else {
				//System.out.println(""+first_name+"    "+last_name+"    "+username+"    "+password+"  "+address+"   "+contact+"    "+usrtyp+"");
				
				
				String insertTableSQL = "INSERT INTO student(fname,lname,userName,pass,email,contact) VALUES"
						+ "(?,?,?,?,?,?)";
				
				try {
					Class.forName("com.mysql.jdbc.Driver");
				 // loads driver
				Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/library", "root", "8898"); // gets a new connection
		 
				PreparedStatement ps = c.prepareStatement(insertTableSQL);
				ps.setString(1,first_name.toString());
				ps.setString(2,last_name.toString());
				ps.setString(3, username.toString());
				ps.setString(4,password);
				ps.setString(5,address.toString());
				ps.setInt(6,contact);
				
				ps.executeUpdate();
				
		        response.sendRedirect("index.jsp");
				return;
				
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				
				
				}
			}

		}