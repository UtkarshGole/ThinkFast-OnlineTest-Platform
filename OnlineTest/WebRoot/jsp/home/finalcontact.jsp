<%@ page import="com.online.jdbc.dao.ContactsDao" %>
<%@ page import="com.online.jdbc.dto.ContactsDto" %>
<%@ page import="com.online.jdbc.exception.DBException" %>
<%@ page errorPage="error.jsp" %>

<jsp:useBean id="contact" class="com.online.jdbc.dto.ContactsDto" scope="request" />
<jsp:setProperty property="*" name="contact" />

<%
    ContactsDto dto = (ContactsDto) request.getAttribute("contact");

    try {
        ContactsDao.insertContact(dto); // Insert into DB

        // Set success message
        request.setAttribute("msg", "Thank you! Your message has been sent.");

        // Forward back to contact page
        RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
        rd.forward(request, response);

    } catch (DBException e) {
        e.printStackTrace();
        request.setAttribute("errorMsg", "Unable to send response at this time!");
        RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
        rd.forward(request, response);
    }
%>
