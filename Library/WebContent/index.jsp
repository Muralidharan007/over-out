<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
</head>
<body style="background-color: aliceblue">
     <img class="col-sm-12 img-rounded img-responsive"  src="http://www.niced.org.in/niced/images/LibraryBanner.jpg">

 
<center><h2>LOGIN PAGE</h2>
 

 <br> <br>

<form action=LoginController  method="post">

Enter User Name :<input type="text" name="username"> <br><br>
Enter Password :<input type="password" name="password"><br><br>

<input type="submit" value="Login">
</form>
<br>

Not an user sign up here
<form action=signup.html method="get">

<input type="submit" value="Signup">

</form>
</center>
</body>
</html>