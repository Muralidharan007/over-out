<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.BookProcess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%
String bookid= request.getParameter("bookid")+"";
String useridret= request.getParameter("userid")+"";
BookProcess.returnBook(useridret, bookid);
response.sendRedirect("adminhomepage.jsp");
%>
<img src="https://i.imgur.com/k9GyXLC.gif" alt="Please Wait">
</body>
</html>