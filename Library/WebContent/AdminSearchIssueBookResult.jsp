<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.SearchResultSet"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="javafiles.BookBean"/>  
<jsp:setProperty property="*" name="obj"/>
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
<h2>Select A Book</h2>
<form action="IssueBookProcess.jsp" style="align: center;" method="post">
<%
try{
String bookname=request.getParameter("bookname")+"";
ResultSet rs=SearchResultSet.searchrs(bookname);
/*out.println("<table BORDER=1 CELLPADDING=0 CELLSPACING=0 WIDTH=100>"+"<tr><th>Book ID</th><th>Book Name</th><th>Book Count</th><th>Book Author</th></tr>");

while(rs.next()){
out.println("<tr><td><center>"+rs.getInt("bsno")+"</center></td>"
         + "<td><center>"+rs.getString("bookname")+"</center></td>"+"<td><center>"+rs.getInt("bookcount")+"</center></td>"+"<td><center>"+rs.getString("bookauthor")+"</center></td>"+"</tr>");
}
out.println("</table>");*/
String a;
int id;
while(rs.next()){
	a=rs.getString("bookname");
	id=rs.getInt("bsno");
%>
<input type="radio" name=bookid value="<%out.println(id);%>" >
<% out.print(a);
//System.out.println(rs.getString("bookname"));
%>
<br/>
<%
}

//response.sendRedirect("adminaddbook.jsp");

}
catch(Exception e){
 System.out.println("process error:"+e.toString());
}
%>
</br><input type="submit" value="Issue Book">
</form>
<%
	//AdminAddBookDao.issuebook();
%>
<form action="Logout">
					<button  type="submit">Logout</button>
				</form>
</body>
</html>