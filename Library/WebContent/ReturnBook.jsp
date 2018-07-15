<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Return Book</title>
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
<center>
<h2>To Return A Book</h2>
<%session.setAttribute("currentSessionUser",currentUser); %>
<form action="ReturnBookProcess.jsp" method="post">
Enter User Id:<input type="text" name="userid"></br></br>
Enter Book Id:<input type="text" name="bookid"></br></br>
<input type="submit" value="Return Book">
</form>
<form action="adminhomepage.jsp">
					<button  type="submit">Home</button>
				</form>
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
</center>
</body>
</html>