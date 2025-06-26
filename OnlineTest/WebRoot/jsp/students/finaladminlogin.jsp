<%@ page language="java" import="java.util.*,com.online.jdbc.dto.StudentsDto,com.online.jdbc.dao.StudentsDao" pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>
<jsp:useBean id="students" class="com.online.jdbc.dto.StudentsDto" scope="request" />
<jsp:setProperty property="*" name="students"/>

<%  
    StudentsDto student = (StudentsDto)request.getAttribute("students");
    String sname = StudentsDao.adminLogin(student);
    if (sname != null) {
        session.setAttribute("sname", sname);
        session.setAttribute("studid", request.getParameter("studid"));
        session.setAttribute("password",request.getParameter("password"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Welcome dear Admin <%= sname %></h2>
    <p>Pick an option from the list below:</p>

    <a href="/OnlineTest/jsp/exams/insertexams.jsp">Create Exam</a><br>
    <a href="/OnlineTest/jsp/exams/deleteexams.jsp">Delete Exam</a><br>
    <a href="/OnlineTest/jsp/exams/viewexams.jsp">View Exam</a><br>
    <a href="/OnlineTest/jsp/exams/updateexams.jsp">Update Exam</a><br>

    <form action="/OnlineTest/index.html" method="get">
        <button type="submit">Return to Home</button>
    </form>
</body>
</html>
<%
    } else {
%>
    <h1>Login Failed: Invalid Username or Password</h1>
<%
    }
%>
