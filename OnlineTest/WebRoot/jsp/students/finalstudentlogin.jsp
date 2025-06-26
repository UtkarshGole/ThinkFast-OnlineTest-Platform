<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dto.StudentsDto" %>
<%@ page import="com.online.jdbc.dao.StudentsDao" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <% 
    /*String sname = StudentsDao.studentLogin(request.getParameter("studid"), request.getParameter("password")); 
    if(sname != null){
        session.setAttribute("sname",sname);
        session.setAttribute("studid",request.getParameter("studid"));
        session.setAttribute("password",request.getParameter("password"));  */
       
  %>
      
      
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Exam Dashboard</title>
    
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
    <span><%= session.getAttribute("sname").toString().toUpperCase().charAt(0)%></span>
    </div>
    
    <div id="profileDetails" class="profile-details">
        <h3>Personal Info <h3>
          <p><strong>Name:</strong> <%= session.getAttribute("sname") %></p>
        <p><strong>ID:</strong> <%= session.getAttribute("studid") %></p>
        
         <form action="student.logout.jsp">
             <input type="submit" value="Logout">
         </form>
    </div>
    
    <form action="/OnlineTest/index.html" method="get">
           <button type="submit">Back to home</button>
    </form>
    
    <h2>Welcome <%= session.getAttribute("sname").toString().toUpperCase() %></h2>
    <p>Pick an option from the list below:</p>
     
    <a href="selectexam.jsp">Start Test</a>
    <a href="result.jsp">view Results</a>
    <a href="resourse.jsp">Resources</a>
    
    <%
   /*  } else { */
    %>
    <h1> Login Failed:Invalid Username or Password </h1>
    <jsp:include page="studentlogin.jsp" />
    
    <% /*  }  */ %> 
  </body>
</html> 
