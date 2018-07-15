<%@page import="com.candidjava.UserBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javafiles.UserTable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Page</title>
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
  <%session.setAttribute("currentSessionUser",currentUser); %>
<h1>Your Details</h1>
<%
ResultSet rs=UserTable.fulltable(userid);%>
Your Current Status</br></br>
<%
try{

out.println("<table BORDER=1 CELLPADDING=0 CELLSPACING=0 WIDTH=100>"+"<tr><th>Book ID</th><th>Issue Date</th><th>Renew Date</th><th>Fine</th></tr>");
while(rs.next()){
out.println("<tr><td><center>"+rs.getInt("bookid")+"</center></td>"
         + "<td><center>"+rs.getString("issuedate")+"</center></td>"+
          "<td><center>"+rs.getString("renewdate")+"</center></td>"+
          "<td><center>"+rs.getInt("fine")+"</center></td>"+
         "</tr>");
}
out.println("</table>");}
catch(Exception e){
	out.print("<center><h2>No Book Found</h2></center>");	
	System.out.println("no table found==="+e.toString());
}
%>
<h2>Fine</h2>
<%int fine=UserTable.getFine(userid);
out.print(fine+""); %>
 <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
        <input type="hidden" name="cmd" value="_cart">
        <input type="hidden" name="upload" value="1">
        <input type="hidden" name="business" value="gloy123@gmail.com">
        
        <input type="hidden" name="item_name_1" value="Library Fine">
        <input type="hidden" name="amount_1" value="<%= fine %>">
        <input type="hidden" name="quantity_1" value="1">
        
        
        <input type="submit" value="Payfine">
        </form>
<form action="userhomepage.jsp">
					<button  type="submit">Home</button>
				</form>
<form action="Logout">
					<button class="waves-effect btn-flat " type="submit">Logout</button>
				</form>
</body>
</html>