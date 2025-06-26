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