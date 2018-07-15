<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javafiles.AdminAddBookDao"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Book</title>
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
<form action="AdminAddBookProcess.jsp" style="align: center;" method="post">
<center><h1>Enter Book Details</h1></br>
<label>Book ID:</label>
<input type="number" name="bsno"></br></br>
<label>Book Name:</label>
<input type="text" name="bookname"></br></br>
<label>Book Count:</label>
<input type="number" name="bookcount"></br></br>
<label>Author Name:</label>
<input type="text" name="bookauthor"></br></br>
<input type="submit" value="Add Book">
</form>
<form action="adminhomepage.jsp">
					<button  type="submit">Home</button>
				</form>
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
				</center>
<%
	//AdminAddBookDao.issuebook();
%>
</body>
</html>