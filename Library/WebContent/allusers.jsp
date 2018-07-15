<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.SearchResultUserSet"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>All Books</title>
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
<h1>Users In Library</h1>
<%
ResultSet rs=SearchResultUserSet.searchrs("");
try{
out.println("<table BORDER=1 CELLPADDING=0 CELLSPACING=0 WIDTH=100>"+"<tr><th>User ID</th><th>User Name</th></tr>");

while(rs.next()){
out.println("<tr><td><center>"+rs.getInt("uid")+"</center></td>"
         + "<td><center>"+rs.getString("username")+"</center></td>"+"</tr>");
}
out.println("</table>");}
catch(Exception e){
	out.print("<center><h2>No User Found</h2></center>");	
	System.out.println("no table found==="+e.toString());
}
%>
<form action="adminhomepage.jsp">
					<button  type="submit">Home</button>
				</form>
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
</body>
</html>