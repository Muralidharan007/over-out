<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Issue Book</title>
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
<%session.setAttribute("currentSessionUser",currentUser); %>
<center><h1>Pick User</h1>
<a href="AdminIssueBookUserSearch.jsp">Search Users</a> </br> </br>
OR</br></br>
Enter User Id: </br> </br>

<form action="adminselectbook.jsp" method="post">
<input type="text" name="userid">
<input type="submit" value="Select User"></form>
<form action="adminhomepage.jsp">
					<button  type="submit">Home</button>
				</form>
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
</center>
</body>
</html>