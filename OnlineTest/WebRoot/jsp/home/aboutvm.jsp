<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ThinkFast - About Us</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="online test, ThinkFast, vision, mission">
    <meta http-equiv="description" content="About ThinkFast - Vision, Mission, and Terms & Conditions">

    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f8;
        margin: 0;
        padding: 0;
      }

      .section {
        max-width: 900px;
        margin: 50px auto;
        padding: 30px 40px;
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      }

      .section h1 {
        font-size: 28px;
        color: #2b2b2b;
        margin-bottom: 20px;
      }

      .section p {
        font-size: 16px;
        line-height: 1.6;
        color: #444;
        margin-bottom: 20px;
      }

      .section ul {
        list-style: none;
        padding-left: 0;
      }

      .section li {
        margin-bottom: 12px;
        font-size: 16px;
        color: #333;
      }

      .section li::before {
        content: '~';
        margin-right: 10px;
        color: green;
      }

      .section.terms li::before {
        content: '~';
        color: #007bff;
      }
    </style>
  </head>
  
  <body>
    <%@ include file="/jsp/home/navbar.jsp" %>

    <!-- Vision Section -->
    <div class="section">
      <h1>Vision</h1>
      <p>
        "To empower learners, educators, and organizations with a fast, smart, and adaptive online testing platform that redefines how knowledge and skills are assessed in the digital age."
      </p>
      <p>
        Think Fast aims to become a leading platform for conducting seamless, secure, and insightful online assessments. By combining intuitive design, real-time analytics, and adaptive question logic, we strive to:
      </p>
      <ul>
        <li>Enhance learning outcomes through personalized test experiences.</li>
        <li>Promote fair and efficient evaluations using advanced algorithms.</li>
        <li>Bridge the gap between traditional testing and modern digital solutions.</li>
        <li>Support continuous growth with instant feedback and detailed insights.</li>
      </ul>
      <p>
        Our vision is to create a platform where every test is more than just a score—it's a step forward in learning, development, and success.
      </p>
    </div>

    <!-- Mission Section -->
    <div class="section">
      <h1> Mission</h1>
      <p>
        Our mission is to deliver a trustworthy and innovative online examination system that simplifies test creation, enables smart evaluation, and ensures accessibility for all learners.
      </p>
      <ul>
        <li>Provide a user-friendly environment for students and administrators alike.</li>
        <li>Maintain integrity and transparency in the online assessment process.</li>
        <li>Continuously improve based on user feedback and evolving educational needs.</li>
        <li>Make digital testing accessible anytime, anywhere.</li>
      </ul>
    </div>

    <!-- Terms & Conditions Section -->
    <div class="section terms">
      <h1> Terms & Conditions</h1>
      <ul>
        <li>Users must register with accurate personal information.</li>
        <li>Sharing login credentials is strictly prohibited.</li>
        <li>Any attempt to cheat or manipulate test results will lead to disqualification.</li>
        <li>ThinkFast is not responsible for technical issues on the user's end during the test.</li>
        <li>By using this platform, you agree to our data usage and privacy policy.</li>
      </ul>
    </div>
    
    <%@ include file="/jsp/home/footer.jsp" %>
  </body>
</html>
