<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.BookProcess"%>
<%@page import="com.candidjava.LoginController"%>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
UserBean currentUser=LoginController.useridf;
System.out.println("fineclear==>"+currentUser.getUserid());
session.setAttribute("currentSessionUser",currentUser); 
BookProcess.clearFine(currentUser.getUserid());
response.sendRedirect("UserPage.jsp");
%>