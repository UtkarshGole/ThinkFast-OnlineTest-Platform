<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
</head>
<body>
    <h1>Admin Login Page</h1>
    <form action="finaladminlogin.jsp" method="post">
        <label for="studid">Admin ID:</label>
        <input type="text" name="studid" id="studid" required /><br><br>
        
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required /><br><br>
        
        <input type="submit" value="LOGIN" />
    </form>
</body>
</html>
