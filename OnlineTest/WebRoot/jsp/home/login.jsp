<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String selectedRole = request.getParameter("role");
	if (selectedRole == null) {
		selectedRole = "student";
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ThinkFast Login</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Inter', sans-serif;
}

html {
	font-size: 10px;
}

body {
	background: #f1f5f9;
}

.wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	padding: 1rem;
}

.container {
	background: white;
	border-radius: 3rem;
	display: flex;
	overflow: hidden;
	box-shadow: 0 1.5rem 4.5rem rgba(0, 0, 0, 0.08);
	width: 100rem;
	height: 65rem;
	max-width: 95%;
}

.left-panel {
	flex: 1.1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding: 5rem;
}

.blue-box {
	background: linear-gradient(135deg, #244193, #88bbf9);
	color: white;
	border-radius: 4rem;
	padding: 4rem 5rem;
	height: 100%;
	display: flex;
	flex-direction: column;
	box-shadow: inset 0 0 50px rgba(255, 255, 255, 0.05);
}

.blue-box h1 {
	font-size: 3rem;
	line-height: 1.4;
	font-weight: 700;
	margin-bottom: 1.6rem;
}

.blue-box p {
	font-size: 1.5rem;
	line-height: 1.6;
	opacity: 0.95;
}

.characters {
	display: flex;
	justify-content: center;
	gap: 2rem;
	margin-top: 2rem;
}

.characters img {
	width: 15rem;
	height: 30rem;
}

.right-panel {
	flex: 1;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding-right: 5rem;
}

.logo {
	display: flex;
	align-items: center;
	font-size: 2rem;
	font-weight: 600;
	margin-bottom: 2rem;
	color: #1e3a8a;
}

.logo .circle {
	background: #1e3a8a;
	color: white;
	width: 4.5rem;
	height: 4.5rem;
	border-radius: 50%;
	display: grid;
	place-items: center;
	margin-right: 1rem;
	font-weight: bold;
}

.logo span {
	font-size: 2.5rem;
}

.right-panel h2 {
	font-size: 2.5rem;
	margin-bottom: 1.5rem;
	font-weight: 900;
	color: #1e293b;
}

.sub-text {
	font-size: 1.3rem;
	margin-bottom: 1.5rem;
	color: #475569
}

.login-box {
	background: white;
	padding: 2.5rem;
	border-radius: 1rem;
	border: 1px solid #cbd5e1;
}

.tab-buttons {
	display: flex;
	justify-content: space-between;
	border-radius: 8px;
	background: #e2e8f0;
	padding: 4px;
	margin-bottom: 1.6rem;
}

.tab-buttons button {
	flex: 1;
	padding: 1rem;
	border: none;
	border-radius: 0.8rem;
	font-size: 1.5rem;
	cursor: pointer;
	font-weight: bold;
	background: transparent;
	color: #475569;
}

.tab-buttons button.active {
	background: linear-gradient(to right, #27428e, #4d9dff);
	color: white;
}

.form-container {
	display: none;
}

.form-container.active {
	display: block;
}

.form-container input {
	padding: 1rem;
	margin: 0.8rem 0;
	border: 1px solid #cbd5e1;
	font-size: 1.4rem;
	width: 100%;
}

input:focus {
	outline: none;
	border-color: #3b82f6;
}

.login-btn {
	background: linear-gradient(to right, #27428e, #4d9dff);
	color: white;
	border: none;
	padding: 1rem;
	border-radius: 0.8rem;
	font-weight: 600;
	cursor: pointer;
	margin-top: 1.2rem;
	width: 100%;
	transition: filter 0.3s ease;
}

.login-btn:hover {
	filter: contrast(1.2);
}

.signup {
	margin-top: 1rem;
	font-size: 1.3rem;
	text-align: center;
	color: #475569;
}

.signup a {
	color: #3b82f6;
	text-decoration: none;
	font-weight: 500;
}

.message-success {
	color: green;
	background-color: #e6ffe6;
	padding: 10px;
	border-radius: 4px;
}

.message-error {
	color: red;
	background-color: #ffe6e6;
	padding: 10px;
	border-radius: 4px;
}
</style>
</head>

<body>

	<div class="wrapper">
		<div class="container">
			<div class="left-panel">
				<div class="blue-box">
					<div>
						<h1>
							Fast, Smart, Secure <br /> Online Exams for Everyone
						</h1>

						<p>ThinkFast helps you conduct efficient,smooth & secure
							online exams - anytime,anywhere.</p>
					</div>

					<div class="characters">
						<%
							String basePath = request.getContextPath();
						%>
						<img src="<%=basePath%>/images/login-boy.png" alt="Boy" /> <img
							src="<%=basePath%>/images/login-girl.png" alt="Girl" />
					</div>
				</div>
			</div>

			<div class="right-panel">
				<div class="logo">
					<div class="circle">TF</div>
					<span>ThinkFast</span>
				</div>
				<h2>Welcome Back</h2>
				<p class="sub-text">Please Login to Your Account</p>

				<div class="login-box">
					<div class="tab-buttons">
						<button type="button"
							class="tab-btn <%="student".equals(selectedRole) ? "active" : ""%>"
							onclick="location.href='login.jsp?role=student'">Student</button>
						<button type="button"
							class="tab-btn <%="admin".equals(selectedRole) ? "active" : ""%>"
							onclick="location.href='login.jsp?role=admin'">Admin</button>
					</div>

					<%
						String messageRemark = (String) session
								.getAttribute("messageRemark");
						String messageClass = (String) session.getAttribute("messageClass");

						if (messageRemark != null) {
					%>
					<div class="<%=messageClass%>"><%=messageRemark%></div>
					<%
						session.removeAttribute("messageRemark");
							session.removeAttribute("messageClass");
						}
					%>

					<!-- STUDENT FORM -->
					<form method="POST" action="finallogin.jsp" id="student"
						class="form-container <%="student".equals(selectedRole) ? "active" : ""%>">
						<input type="hidden" name="role" value="student" /> <input
							type="email" id="student-email" name="email"
							placeholder="Student Email" required /> <input type="password"
							id="student-password" name="password"
							placeholder="Student Password" required />
						<button type="submit" class="login-btn">Login as Student</button>
					</form>

					<!-- ADMIN FORM -->
					<form method="POST" action="finallogin.jsp" id="admin"
						class="form-container <%="admin".equals(selectedRole) ? "active" : ""%>">
						<input type="hidden" name="role" value="admin" /> <input
							type="email" id="admin-email" name="email"
							placeholder="Admin Email" required /> <input type="password"
							id="admin-password" name="password" placeholder="Admin Password" required />
						<button type="submit" class="login-btn">Login as Admin</button>
					</form>

					<p class="signup">
						Don't have an account? <a href="register.jsp">Signup</a>
					</p>

				</div>
			</div>
		</div>
	</div>


</body>


</html>