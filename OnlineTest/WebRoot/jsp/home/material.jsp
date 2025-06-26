<%@ page language="java" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ThinkFast - Study Material</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 40px;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            transition: transform 0.2s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h2 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #007acc;
        }

        .card p {
            font-size: 14px;
            color: #333;
            margin-bottom: 15px;
        }

        .card a {
            text-decoration: none;
            color: #ffffff;
            background-color: #007acc;
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 14px;
        }

        .card a:hover {
            background-color: #005b9f;
        }
    </style>
</head>
<body>

    <%@ include file="/jsp/home/navbar.jsp" %>

    <div class="container">
        <h1> Study Material</h1>

        <div class="card-grid">
            <div class="card">
                <h2>Data Structures</h2>
                <p>Master arrays, stacks, queues, trees, graphs, and more with step-by-step examples and coding practice.</p>
                <a href="https://www.geeksforgeeks.org/data-structures/" target="_blank">Visit GeeksforGeeks</a>
            </div>

            <div class="card">
                <h2>Operating System</h2>
                <p>Understand processes, memory management, scheduling, file systems, and concurrency basics.</p>
                <a href="https://www.tutorialspoint.com/operating_system/index.htm" target="_blank">Visit TutorialsPoint</a>
            </div>

            <div class="card">
                <h2>DBMS</h2>
                <p>Learn about relational models, SQL, normalization, ER diagrams, and transactions with examples.</p>
                <a href="https://www.geeksforgeeks.org/dbms/" target="_blank">Visit GeeksforGeeks</a>
            </div>

            <div class="card">
                <h2>Java Programming</h2>
                <p>Explore OOP, classes, inheritance, collections, exception handling and real-world coding problems.</p>
                <a href="https://www.geeksforgeeks.org/java/" target="_blank">Visit GeeksforGeeks</a>
            </div>

            <div class="card">
                <h2>HTML</h2>
                <p>Build the structure of web pages using tags, attributes, forms, and layouts in HTML5.</p>
                <a href="https://www.w3schools.com/html/" target="_blank">Visit W3Schools</a>
            </div>

            <div class="card">
                <h2>CSS</h2>
                <p>Style your websites using colors, layouts, animations, flexbox, and responsive design in CSS3.</p>
                <a href="https://www.w3schools.com/css/" target="_blank">Visit W3Schools</a>
            </div>

            <div class="card">
                <h2>JavaScript</h2>
                <p>Make your web pages interactive with events, DOM, loops, arrays, and ES6 features.</p>
                <a href="https://www.w3schools.com/js/" target="_blank">Visit W3Schools</a>
            </div>
        </div>
    </div>
    <%@ include file="/jsp/home/footer.jsp" %>
</body>
</html>
