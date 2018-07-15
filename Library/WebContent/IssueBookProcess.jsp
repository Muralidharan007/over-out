<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.BookProcess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wait</title>
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
            }
            catch(Exception e)
            {
            	System.out.println("userpage error"+e.toString());
  }
            
  %>  
  <%session.setAttribute("currentSessionUser",currentUser); %> 
<%
session.setAttribute("bookidissuebook",request.getParameter("bookid"));
String bookid= session.getAttribute("bookidissuebook")+"";
userid=session.getAttribute("useridissuebook")+"";
BookProcess.issueBook(userid, bookid);
response.sendRedirect("issuebook.jsp");
%>

<img src="https://i.imgur.com/k9GyXLC.gif" alt="Please Wait">
</body>
</html>