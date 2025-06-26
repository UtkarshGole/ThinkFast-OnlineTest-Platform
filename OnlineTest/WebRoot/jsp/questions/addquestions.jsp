<%@ include file="/jsp/home/navbar.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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


 body {
      margin: 0;
      font-family: Arial, sans-serif;
      background-color: #f4f6f8;
    }

    .create-question {
      width: 100%;
      padding: 30px 50px;
      box-sizing: border-box;
      background-color: white;
    }

    .create-question h1 {
      text-align: center;
      color: #333;
    }

    .create-question form {
      width: 100%;
    }

    .create-question div {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
    }

    h2 {
      font-size: 18px;
      margin-bottom: 10px;
      color: #007bff;
    }

    .create-question input[type="radio"] {
      margin-right: 6px;
    }

    .create-question label input[type="radio"] {
      margin-right: 4px;
    }

    .create-question input[type="submit"] {
      width: 100%;
      padding: 12px;
      font-size: 18px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .create-question input[type="submit"]:hover {
      background-color: #0056b3;
    }
    
    .finish-btn {
  display: block;
  width: 100%;
  text-align: center;
  padding: 12px;
  font-size: 18px;
  background-color: #28a745; /* green */
  color: white;
  text-decoration: none;
  border-radius: 4px;
  margin-top: 20px;
  box-sizing: border-box;
}

.finish-btn:hover {
  background-color: #218838;
}
    
</style>
<body>

      	<!-- *HERO SECTION OR CENTER SECTION =================================================-->

	<div class="hero-section">
		<div class="hero-text" data-aos="fade-right" data-aos-once="false">
			<p class="tagline">Available Exams</p>
			<h1>
			   Add New Question in <br /> <span> in 
					${topic}</span>
			</h1>
			<a href="#" class="hero-btn"><span>Unlock Success</span> </a>

		</div>
		<div class="hero-image">

			<img src="<%=basePath%>/images/selectexam-banner.png"
				alt="Available Exam Banner">
		</div>
	</div>
	
	
        <div class="create-question">
             <h1>Add New Question in : ${topic}</h1> <br>
         <form action="http://localhost:8080/OnlineTest/jsp/questions/finaladdquestions.jsp" method="post">
             <div>
                <label for="que">Question Title: </label>
                <input type="text" name="que" id="que" required />
             </div>
             
             <div>
                <label for="a">Option 1: </label>
                <input type="text" name="a" id="a" required />
             </div>
             
             <div>
                <label for="b">Option 2: </label>
                <input type="text" name="b" id="b" required />
             </div>
             
             <div>
                <label for="c">Option 3: </label>
                <input type="text" name="c" id="c" required />
             </div>
                                                     
             <div>
                <label for="d">Option 4: </label>
                <input type="text" name="d" id="d" required />
             </div>
             
             <div>
                  <h2>Choose Correct Option</h2>
                  <div>
                      <label><input type="radio" name="answer" value="A" />Option 1</label>
                      <label><input type="radio" name="answer" value="B" />Option 2</label>
                      <label><input type="radio" name="answer" value="C" />Option 3</label>
                      <label><input type="radio" name="answer" value="D" />Option 4</label>
                  </div>
             </div>
             
             <div>
                  <input type="submit" value="Add Question"/>
             </div>
         </form>
         
         <a href="/OnlineTest/jsp/exams/insertexams.jsp" class="finish-btn">Finish</a>
        </div>
     
     <%@ include file="/jsp/home/footer.jsp" %>
</body>
</html>