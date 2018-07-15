<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home Page</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
String  userid=null;
	UserBean currentUser = new UserBean();
	currentUser = (UserBean)session.getAttribute("currentSessionUser"); 
	try{
	if(currentUser == null){
	response.sendRedirect("index.jsp");
	}
	if(currentUser.checkRole())
	{
	response.sendRedirect("index.jsp");
	}
	 userid=currentUser.getUserid()+""; 
}
catch(Exception e)
{
	            }
%>
<h1>Welcome <%out.print(userid); %></h1>
<center>
<%session.setAttribute("currentSessionUser",currentUser); %>
<a href="adminaddbook.jsp">Add Book</a> </br>
<a href="adminsearchbook.jsp">Search Book</a></br> 
<a href="issuebook.jsp">Issue Book</a> </br> 
<a href="ReturnBook.jsp">Return Book</a> </br>
<a href="allbooks.jsp">Show All Books</a> </br> 
<a href="allusers.jsp">Show All Users</a> </br> 
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
</center>
</body>
</html>