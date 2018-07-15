<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.candidjava.UserBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

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
	            }
%>
	
Login successfully into ADMIN
</body>
</html>