<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
      ArrayList<ExamsDto> list = ExamsDao.selectAllExams();
      pageContext.setAttribute("list",list,2);
    %>
    <h1>Select Exam Title</h1>
    
    <form action="finalupdateexams.jsp">
     <label for="examid">Select Exam Topic</label>
     <select name="examid">
         <c:forEach items="${list}" var="e" >
            <option value="${e.examid}">${e.topic}</option>
         </c:forEach>
     </select>
     <br>
     <label for="topic">Enter New Topic</label>
     <input type="text" name="topic" id="topic" placeholder="Enter the new topic here" required />
     <br>
     <input type="submit" value="Update Test" />
     </form>
</body>
</html>