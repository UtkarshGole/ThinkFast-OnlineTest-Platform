<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dao.StudentsDao"%>
<%@ page import="com.online.jdbc.dto.StudentsDto"%>
<%@ page import="com.online.jdbc.dao.AdminsDao"%>
<%@ page import="com.online.jdbc.dto.AdminsDto"%>
<%@ page import="com.online.jdbc.exception.DBException"%>
<%@ page errorPage="error.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="message" value="login" scope="request" />

<% 
   String role=request.getParameter("role");
   
   if("student".equals(role)) {
 %>

<jsp:useBean id="student" class="com.online.jdbc.dto.StudentsDto"
	scope="request" />
<jsp:setProperty property="*" name="student" />

<%
   StudentsDto students = (StudentsDto) request.getAttribute("student");
   String sname = StudentsDao.studentLogin(students);
   if(sname != null){
      session.setAttribute("role",role);
      session.setAttribute("sname",sname);
      session.setAttribute("email",students.getEmail());
      session.setAttribute("password",students.getPassword());
      session.setAttribute("studid",StudentsDao.getId()+1);
      response.sendRedirect("home.jsp");
      return;
    }
    else {
      session.setAttribute("messageRemark","Invalid User or Password");
      session.setAttribute("messageClass","message-error");
      response.sendRedirect("login.jsp?role="+role);
      return;
   }
    
    } else if("admin".equals(role)){ 
    %>

<jsp:useBean id="admin" class="com.online.jdbc.dto.AdminsDto"
	scope="request" />
<jsp:setProperty property="*" name="admin" />

<% 
        AdminsDto admins=(AdminsDto) request.getAttribute("admin");
        String adminName = AdminsDao.adminLogin(admins);
        
        if(adminName != null){
                session.setAttribute("role",role);
      session.setAttribute("adminName",adminName);
      session.setAttribute("email",admins.getEmail());
      session.setAttribute("password",admins.getPassword());
          response.sendRedirect("home.jsp");
          return ;
          }
         else if(adminName == null){
                session.setAttribute("messageRemark", "Invalid User or Password"
                                            ); session.setAttribute("messageClass", "message-error" );
                                            response.sendRedirect("login.jsp?role="+role);
           }
       }
      %>


