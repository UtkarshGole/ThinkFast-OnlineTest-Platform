<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String sname = (String) session.getAttribute("sname");
    if (sname == null) {
%>
    <h1 style="color:red;">Login Failed: Invalid Username or Password</h1>
<%
        return;
    }

    ArrayList<ExamsDto> list = ExamsDao.selectAllExams();
    pageContext.setAttribute("list", list);

    String currentExamId = (String) session.getAttribute("examid");
    boolean hasRunningExam = (session.getAttribute("examStartTime") != null);
    pageContext.setAttribute("currentExamId", currentExamId);
    pageContext.setAttribute("hasRunningExam", hasRunningExam);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Active Exams</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f5f7fc;
        }

        .hero-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5rem 14% 0 8%;
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

        .hero-btn {
            position: relative;
            display: inline-block;
            padding: 1.5rem 2rem;
            margin-top: 1rem;
            font-size: 17px;
            font-weight: 700;
            text-decoration: none;
            color: #3f3f7b;
            background: linear-gradient(#4646e8, #060640);
            border: 2px solid #3f3f7b;
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
            transform: skew(30deg);
            z-index: 0;
            transition: transform 0.4s cubic-bezier(0.3, 1, 0.8, 1);
        }

        .hero-btn:hover::before {
            transform: translate3d(100%, 0, 0);
        }

        .hero-btn:hover {
            color: white;
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
            filter: brightness(1.3) contrast(1.3);
        }

        .container {
            width: 90%;
            margin: 50px auto;
        }

        .section-title {
            font-size: 1.6rem;
            font-weight: 600;
            color: #3a3ac8;
            margin-bottom: 20px;
            margin-top: 40px;
            text-align: center;
        }

        .search-bar {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }

        .search-bar label {
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 8px;
            color: #333;
        }

        .search-bar input {
            width: 60%;
            padding: 12px 40px 12px 15px;
            font-size: 16px;
            border: 2px solid #ccc;
            border-radius: 25px;
            outline: none;
            background: #fff url('https://cdn-icons-png.flaticon.com/512/49/49116.png') no-repeat right 12px center;
            background-size: 20px;
        }

        .search-bar input:focus {
            border-color: #3a3ac8;
        }

        .exam-card {
            background: #fff;
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 10px;
            border: 1px solid #ddd;
        }

        .exam-header {
            font-size: 17px;
            font-weight: 500;
            margin-bottom: 15px;
            color: #222;
        }

        .exam-description {
            background: #fefefe;
            padding: 14px 18px;
            border-left: 5px solid #3a3ac8;
            border-radius: 8px;
            margin: 20px 0 15px;
            font-size: 14px;
            line-height: 1.6;
            color: #444;
        }

        .exam-description-title {
            font-size: 16px;
            font-weight: 600;
            color: #2e3192;
            margin-bottom: 6px;
            display: block;
        }

        .exam-card input[type="submit"] {
            padding: 10px 20px;
            font-size: 15px;
            background-color: #4646e8;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .exam-card input[type="submit"]:hover {
            background-color: #303f9f;
        }

        .exam-card input[type="submit"]:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        .footer {
            text-align: center;
            margin-top: 60px;
            font-size: 14px;
            color: #777;
        }

        .footer a {
            color: #3a3ac8;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>

    <script>
        function filterExams() {
            const search = document.getElementById('search').value.toLowerCase();
            const exams = document.getElementsByClassName('exam-card');

            for (let i = 0; i < exams.length; i++) {
                const text = exams[i].innerText.toLowerCase();
                exams[i].style.display = text.includes(search) ? 'block' : 'none';
            }
        }
    </script>
</head>
<body>

<!-- Hero Section -->
<div class="hero-section">
    <div class="hero-text">
        <div class="tagline">Start Your Journey</div>
        <h1>Ready to <span>Test Yourself?</span></h1>
        <a href="#exams" class="hero-btn"><span>Explore Exams</span></a>
    </div>
    <div class="hero-image">
        <img src="your-image-path.jpg" alt="Hero Image">
    </div>
</div>

<!-- Exams Section -->
<div class="container">
    <div class="section-title">Available Exams</div>

    <div class="search-bar">
        <label for="search">Search</label>
        <input type="text" id="search" placeholder="Search Exams" onkeyup="filterExams()" />
    </div>

    <c:forEach items="${list}" var="e" varStatus="status">
        <div class="exam-card">
            <div class="exam-header">
                <strong>${status.count}.</strong>
                <span><strong>Exam ID:</strong> ${e.examid}</span> &nbsp; | &nbsp;
                <span><strong>Topic:</strong> ${e.topic}</span> &nbsp; | &nbsp;
                <span><strong>Duration:</strong> ${e.duration} min</span> &nbsp; | &nbsp;
                <span><strong>Level:</strong> ${e.level}</span>
            </div>

            <div class="exam-description">
                <span class="exam-description-title">📘 Exam Description:</span>
                ${e.description}
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

<!-- Footer -->
<div class="footer">
    <p>&copy; 2025 Your Online Exam Portal. All rights reserved. | <a href="#">Privacy Policy</a></p>
</div>

</body>
</html>
