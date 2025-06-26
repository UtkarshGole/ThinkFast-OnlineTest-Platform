<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dto.QuestionsDto" %>
<%@ page import="com.online.jdbc.dto.ResultsDto" %>
<%@ page import="com.online.jdbc.dao.ResultsDao" %>
<%@ page import="com.online.jdbc.dto.StudentsDto" %>
<%@ page import="com.online.jdbc.dao.StudentsDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/jsp/home/navbar.jsp" %>
<%  

   String eid = (String)session.getAttribute("examid");
   int correct = 0 , wrong = 0 , total = 0;
   ArrayList<QuestionsDto> qlist = (ArrayList<QuestionsDto>)session.getAttribute("qlist");
   total = qlist.size();
   
   if(qlist != null && total != 0){
       for(QuestionsDto qDto : qlist){
           if(qDto.isAttempt()){
              if(qDto.isCorrect())
                 correct++;
              else 
                 wrong++;
           }
       }
    }
    
    StudentsDto student = StudentsDao.selectStudent((String)session.getAttribute("email"));
    
    
    ResultsDto rDto = new ResultsDto();
    rDto.setExamId(eid);
    rDto.setRightAnswers(correct+"");
    rDto.setWrongAnswers(wrong+"");
    rDto.setStudentId((String)student.getStudid());
    rDto.setTotalQues(total+"");
    
    ResultsDao.insertResults(rDto);
    
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     
    <title>Result </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    
    <style>
          <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 0;
    }

    h1 {
        color: #2c3e50;
        text-align: center;
        margin-top: 40px;
    }

    .result-container {
        background-color: #ffffff;
        max-width: 600px;
        margin: 30px auto;
        padding: 30px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
    }

    .result-container h2 {
        font-size: 20px;
        margin: 15px 0;
        color: #34495e;
        border-bottom: 1px solid #ecf0f1;
        padding-bottom: 5px;
    }

    .result-container h2:last-child {
        border-bottom: none;
    }
</style>
          
    
  </head>
  
 <body>
    <div>
        <h1>Test Submitted Successfully! Check Your Result:</h1>
        <div class="result-container">   
            <h2>Total Questions: <%= total %></h2>
            <h2>Correct Answers: <%= correct %></h2>
            <h2>Wrong Answers: <%= wrong %></h2>
            <h2>Unattempted: <%= total - (correct + wrong) %></h2>
        </div>
    </div>
    <%
        // Reset session attributes
        session.removeAttribute("examStartTime");
        session.removeAttribute("examid");
        session.removeAttribute("qlist");
        session.removeAttribute("current");
    %>
    <%@ include file="/jsp/home/footer.jsp" %>
</body>

</html>
