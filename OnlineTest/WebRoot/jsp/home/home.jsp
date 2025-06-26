<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String role = (String) session.getAttribute("role");
	String user = null;
	boolean isAdmin = false;
	if ("student".equals(role)) {
		user = (String) session.getAttribute("sname");
	} else if ("admin".equals(role)) {
		user = (String) session.getAttribute("adminName");
		isAdmin = true;
	}

	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@600;800&family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">

<title>ThinkFast HomePage</title>
<style>
html {
	font-size: 10px;
}

* {
	padding: 0;
	margin: 0;
	font-family: Arial, sans-serif;
	box-sizing: border-box;
}

body {
	font-size: 1.6rem;
}

.navbar {
	display: flex;
	align-items: center;
	justify-content: space-around;
	background-color: #fefefe;
	padding: 1rem 12rem 0 3rem;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.left-nav {
	display: flex;
	align-items: center;
	gap: 10rem;
}

.logo img {
	height: 5rem;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 2rem;
}

.nav-links a,.dropbtn {
	font-family: 'Poppins', sans-serif;
	text-decoration: none;
	color: #000;
	font-size: 1.6rem;
	background: none;
	border: none;
	cursor: pointer;
	padding: 1rem 1.5rem;
	transition: all 0.4s ease;
	position: relative;
	font-weight: 600;
}

.dropbtn {
	padding: 1.7rem 1.5rem;
}

.nav-links a::after,.dropbtn::after {
	content: '';
	display: block;
	width: 0;
	height: 0.3rem;
	background: #0056b3;
	transition: width 0.3s;
	margin-top: 2px;
}

.nav-links a:hover::after,.dropbtn:hover::after {
	width: 100%;
}

.dropdown:hover .dropbtn::after {
	width: 100%;
}

.dropdown {
	position: relative;
}

.dropdown-content {
	display: block;
	opacity: 0;
	pointer-events: none;
	position: absolute;
	top: calc(101%);
	left: 0;
	background-color: #fff;
	min-width: 16rem;
	max-width: 24rem;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	z-index: 1;
	border-radius: 0.7rem;
	transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
	transform: translateY(-10px);
}

.dropdown:hover .dropdown-content {
	opacity: 1;
	transform: translateY(0);
	pointer-events: auto;
}

.dropdown-content a {
	display: block;
	padding: 1rem 1.5rem;
	color: #000;
	text-decoration: none;
	font-size: 1.5rem;
	position: relative;
	transition: all 0.3s ease;
	transform-origin: left center;
	font-weight: 500;
	white-space: nowrap;
	width: 100%;
}

.dropdown-content a:hover {
	color: black;
	transform: scale(1.05);
	/* 👈 smooth zoom-in effect */
	font-weight: 500;
}

/* ✅ Remove underline (::after) effect */
.dropdown-content a::after,.dropdown-content:hover::after {
	content: none !important;
}

.blue-button {
	position: relative;
	display: inline-block;
	padding: 1.2rem 2rem;
	font-size: 17px;
	font-weight: 700;
	letter-spacing: 0.05rem;
	text-decoration: none;
	color: white;
	background: linear-gradient(#4646e8, #060640);
	/* Light blue (lighter shade of #30397e) */
	border-radius: 8px;
	overflow: hidden;
	transition: background 0.6s, color 0.4s;
}

.blue-button span {
	position: relative;
	z-index: 10;
}

.blue-button::before {
	content: "";
	position: absolute;
	top: 0;
	left: -10%;
	width: 120%;
	height: 100%;
	background: linear-gradient(89.31deg, #060640 -75.36%, #4646e8 133.83%);;
	/* Deep blue */
	transform: skew(30deg);
	z-index: 0;
	transition: transform 0.4s cubic-bezier(0.3, 1, 0.8, 1);
}

.blue-button:hover::before {
	transform: translate3d(100%, 0, 0);
	background: linear-gradient(89.31deg, #060640 -75.36%, #4646e8 133.83%);
	/* Darker blue on hover */
}

.blue-button:hover {
	background: linear-gradient(#4646e8, #060640);
	/* Dark blue on hover */
}

/*-----------------=====================================================================================================
  Design of user-icon after login 
*/
.profile-dropdown {
	position: relative;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	padding: 0.6rem;
	border-radius: 50%;
	background-color: transparent;
	transition: background 0.3s ease;
	margin-right: 10rem;
}

.profile-dropdown:hover {
	background-color: #f2f3ff;
}

.profile-dropdown .user-icon {
	font-size: 5rem;
	color: #6e74ff;
	transition: color 0.3s ease, transform 0.3s ease;
}

.profile-dropdown:hover .user-icon {
	color: #a2a7ff;
	transform: scale(1.1);
}

.profile-dropdown .profile-dropdown-content {
	display: block;
	opacity: 0;
	pointer-events: none;
	position: absolute;
	left: 0;
	top: calc(100%);
	background-color: #fff;
	min-width: 22rem;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
	z-index: 1000;
	border-radius: 0.7rem;
	padding: 0.8rem 0;
	transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
	transform: translateY(-10px);
	position: absolute; /* Subtle upward motion */
}

.profile-dropdown:hover .profile-dropdown-content {
	opacity: 1;
	transform: translateY(0);
	pointer-events: auto;
}

/* Profile content styling */
.profile-header {
	display: flex;
	align-items: center;
	padding: 1rem 1.6rem;
	background-color: #f5f7ff;
	border-bottom: 1px solid #e0e2ff;
}

.profile-circle {
	background-color: #5e66ff;
	color: #fff;
	font-weight: bold;
	font-size: 1.8rem;
	width: 3.6rem;
	height: 3.6rem;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 1rem;
}

.profile-info .name {
	font-weight: 600;
	font-size: 1.5rem;
	color: #333;
}

.profile-dropdown .profile-dropdown-content a {
	display: flex;
	align-items: center;
	gap: 0.8rem;
	padding: 1rem 1.6rem;
	color: #333;
	text-decoration: none;
	font-size: 1.4rem;
	transition: background 0.3s ease;
}

.profile-dropdown .profile-dropdown-content a:hover {
	background-color: #f0f1ff;
	color: #4b50ff;
}

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

/*Mock Exams Section */
.advantage-section { /* background-color: #f9fafb; */
	background-color: #fbffff;
	padding: 5rem 2rem;
	text-align: center;
}

.advantage-section h2 {
	font-family: 'Poppins', sans-serif;
	font-size: 4rem;
	font-weight: bold;
	color: #1e1b4b;
	margin-bottom: 3rem;
}

.advantage-section p {
	font-family: 'Roboto', sans-serif;
	max-width: 90rem;
	margin: 0 auto 1.5rem;
	font-size: 2rem;
	line-height: 1.6;
	color: #384255;
}

.features-container {
	padding: 0 2rem 5rem 2rem;
	background-color: #fbffff;
}

.features-container h2 {
	font-family: 'Poppins', sans-serif;
	font-size: 4rem;
	font-weight: bold;
	color: #1e1b4b;
	margin-bottom: 4rem;
	text-align: center;
}

.features {
	display: flex;
	justify-content: space-between;
	gap: 3rem;
	max-width: 120rem;
	margin: 0 auto;
	flex-wrap: wrap;
}

.feature-card {
	flex: 1 1 calc(25% -             3rem);
	/*
				flex-grow: 1;
                flex-shrink: 1;
                flex-basis: calc(25% - 3rem); initial space 25% of the container-3rem(for gap)
				*/
	background: transparent;
	padding: 2rem;
	border-radius: 1rem;
	transition: box-shadow 0.3s ease;
	position: relative;
	border: 1px solid #dedffd;
}

.feature-card:hover {
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
}

.feature-card i {
	font-size: 2.8rem;
	padding: 1.5rem;
	border-radius: 50%;
	background-color: #dedffd;
	color: #3333aa;
	position: absolute;
	top: 2rem;
	left: 2rem;
}

.feature-card h3 {
	font-family: 'Poppins', sans-serif;
	font-size: 2rem;
	font-weight: 600;
	color: #111827;
	margin-top: 7rem;
	margin-bottom: 1rem;
}

.feature-card p {
	font-size: 1.5rem;
	color: #4b5563;
	line-height: 1.6;
}

/*Answer Evaluation*/
.answer-evaluation {
	padding: 0 2rem 6rem 2rem;
}

.answer-evaluation h2 {
	font-family: 'Poppins', sans-serif;
	font-size: 4rem;
	font-weight: bold;
	color: #1e1b4b;
	margin-bottom: 4rem;
	text-align: center;
}

.answer-evaluation img {
	display: block;
	margin: 0 auto;
}

/* KEY ROLES FOR STUDENTS */
.keyrole-main-wrapper {
	font-family: 'Segoe UI', sans-serif;
	max-width: 120rem;
	margin: 2rem auto;
}

.keyrole-main-wrapper h2 {
	font-family: 'Poppins', sans-serif;
	font-size: 4rem;
	font-weight: bold;
	color: #1e1b4b;
	margin-bottom: 2rem;
	text-align: center;
}

.keyrole-main-wrapper .key-role {
	display: flex;
	padding: 4rem;
	gap: 8rem;
}

.key-role .left {
	flex: 1;
}

.key-role .left img {
	width: 100%;
}

.key-role .right {
	flex: 1;
	display: flex;
	flex-direction: column;
}

.role-box-wrapper {
	position: relative;
	margin-bottom: 3rem;
	padding: 0 4rem;
}

.role-icon {
	position: absolute;
	left: 10px;
	top: 50%;
	transform: translateY(-50%);
	width: 6rem;
	height: 6rem;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	color: white;
	font-size: 3rem;
}

.role-box {
	background-color: #f1f6fd;
	padding: 2rem 3rem 2rem 4rem;
	border-radius: 2rem;
	color: #111653;
	font-size: 1.7rem;
	min-height: 7rem;
	display: flex;
	align-items: center;
}


</style>

</head>

<body>
	<div class="navbar">
		<div class="left-nav">
			<div class="logo">
				<img src="<%=basePath%>/images/homelogo.png" alt="ThinkFast Logo" />
			</div>

			<div class="nav-links">
				<a href="<%=basePath %>/jsp/home/home.jsp">Home</a>

				<div class="dropdown">
					<button class="dropbtn">
						<%
							if (isAdmin) {
						%>
						Admin <i class="fa-solid fa-caret-down"></i>
						<%
							} else {
						%>
						Student <i class="fa-solid fa-caret-down"></i>
						<%
							}
						%>
					</button>
					<div class="dropdown-content">
						<%
							if (isAdmin) {
						%>
						<a href="<%=basePath %>/jsp/exams/insertexams.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Create Exam</a> 
							<a href="<%=basePath %>/jsp/exams/deleteexams.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Delete Exam</a> 
							<a
							href="<%=basePath %>/jsp/results/adminResult.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> View Result</a>

						<%
							} else {
						%>
						<a href="<%=basePath%>/jsp/home/login.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Login</a> <a
							href="<%=basePath%>/jsp/home/register.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Register</a> <a
							href="<%=basePath%>/jsp/students/selectexam.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Available Exams</a> <a
							href="<%=basePath%>/jsp/results/results.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> View Result</a>
						<%
							}
						%>
					</div>
				</div>

				<div class="dropdown">

					<button class="dropbtn">
						About <i class="fa-solid fa-caret-down"></i>

					</button>
					<div class="dropdown-content">
						<a href="<%=basePath%>/jsp/home/aboutvm.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Vision</a> <a
							href="<%=basePath%>/jsp/home/aboutvm.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Mission</a> <a
							href="<%=basePath%>/jsp/home/aboutvm.jsp"><i
							class="fa-solid fa-circle-chevron-right"></i> Terms & Conditions</a>

					</div>
				</div>

				<div class="dropdown">
					<button class="dropbtn">
						Resources <i class="fa-solid fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="<%=basePath%>/jsp/home/material.jsp"><i class="fa-solid fa-circle-chevron-right"></i>
							Study Materials</a>
					</div>
				</div>

				<a href="contact.jsp">Contact Us</a>
			</div>

			<div class="auth-button">
				<%
					if (user != null) {
						user = user.substring(0, 1).toUpperCase() + user.substring(1);
						char firstLetter = user.toUpperCase().charAt(0);
				%>
				<!--comment // Logged-in:show profile icon with dropdown -->
				<div class="profile-dropdown">
					<i class="fas fa-user-circle user-icon"></i>
					<div class="profile-dropdown-content">
						<div class="profile-header">
							<div class="profile-circle"><%=firstLetter%></div>
							<div class="profile-info">
								<div class="name"><%=user%></div>
							</div>
						</div>
						<hr>
						 <a
							href="<%=basePath%>/jsp/home/logout.jsp"><i
							class="fas fa-sign-out-alt"></i> Logout</a>
					</div>
				</div>



				<%
					} else {
				%>
				<!--comment // Not Logged-in: show Login/Register -->
				<a href="<%=basePath%>/jsp/home/login.jsp" class="blue-button"><span>Login
						/ Register</span> </a>

				<%
					}
				%>
			</div>
		</div>


	</div>

	<!-- *HERO SECTION OR CENTER SECTION =================================================-->

	<div class="hero-section">
		<div class="hero-text" data-aos="fade-right" data-aos-once="false">
			<p class="tagline">Online Exam</p>
			<h1>
				Innovate, Educate,<br>Elevate Your <span>Online<br>Exam
					Hub</span>
			</h1>
			<a href="#" class="hero-btn"><span>Unlock Success</span> </a>

		</div>
		<div class="hero-image">
			<img src="<%=basePath%>/images/hero-banner.png"
				alt="Online Exam Banner">
		</div>
	</div>

	<!--* Mock Advantage-Section -->

	<div class="advantage-section">
		<h2>Mock Exams Advantage</h2>
		<p data-aos="fade-up">Exam prep is particularly important for
			students as it prepares them for potential obstacles on test day. By
			taking these practice tests, students can de-stress from the pressure
			of getting good grades and focus on improving their study techniques
			instead.</p>
		<p data-aos="fade-up">Mock exams give students a chance to develop
			and refine their time management abilities so they can complete all
			questions in the allotted amount of time.</p>
	</div>
	</div>

	<!--* Features Section-->

	<div class="features-container">
		<h2>Explore Core Features of Think Fast</h2>
		<div class="features">
			<div class="feature-card" data-aos="fade-up" data-aos-delay="300">
				<i class="fas fa-user-graduate"></i>
				<h3>Student Panel</h3>
				<p>The Student Panel provides a smooth and intuitive experience.
					Students can start exams, monitor their progress, and view detailed
					results, making test-taking and tracking efficient..</p>
			</div>

			<div class="feature-card" data-aos="fade-up" data-aos-delay="400">
				<i class="fas fa-user-cog"></i>
				<h3>Admin Panel</h3>
				<p>The Admin Panel allows teachers to create, update, and manage
					exams. It also helps monitor student activity and performance with
					ease.</p>
			</div>

			<div class="feature-card" data-aos="fade-up" data-aos-delay="500">
				<i class="fas fa-book-open"></i>
				<h3>Study Resources</h3>
				<p>A centralized hub where students can access all essential
					learning materials, making preparation smarter and more effective.</p>
			</div>

			<div class="feature-card" data-aos="fade-up" data-aos-delay="600">
				<i class="fas fa-chart-line"></i>
				<h3>Analytics & Reports</h3>
				<p>Offers insights into student performance through detailed
					result tracking, attempt history, and progress trends over time.</p>
			</div>
		</div>
	</div>

	<!--* Answer Evaluation -->
	<div class="answer-evaluation">
		<h2>Precision in Answer Evaluation</h2>
		<img src="<%=basePath%>/images/answer-banner.png"
			alt="Answer Evaluation Banner" data-aos="fade-right"
			data-aos-delay="100" data-aos-duration="700" />
	</div>

	<!--* Key Roles for Student-->

	<div class="keyrole-main-wrapper">
		<h2>Key Roles</h2>

		<div class="key-role">
			<div class="left">
				<img src="<%=basePath%>/images/keyrole-banner.png"
					alt="Student working banner" />
			</div>

			<div class="right">
				<div class="role-box-wrapper" data-aos="fade-left"
					data-aos-delay="200">
					<div class="role-icon"
						style="background: linear-gradient(135deg, #FFA726, #FB8C00);">
						<i class="fas fa-stopwatch"></i>
					</div>
					<div class="role-box">Track and manage time efficiently for
						each section of the test.</div>
				</div>

				<div class="role-box-wrapper" data-aos="fade-left"
					data-aos-delay="300">
					<div class="role-icon"
						style="background: linear-gradient(135deg, #29B6F6, #0288D1);">
						<i class="fas fa-brain"></i>
					</div>
					<div class="role-box">Apply critical thinking to solve
						logical and conceptual questions quickly.</div>
				</div>

				<div class="role-box-wrapper" data-aos="fade-left"
					data-aos-delay="400">
					<div class="role-icon"
						style="background: linear-gradient(135deg, #66BB6A, #43A047);">
						<i class="fas fa-chart-pie"></i>
					</div>
					<div class="role-box">Analyse performance instantly through
						real-time analytics and report</div>
				</div>

				<div class="role-box-wrapper" data-aos="fade-left"
					data-aos-delay="500">
					<div class="role-icon"
						style="background: linear-gradient(135deg, #FF7043, #E64A19);">
						<i class="fas fa-comments-dollar"></i>
					</div>
					<div class="role-box">Communicate doubts or technical issues
						clearly through the help system</div>
				</div>

				<div class="role-box-wrapper" data-aos="fade-left"
					data-aos-delay="600">
					<div class="role-icon"
						style="background: linear-gradient(135deg, #AB47BC, #8E24AA);">
						<i class="fas fa-shield-alt"></i>
					</div>
					<div class="role-box">Maintain honesty during the test by
						following all rules and avoiding any unfair means.</div>
				</div>

			</div>
		</div>
	</div>

	<!--* Footer of the thinkfast -->
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