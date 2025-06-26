<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>Student Logout Page</title>
    
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
       <div id="logoutMessage"> 
            <% 
               if(session != null){
                 session.invalidate();
             %>
                   <h1>Logout Successfully !</h1>
            
            <%  
                } else {  
            %>
              <h1>Your Session has already been expired.</h1>  
                
            <%  }  %>
        </div>
        
        <jsp:include page="studentlogin.jsp" />
  </body>
</html>
