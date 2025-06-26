<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/home/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ThinkFast: Create Exam</title>
<Style>
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

body {
    background-color: #f5f7fc;
}
/* Create Exam Section*/
.create-exam {
    min-width: 600px;
    margin: 2rem auto;
    padding: 50px;
    background-color: #f3f7fc;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.create-exam h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
    font-size: 4rem;
}

.create-exam form {
    display: flex;
    flex-direction: column;
    gap: 15px;
}

.create-exam label {
    font-weight: bold;
    color: #555;
    margin-bottom: 5px;
}

.create-exam input[type="text"],
.create-exam input[type="number"],
.create-exam select,
.create-exam textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    box-sizing: border-box;
}

.create-exam input[type="text"]:focus,
.create-exam input[type="number"]:focus,
.create-exam select:focus,
.create-exam textarea:focus {
    border-color: #007bff;
    outline: none;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
}

.create-exam textarea {
    resize: vertical;
    min-height: 100px;
}

.create-exam input[type="submit"] {
    background-color: #007bff;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s;
}

.create-exam input[type="submit"]:hover {
    background-color: #0056b3;
}

@media (max-width: 480px) {
    .create-exam {
        padding: 15px;
    }

    .create-exam h1 {
        font-size: 20px;
    }

    .create-exam input[type="text"],
    .create-exam input[type="number"],
    .create-exam select,
    .create-exam textarea {
        font-size: 14px;
    }

    .create-exam input[type="submit"] {
        font-size: 14px;
        padding: 10px;
    }
}
</Style>
</head>
<body>

    <!-- *HERO SECTION OR CENTER SECTION =================================================-->

	<div class="hero-section">
		<div class="hero-text" data-aos="fade-right" data-aos-once="false">
			<p class="tagline">Create Exams</p>
			<h1>
			  <span> Create Exam </span> </br> Set Questions, Time & Details
					
			</h1>
			<a href="#" class="hero-btn"><span>Unlock Success</span> </a>

		</div>
		<div class="hero-image">

			<img src="<%=basePath%>/images/selectexam-banner.png"
				alt="Available Exam Banner">
		</div>
	</div>
	
	<!-- Create Exam Section -->
	<div class="create-exam">
	      <h1>Create New Exam</h1>
	<form action="finalinsertexams.jsp">

		<label for="topic">Topic Name:</label> <input type="text" name="topic"
			required /><br /> <label for="level">Exam Level:</label> <select
			name="level" required>
			<option value="">--Select Level--</option>
			<option value="Beginner">Beginner</option>
			<option value="Intermediate">Intermediate</option>
			<option value="Advanced">Advanced</option>
		</select> <label for="duration">Duration (in minutes): </label> <input
			type="number" name="duration" min="1" required /> <label
			for="description">Description:</label><br />
		<textarea name="description" rows="4" cols="40" required></textarea>
		</br> <input type="submit" value="Create Exam" />
	</form>
	</div>
	
	<!--  Footer Section  -->
	<%@ include file="/jsp/home/footer.jsp" %>
</body>
</html>