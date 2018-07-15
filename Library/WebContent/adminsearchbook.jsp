<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Books</title>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate"); 
            UserBean currentUser = new UserBean();
            currentUser = (UserBean)session.getAttribute("currentSessionUser"); 
            try{
            if(currentUser == null){
    			response.sendRedirect("index.jsp");
    		}
            }
            catch(Exception e)
            {
            	            }
            %>
<center><h1>Enter Book Details</h1></br></br>
<%session.setAttribute("currentSessionUser",currentUser); %>
<form action="AdminSearchBookResult.jsp" style="align: center;" method="post">
<label>Enter Book Name To Search</label>
<input type="text" name="bookname"></br></br>
<input type="submit" value="Search">
</form>
<form action="userhomepage.jsp">
					<button  type="submit">Home</button>
				</form>
<form action="Logout">
					<button class="waves-effect btn-flat " type="submit">Logout</button>
				</form>
</center>
</body>
</html>