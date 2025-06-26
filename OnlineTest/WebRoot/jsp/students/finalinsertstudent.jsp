<%@ page import="com.online.jdbc.dao.StudentsDao" %>
<%@ page import="com.online.jdbc.dto.StudentsDto" %>
<%@ page import="com.online.jdbc.exception.DBException" %>
<%@ page errorPage="error.jsp" %>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="student" class="com.online.jdbc.dto.StudentsDto" scope="request" />
<jsp:setProperty property="*" name="student" />

<%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="inserted" scope="request"></c:set>

<% 
    int id;
    id = StudentsDao.insertStudent((StudentsDto)request.getAttribute("student"));
    
    if(id != -1){
    request.setAttribute("id",id);
    session.setAttribute("registered", "true");
%>

    <jsp:forward page="studentlogin.jsp" />
    
<%
       } else {
%>
    <jsp:forward page="failure.jsp" />
 
 <% } // else closing  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'finalinsertstudent.jsp' starting page</title>
    
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
    This is my JSP page. <br>
  </body>
</html>
