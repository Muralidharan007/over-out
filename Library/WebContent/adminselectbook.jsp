<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Select Book</title>
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
            	System.out.println("userpage error"+e.toString());
  }
            
  %>   
<%session.setAttribute("currentSessionUser",currentUser); %>
<%session.setAttribute("useridissuebook",request.getParameter("userid"));
%>
<center><h1>Select Book For UserId<%out.print("  "+request.getSession().getAttribute("useridissuebook")); %></h1>
<a href="AdminIssueBookSearch.jsp">Search Books</a> </br></br> 
OR</br></br>
Enter Book ID: </br> 
<form action="IssueBookProcess.jsp" method="post">
<input type="text" name="bookid">
<input type="submit" value="Select Book"></form>
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
</center>
</body>
</html>