<%@page import="com.online.jdbc.dao.ExamsDao"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" %>
<c:set var="message" value="deleted" scope="request"/>
<%
  String examid = request.getParameter("examid");
  if (examid != null && ExamsDao.deleteExams(examid)) {
%>
    <h2 style="color:green">Exam successfully removed!</h2>
    <jsp:include page="deleteexams.jsp"/>
<%
  } else {
%>
    <h2 style="color:red">Failed to remove exam. Please try again.</h2>
<%
   response.sendRedirect("deleteexams.jsp");
  }
%>

