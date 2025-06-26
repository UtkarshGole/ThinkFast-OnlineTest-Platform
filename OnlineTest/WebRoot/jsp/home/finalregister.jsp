<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.online.jdbc.dao.StudentsDao"%>
<%@ page import="com.online.jdbc.dto.StudentsDto"%>
<%@ page import="com.online.jdbc.dao.AdminsDao"%>
<%@ page import="com.online.jdbc.dto.AdminsDto"%>
<%@ page import="com.online.jdbc.exception.DBException"%>
<%@ page errorPage="error.jsp"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="message" value="inserted" scope="request" />
<%
	String role = request.getParameter("role");
	if ("student".equals(role)) {
%>
<jsp:useBean id="student" class="com.online.jdbc.dto.StudentsDto"
	scope="request" />
<jsp:setProperty property="*" name="student" />

<%
	int id = StudentsDao.insertStudent((StudentsDto) request
				.getAttribute("student"));

		if (id == 0) {
			session.setAttribute("messageRemark",
					"This Email Already Exists.Please Login.");
			session.setAttribute("messageClass", "message-error");
            response.sendRedirect("register.jsp?role="+role);
	} else if (id == -1) {
			session.setAttribute("messageRemark",
					"Unable to create account at this time.");
			session.setAttribute("messageClass", "message-error");
            response.sendRedirect("register.jsp?role="+role);
	} else {
			session.setAttribute("registered", "true");
			session.setAttribute("messageRemark",
					"Registration successful. Please login.");
			session.setAttribute("messageClass", "message-success");
			response.sendRedirect("login.jsp");
		}

	} else if ("admin".equals(role)) {
%>

<jsp:useBean id="admin" class="com.online.jdbc.dto.AdminsDto"
	scope="request" />
<jsp:setProperty property="*" name="admin" />

<%
	AdminsDto admins = (AdminsDto) request.getAttribute("admin");
		int id = AdminsDao.insertAdmin(
				(AdminsDto) request.getAttribute("admin"),
				request.getParameter("superEmail"),
				request.getParameter("superPassword"));
		if (id == 0) {
			session.setAttribute("messageRemark",
					"This Email Already Exists.Please Login.");
			session.setAttribute("messageClass", "message-error");
			response.sendRedirect("register.jsp?role="+role);
	} else if (id == -1) {
			session.setAttribute("messageRemark",
					"Invalid Credentials.Try Again");
			session.setAttribute("messageClass", "message-error");
            response.sendRedirect("register.jsp?role="+role);
	} else {
			session.setAttribute("registered", "true");
			session.setAttribute("messageRemark",
					"Registration successful. Please login.");
			session.setAttribute("messageClass", "message-success");
			response.sendRedirect("login.jsp?role="+role);
		}

	}
%>

