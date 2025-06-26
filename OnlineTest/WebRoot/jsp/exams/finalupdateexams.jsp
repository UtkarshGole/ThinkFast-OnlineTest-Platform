<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ page errorPage="error.jsp" %>
<jsp:useBean id="exams" class="com.online.jdbc.dto.ExamsDto" scope="request"/>
<jsp:setProperty property="*" name="exams"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="message" value="updated" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
    if(ExamsDao.updateExams((ExamsDto) request.getAttribute("exams"))){
 %>
 <h2>Successfully Changed </h2>
 <jsp:include page="updateexams.jsp" />
 
 <%
    } else {
 %>
 <jsp:forward page="failure.jsp" />
 
 <% 
    }  // else closing
 %>
 </body>
</html>