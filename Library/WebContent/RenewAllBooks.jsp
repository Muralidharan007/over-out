
<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.BookProcess"%>
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

try{
 
	BookProcess.renewbook(userid);
	session.setAttribute("currentSessionUser",currentUser); 
	response.sendRedirect("userhomepage.jsp");
}
catch(Exception e){
 System.out.println("renew process error:"+e.toString());
}
%>