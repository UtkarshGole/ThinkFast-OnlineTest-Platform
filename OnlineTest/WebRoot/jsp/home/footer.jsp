<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'footer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style>
	   /*Footer of the ThinkFast*/
.footer {
	background-color: #1e2a47;
	color: #e0f0ff;
	padding: 5rem 2rem;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	text-align: center;
}

.footer-logo {
	font-size: 3.5rem;
	font-weight: bold;
	font-family: 'Poppins', sans-serif;
	color: #fff;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 2rem;
}

.footer-logo i {
	font-size: 4rem;
	margin-right: 1rem;
	transform: rotate(-20deg);
}

.footer-logo span {
	letter-spacing: 2px;
}

.footer-desc {
	margin: 1.5rem 0;
	font-size: 2rem;
	max-width: 80rem;
}

.footer-copy {
	font-size: 1rem;
	padding: 1.5rem 1.5rem;
}
	</style>

  </head>
  
  <body>
    	<!--* Footer of the thinkfast -->

	<footer class="footer">
		<div class="footer-logo">
			<i class="fas fa-bolt"></i><span>ThinkFast</span>
		</div>
		<p class="footer-desc">Revolutionizing the way you test and learn
			only with ThinkFast. Take control of your learning journey today!</p>
		<a href="contact.jsp" class="blue-button"> <span><i
				class="fas fa-envelope"></i> Contact Us </span> </a>
		<p class="footer-copy">&copy 2025 ThinkFast.All right
			Reserved.Powered by ThinkFast</p>
	</footer>
  </body>
</html>
