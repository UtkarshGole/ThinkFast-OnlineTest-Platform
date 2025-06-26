<%@ page language="java" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ThinkFast - Contact Us</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        form input, form textarea {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        form textarea {
            height: 120px;
            resize: vertical;
        }

        .submit-btn {
            background-color: #007acc;
            color: #fff;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background-color: #005b9f;
        }

        .contact-info {
            margin-top: 30px;
            font-size: 14px;
            color: #555;
            text-align: center;
        }
    </style>
</head>
<body>

    <%@ include file="/jsp/home/navbar.jsp" %>

<% 
    String success = (String) request.getAttribute("msg"); 
    String error = (String) request.getAttribute("errorMsg"); 
%>

<% if (success != null) { %>
    <div style="background-color: #d4edda; color: #155724; padding: 10px; border-radius: 6px; margin-bottom: 15px;">
        <%= success %>
    </div>
<% } else if (error != null) { %>
    <div style="background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 6px; margin-bottom: 15px;">
        <%= error %>
    </div>
<% } %>

<%-- Remove attributes after display --%>
<%
    request.removeAttribute("msg");
    request.removeAttribute("errorMsg");
%>

    
    <div class="container">
        <h1>Contact Us</h1>
        
        <form action="finalcontact.jsp" method="post">
            <label for="name">Name</label>
            <input type="text" name="name" id="name" required />

            <label for="email">Email</label>
            <input type="email" name="email" id="email" required />

            <label for="subject">Subject</label>
            <input type="text" name="subject" id="subject" required />

            <label for="message">Message</label>
            <textarea name="message" id="message" required></textarea>

            <button type="submit" class="submit-btn">Send Message</button>
        </form>

        <div class="contact-info">
            <p> Email: support@thinkfast.com</p>
            <p> Address: ThinkFast Solutions, Indore, Madhya Pradesh</p>
        </div>
    </div>
  
    <%@ include file="/jsp/home/footer.jsp" %>
</body>
</html>
