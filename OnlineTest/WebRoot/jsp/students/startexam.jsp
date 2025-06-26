<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dto.QuestionsDto" %>
<%@ page import="com.online.jdbc.dao.QuestionsDao" %>
<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String eid = request.getParameter("examid");
    if (eid == null)
        eid = (String) session.getAttribute("examid");

    if (eid == null || session.getAttribute("sname") == null) {
     session.setAttribute("messageRemark",
	"Login before Start");
	session.setAttribute("messageClass", "message-error");
      response.sendRedirect("/OnlineTest/jsp/home/login.jsp");
      return;
    }

    session.setAttribute("examid", eid);
    
    Long startTime = (Long) session.getAttribute("examStartTime");
    if (startTime == null) {
        startTime = System.currentTimeMillis(); // milliseconds
        session.setAttribute("examStartTime", startTime);
    }
    pageContext.setAttribute("examStartTime", startTime);
    
    
    
    int n = 1, total = 0;
    Integer current = (Integer) session.getAttribute("current");
    ArrayList<QuestionsDto> qlist = (ArrayList<QuestionsDto>) session.getAttribute("qlist");

    if (qlist == null && request.getParameter("isnew") != null) {
        qlist = QuestionsDao.selectAllQuestions(eid);
        Collections.sort(qlist);
        session.setAttribute("qlist", qlist);
    }

   total = qlist.size();
   ExamsDto examDto = ExamsDao.getExamById(eid);
   if(examDto == null){
      session.setAttribute("messageRemark", "Exam Not Found!");
      session.setAttribute("messageClass" , "message-error");
      return;
   }
   
   int totalTime = examDto.getDuration() * 60; 
   pageContext.setAttribute("totalTime", totalTime);
   

    if (qlist == null || total == 0) {
        response.sendRedirect("empty.jsp");
        return;
    }

    String option = request.getParameter("option");
    if (option != null) {
        current = (Integer) session.getAttribute("current");
        QuestionsDto qDto = qlist.get(current - 1);
        qDto.setAttempt(true);
        qDto.setCorrect(qDto.getAnswer().equalsIgnoreCase(option));
        qDto.setUserAnswer(option);
    }

    String btn = request.getParameter("btn");
    if (btn != null)
        btn = btn.toUpperCase();

    if (current == null)
        current = 1;

    if (btn != null) {
        if (btn.equals("PREVIOUS")) {
            n = current - 1;
        } else if (btn.equals("NEXT")) {
            n = current + 1;
        } else if (btn.equals("SUBMIT")) {
            pageContext.forward("/jsp/students/result.jsp");
            return;
        } else {
            n = Integer.parseInt(btn);
        }

        session.setAttribute("n", n);
        session.setAttribute("current", n);

        response.sendRedirect("startexam.jsp");
        return;
    } else {
        n = current;
    }

    QuestionsDto qDto = qlist.get(n - 1);
    pageContext.setAttribute("qDto", qDto);
    pageContext.setAttribute("total", total);
    session.setAttribute("n", n);
    session.setAttribute("current", n);
    

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Question Attempting</title>

</head>
<body>

<div class="container">
     <!-- 👇  Timer Add kiya -->
    <div style="text-align:right; font-size:20px; font-weight:bold;">
    Time Left: <span id="timer">--:--</span>
   </div>

    
    <div class="question-container">
        <p class="question">Q${n}: ${qDto.que}</p>
        <form action="startexam.jsp" method="post">
            <div class="box">
                <input type="radio" name="option" value="A" <c:if test="${qDto.userAnswer == 'A'}">checked</c:if> />
                <span class="option-label">${qDto.a}</span>
            </div>
            <div class="box">
                <input type="radio" name="option" value="B" <c:if test="${qDto.userAnswer == 'B'}">checked</c:if> />
                <span class="option-label">${qDto.b}</span>
            </div>
            <div class="box">
                <input type="radio" name="option" value="C" <c:if test="${qDto.userAnswer == 'C'}">checked</c:if> />
                <span class="option-label">${qDto.c}</span>
            </div>
            <div class="box">
                <input type="radio" name="option" value="D" <c:if test="${qDto.userAnswer == 'D'}">checked</c:if> />
                <span class="option-label">${qDto.d}</span>
            </div>
            <div class="btn-box">
                <input type="submit" value="PREVIOUS" ${n==1?"disabled":""} name="btn" class="pre-btn"/>
                <input type="submit" value="NEXT" ${n==total?"disabled":""} name="btn" class="next-btn"/>
                <input type="submit" value="SUBMIT" name="btn" class="next-btn"/>
            </div>
            
                  <!-- All Questions in same form -->
            <div class="all-question-container">
                <c:forEach items="${qlist}" var="q">
                    <button type="submit" name="btn" value="${q.qid}" class="btn question-btn">${q.qid}</button>
                </c:forEach>
            </div>
        </form>
    </div>

</div>

<%
    Long examStartTimeJs = (Long) pageContext.getAttribute("examStartTime");
    if (examStartTimeJs == null) examStartTimeJs = System.currentTimeMillis();
%>
<script>
    // Total test duration in seconds (from server)
    var totalTime = <%= totalTime  %>;

    // Start time from server (in milliseconds)
    var examStartTime = <%= examStartTimeJs %>;

    var now = new Date().getTime();
    var elapsed = Math.floor((now - examStartTime) / 1000);
    var timeLeft = totalTime - elapsed;
    if (timeLeft < 0) timeLeft = 0;

    var timerDisplay = document.getElementById("timer");

    function showTime(t) {
        var minutes = Math.floor(t / 60);
        var seconds = t % 60;
        if (seconds < 10) seconds = '0' + seconds;
        timerDisplay.textContent = minutes + ":" + seconds;
    }

    function startTimer() {
        showTime(timeLeft);
        var interval = setInterval(function () {
            timeLeft--;
            if (timeLeft <= 0) {
                clearInterval(interval);
                var form = document.createElement("form");
                form.method = "post";
                form.action = "result.jsp";
                document.body.appendChild(form);
                form.submit();
            } else {
                showTime(timeLeft);
            }
        }, 1000);
    }

    window.onload = startTimer;
</script>




      

</body>
</html>
