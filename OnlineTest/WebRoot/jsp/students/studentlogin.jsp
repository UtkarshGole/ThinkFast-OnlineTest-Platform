<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title> Student Login Page</title>
    
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
    <%
        String registered = (String) session.getAttribute("registered");
        if("true".equals(registered)){
     %>
     
      <div style="color:green;">Registration successful! Your ID id <%= request.getAttribute("id") %>,, don't forget your ID. </div>
      <%
            session.removeAttribute("registered");
            }
       %>
       
       <div>
            <h1>   Login to Continue  </h1>
            <form action="finalstudentlogin.jsp" method="post">
                <div>
                    <label for="studid"> student id:</label>
                    <input type="text" name="studid" id="studid" required />
                </div>
                <div>
                    <label for="password">Password:</label>
                    <input type="password" name="password" id="password" required />
                </div>
                <input type="submit" value="Login" />
                <div>
                    <a href="insertstudent.jsp">Create Account</a>
                </div>
            </form>
       </div>
  </body>
</html>
