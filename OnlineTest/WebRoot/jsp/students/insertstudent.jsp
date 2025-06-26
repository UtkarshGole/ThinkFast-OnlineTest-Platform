<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Create New Student</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div>
         <h1>Register a new student</h1>
         <form action="jsp/students/finalinsertstudent.jsp" method="post" >
              <div>
                  <label for="sname">Student Name:</label>
                  <input type="text" name="sname" id="sname" required/>
              </div>
              <div>
                  <label for="password">Password:</label>
                  <input type="text" name="password" id="password" required/>
              </div>
              <input type="submit" value="Create Account" />
         </form>
    </div>
  </body>
</html>
