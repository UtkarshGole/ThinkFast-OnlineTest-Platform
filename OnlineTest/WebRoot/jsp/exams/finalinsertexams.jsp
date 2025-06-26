<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ page import="com.online.jdbc.exception.DBException" %>
<%@ page errorPage="error.jsp" %>
<jsp:useBean id="exams" class="com.online.jdbc.dto.ExamsDto" scope="request" />
<jsp:setProperty property="*" name="exams" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ExamsDto exam = (ExamsDto) request.getAttribute("exams");
    int examId = ExamsDao.insertExams(exam);

    if (examId > 0) {
        application.setAttribute("examid", String.valueOf(examId));  // application scope
        application.setAttribute("topic", exam.getTopic());
%>
        <jsp:include page="/jsp/questions/addquestions.jsp" />
<%
    } else {
        request.setAttribute("errorMsg", "Failed to insert exam.");
%>
        <jsp:include page="/jsp/exams/failure.jsp" />
<%
    }
%>
