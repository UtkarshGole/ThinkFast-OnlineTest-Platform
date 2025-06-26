<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dto.ExamsDto"%>
<%@ page import="com.online.jdbc.dao.ExamsDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if(session.getAttribute("sname") == null){
      session.setAttribute("messageRemark",
	"Login before Start");
	session.setAttribute("messageClass", "message-error");
      response.sendRedirect("/OnlineTest/jsp/home/login.jsp");
      return;
    }
    
    ArrayList<ExamsDto> list = ExamsDao.selectAllExams();
    pageContext.setAttribute("list",list);
    
    String currentExamId = (String) session.getAttribute("examid");
    boolean hasRunningExam = (session.getAttribute("examStartTime") != null);
    pageContext.setAttribute("currentExamId",currentExamId);
    pageContext.setAttribute("hasRunningExam",hasRunningExam);
%>

<%@ include file="/jsp/home/navbar.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>

/* HERO SECTION OR CENTER SECTION -===================================================*/
.hero-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 5rem 14% 0 8%;
	/* top right bottom left*/
	background-color: #f5f7fc;
	flex-wrap: wrap;
}

.hero-text {
	flex: 1;
	max-width: 50%;
	margin-top: -5rem;
}

.hero-text .tagline {
	font-size: 2rem;
	color: #3a3ac8;
	background: rgba(58, 58, 200, 0.1);
	display: inline-block;
	padding: 1.7rem 2rem;
	border-radius: 0.7rem;
	margin-bottom: 1.5rem;
	font-weight: 600;
}

.hero-text h1 {
	margin-top: 1rem;
	font-size: 4rem;
	font-weight: 800;
	line-height: 1.5;
	color: #000;
	margin-bottom: 2rem;
}

.hero-text h1 span {
	color: #303f9f;
}

/* hero button */
.hero-btn {
	position: relative;
	display: inline-block;
	padding: 1.5rem 2rem;
	margin-top: 1rem;
	font-size: 17px;
	font-weight: 700;
	letter-spacing: 0.05rem;
	text-decoration: none;
	color: #3f3f7b;
	background: linear-gradient(#4646e8, #060640);
	border: 2px solid #3f3f7b;
	/* Light blue (lighter shade of #30397e) */
	border-radius: 5px;
	overflow: hidden;
	transition: background 0.6s, color 0.4s;
}

.hero-btn span {
	position: relative;
	z-index: 10;
}

.hero-btn::before {
	content: "";
	position: absolute;
	top: 0;
	left: -10%;
	width: 120%;
	height: 100%;
	background: white;;
	/* Deep blue */
	transform: skew(30deg);
	z-index: 0;
	transition: transform 0.4s cubic-bezier(0.3, 1, 0.8, 1);
}

.hero-btn:hover::before {
	transform: translate3d(100%, 0, 0);
	/* Darker blue on hover */
}

.hero-btn:hover {
	color: white;
	/* Dark blue on hover */
}

.hero-image {
	flex: 1;
	text-align: center;
	align-self: flex-end;
}

.hero-image img {
	width: 65rem;
	height: 45rem;
	margin-bottom: -0.5rem;
	filter: brightness(1.3);
	filter: contrast(1.3);
}

.exam-container {
	width: 90%;
	margin: 50px auto;
}

.section-title {
	font-size: 3.2rem;
	font-weight: 600;
	color: #3a3ac8;
	margin-bottom: 2rem;
	margin-top: 4rem;
	text-align: center;
}

.search-bar {
	display: flex; align-items : center;
	margin-bottom: 3rem;
	margin-left:7rem;
	align-items: center;
	gap:3rem;
}

.search-bar label {
	font-size: 2.5rem;
	font-weight: 600;
	margin-bottom: 0.8rem;
	color: #333;
}

.search-bar input {
	width: 80%;
	padding: 1.2rem 4rem 1.2rem 1.5rem;
	font-size: 1.6rem;
	border: 2px solid #ccc;
	border-radius: 2.5rem;
	outline: none;
	background: #fff;
	background-size: 2rem;
}

.search-bar input:focus {
	border-color: #3a3ac8;
}

.exam-card {
	background: #fff padding:2.5rem;
	margin-bottom: 2.5rem;
	padding:2.5rem;
	border-radius: 1rem;
	border: 1px solid #ddd;
}

.exam-header {
	font-size: 1.7rem;
	font-weight: 500;
	margin-bottom: 1.5rem;
	color: #222;
}

.exam-description {
	background: #fefefe;
	padding: 1.4rem 1.8rem;
	border-left: 0.5rem solid #3a3ac8;
	border-radius: 0.8rem;
	margin: 2rem 0 1.5rem;
	font-size: 1.4rem;
	line-height: 1.6;
	color: #444;
}

.exam-description-title {
	font-size: 1.6rem;
	font-weight: 600;
	color: #2e3192;
	margin-bottom: 0.6rem;
	display: block;
}

.exam-card input[type="submit"] {
	padding: 1rem 2rem;
	font-size: 1.5rem;
	background-color: #4646e8;
	color: white;
	border: none;
	border-radius:6px;
	cursor:pointer;
	transition:background-color 0.3s ease;
}

.exam-card input[type="submit"]:hover{
   background-color:#303f9f;
}


</style>

<script>
	function filterExams() {
		const
		search = document.getElementById('search').value.toLowerCase();
		const
		exams = document.getElementsByClassName('exam-card');

		for (i = 0; i < exams.length; i++) {
			const
			text = exams[i].innerText.toLowerCase();
			exams[i].style.display = text.includes(search) ? 'block' : 'none';
		}
	}
</script>
</head>
<body>
	<!-- *HERO SECTION OR CENTER SECTION =================================================-->

	<div class="hero-section">
		<div class="hero-text" data-aos="fade-right" data-aos-once="false">
			<p class="tagline">Available Exams</p>
			<h1>
				Select an exam <br />from the list below <br />to <span>begin
					your test.</span>
			</h1>
			<a href="#" class="hero-btn"><span>Unlock Success</span> </a>

		</div>
		<div class="hero-image">

			<img src="<%=basePath%>/images/selectexam-banner.png"
				alt="Available Exam Banner">
		</div>
	</div>

	<!-- Exams Section -->
	<div class="exam-container">
		<div class="section-title">Available Exams</div>

		<div class="search-bar">
			<label for="Search">Search</label> <input type="text" id="search"
				placeholder="Search Exams by topic or Examid"
				onkeyup="filterExams()" />
		</div>

		<c:forEach items="${list}" var="e" varStatus="status">
			<div class="exam-card">
				<div class="exam-header">
					<strong>${status.count} </strong> <span><strong>Exam
							ID: </strong> E${e.examid} </span> | <span><strong>Topic: </strong>${e.topic}
					</span> | <span><strong>Duration: </strong>${e.duration } </span> | <span><strong>Level:
					</strong>${e.level}</span>
				</div>


				<div class="exam-description">
					<span class="exam-description-title">Exam Description: </span>
					${e.description }
				</div>

				<form action="startexam.jsp" method="get">
					<input type="hidden" name="examid" value="${e.examid}" />
					<c:choose>
						<c:when test="${hasRunningExam and e.examid == currentExamId}">
							<input type="submit" value="Resume Exam" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="isnew" value="1" />
							<input type="submit" value="Start Exam" />
						</c:otherwise>
					</c:choose>
				</form>
			</div>
		</c:forEach>
	</div>


<%@ include file="/jsp/home/footer.jsp" %>

	<!-- Java Script  -->
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
	<script>
		AOS.init({
			offset : 50,
			duration : 500
		});
	</script>
</body>
</html>
