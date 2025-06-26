<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" %>
	<%@ page import="com.online.jdbc.dto.ResultsDto" %>
		<%@ page import="com.online.jdbc.dao.ResultsDao" %>
			<%@ page import="com.online.jdbc.dto.StudentsDto" %>
				<%@ page import="com.online.jdbc.dao.StudentsDao" %>
					<%@ page import="com.online.jdbc.dto.QuestionsDto" %>
						<%@ page import="com.online.jdbc.dao.QuestionsDao" %>
							<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

								<% if(session.getAttribute("sname")==null){
									session.setAttribute("messageRemark", "Login before Start" );
									session.setAttribute("messageClass", "message-error" );
									response.sendRedirect("/OnlineTest/jsp/home/login.jsp"); return; } String
									email=(String)session.getAttribute("email"); StudentsDto
									student=StudentsDao.selectStudent(email); ArrayList<ResultsDto> list =
									ResultsDao.getResultsByStudid(student.getStudid());
									pageContext.setAttribute("list",list);

									%>

									<%@ include file="/jsp/home/navbar.jsp" %>

										<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
										<html>

										<head>

											<title>My JSP 'result.jsp' starting page</title>

											<meta http-equiv="pragma" content="no-cache">
											<meta http-equiv="cache-control" content="no-cache">
											<meta http-equiv="expires" content="0">
											<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
											<meta http-equiv="description" content="This is my page">
											<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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
													background: white;
													;
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


												/* Result Container Section */

												.result-container {
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
													display: flex;
													align-items: center;
													margin-bottom: 3rem;
													margin-left: 7rem;
													gap: 3rem;
												}

												.search-bar label {
													font-size: 2.5rem;
													font-weight: 600;
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
												}

												.search-bar input:focus {
													border-color: #3a3ac8;
												}

												.result-card {
													background: #fff;
													padding: 2.5rem;
													margin-bottom: 2.5rem;
													border-radius: 1rem;
													border: 1px solid #ddd;
													box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
													font-size: 1.6rem;
													color: #333;
													display: flex;
													flex-direction: column;
													align-items: flex-start;


												}

												.result-card span {
													display: block;
													/* 👈 This ensures they stack vertically */
												}

												.result-card span,
												.result-card strong {
													margin-bottom: 0.8rem;
													/* vertical space between lines */
												}
											</style>


											<script>
												function filterExams() {
													const
														search = document.getElementById('search').value.toLowerCase();
													const
														results = document.getElementsByClassName('result-card');

													for (i = 0; i < results.length; i++) {
														const
															text = results[i].innerText.toLowerCase();
														results[i].style.display = text.includes(search) ? 'block' : 'none';
													}
												}
											</script>


										</head>

										<body>
											<!-- *HERO SECTION OR CENTER SECTION =================================================-->

											<div class="hero-section">
												<div class="hero-text" data-aos="fade-right" data-aos-once="false">
													<p class="tagline">View Results</p>
													<h1>
														Review Your <br /> <span>Performance</span>
													</h1>
													<a href="#" class="hero-btn"><span>Unlock Success</span> </a>

												</div>
												<div class="hero-image">

													<img src="<%=basePath%>/images/selectexam-banner.png"
														alt="Available Exam Banner">
												</div>
											</div>

											<div class="result-container">
												<div class="section-title">Result Dashboard</div>

												<div class="search-bar">
													<label for="Search">Search</label> <input type="text" id="search"
														placeholder="Search Exams by topic or Examid"
														onkeyup="filterExams()" />
												</div>


												<c:forEach items="${list}" var="e" varStatus="status">
													<div class="result-card">
														<strong>${status.count}).</strong>
														<span><strong>Test ID: </strong>T${e.testId}</span>
														<span><strong>Exam ID: </strong>E${e.examId}</span>
														<span><strong>Total Questions: </strong>${e.totalQues }</span>
														<span><strong>Right Attempt: </strong>${e.rightAnswers}</span>
														<span><strong>Wrong Attempt: </strong>${e.wrongAnswers}</span>
														<span><strong>Submitted On: </strong>${e.examDate}</span>
													</div>

												</c:forEach>
											</div>

											<%@ include file="/jsp/home/footer.jsp" %>
										</body>

										</html>