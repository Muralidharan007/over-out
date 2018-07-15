<%@page import="com.candidjava.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Home Page</title>
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
            if(!currentUser.checkRole())
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
 
<h1>Welcome <%out.print(userid); %></h1>
<center>
	<%session.setAttribute("currentSessionUser",currentUser); 
	%>
	
<a href="adminsearchbook.jsp">Search Book</a></br> 
<a href="allbooks.jsp">Show All Books</a> </br> 
<a href="UserPage.jsp">My Details</a> </br> 
<a href="RenewAllBooks.jsp">Renew All Books</a> </br> 
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>

</center>
</body>
</html>