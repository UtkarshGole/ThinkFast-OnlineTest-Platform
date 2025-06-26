<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  
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
												
												
											/* DELETE EXAM SECTION */
.delete-card {
    background-color: #f5f7fc;
    max-width: 90%;
    margin: 4rem auto;
    padding: 2rem 3rem;
    border-radius: 1rem;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    border: 2px solid #e0e5f5;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.delete-card h1 {
    font-size: 3rem;
    margin-bottom: 1.5rem;
    color: #303f9f;
    text-align: center;
}

.delete-card select {
    width: 100%;
    padding: 1rem;
    font-size: 1.3rem;
    border-radius: 0.6rem;
    border: 1px solid #ccc;
    margin-bottom: 1.5rem;
    background-color: #fff;
}

.delete-card input[type="submit"] {
    display: block;
    width: 100%;
    padding: 1rem;
    font-size: 1.3rem;
    font-weight: bold;
    color: white;
    background: linear-gradient(#4646e8, #060640);
    border: none;
    border-radius: 0.6rem;
    cursor: pointer;
    transition: background 0.4s ease;
}

.delete-card input[type="submit"]:hover {
    background: #3a3ac8;
}
										

  </style>

</head>
<body>
   <%@ include file="/jsp/home/navbar.jsp" %>
   <%
      ArrayList<ExamsDto> list = ExamsDao.selectAllExams();
      pageContext.setAttribute("list",list,1);
   %>
   
   <!-- *HERO SECTION OR CENTER SECTION =================================================-->

											<div class="hero-section">
												<div class="hero-text" data-aos="fade-right" data-aos-once="false">
													<p class="tagline">View Results</p>
													<h1>
														Remove Your <br /> <span>Exam</span>
													</h1>
													<a href="#" class="hero-btn"><span>Unlock Success</span> </a>

												</div>
												<div class="hero-image">

													<img src="<%=basePath%>/images/selectexam-banner.png"
														alt="Available Exam Banner">
												</div>
											</div>
   
   
               <div class="delete-card"> 
                       <h1>Select Exam to Remove</h1>
   <form action="finaldeleteexams.jsp" method="post" >
          <select name="examid">
          <c:forEach items="${list}" var="e">
             <option value="${e.examid}" value="examid" >E${e.examid} - ${e.topic} (${e.level})</option>
          </c:forEach>
          </select>
          <input type="submit" value="Remove Test" />
   </form>
               </div>
               
    <%@ include file="/jsp/home/footer.jsp" %>
</body>
</html>