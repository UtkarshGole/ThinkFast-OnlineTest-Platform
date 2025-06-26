<%@page import ="com.online.jdbc.dao.QuestionsDao" %>
<%@page import ="com.online.jdbc.dto.QuestionsDto" %>
<%@ page errorPage="error.page" %>

<jsp:useBean id="question" class="com.online.jdbc.dto.QuestionsDto" scope="request"/>
<jsp:setProperty property="*" name="question"/>

<%
    question.setExamid((String)application.getAttribute("examid"));
    boolean status = QuestionsDao.insertQuestion(question);
    if(!status) {
 %>
  <h1>Failed to insert new Question</h1>
  
  <% } 
  
    pageContext.include("addquestions.jsp");
  %>
