<%@page import="com.candidjava.UserBean"%>
<%@page import="javafiles.AdminAddBookDao"%>
<jsp:useBean id="obj" class="javafiles.BookBean"/>  
<jsp:setProperty property="*" name="obj"/>  
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

try{
//String bookname=request.getParameter("bookname")+"";
System.out.println(obj.getBookauthor()+obj.getBookcount()+obj.getBookname());
AdminAddBookDao.issuebook(obj);
response.sendRedirect("adminaddbook.jsp");
}
catch(Exception e){
 System.out.println("process error:"+e.toString());
}
%>
