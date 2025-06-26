<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.online.jdbc.dao.ExamsDao" %>
<%@ page import="com.online.jdbc.dto.ExamsDto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>View Exams</title>
<style>

</style>

</head>
<body>
   <% 
       // Retrieve all exams from the database
       ArrayList<ExamsDto> list = ExamsDao.selectAllExams();
       pageContext.setAttribute("list",list,2);
   %>
   
   <h1>Available Exams</h1>
   
   <div>
         <table>
           <thead>
               <tr> 
                   <th> Exam Id </th>
                   <th> Topic </th>
               </tr>
           </thead>
           <tbody>
              <c:forEach items="${list}" var = "exam">
                 <tr>
                   <td>${exam.examid} </td>
                   <td>${exam.topic}  </td>
                 </tr>
              </c:forEach>
           </tbody>
         </table>
   </div>
</body>

</html>