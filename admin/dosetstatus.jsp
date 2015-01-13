<%@include file="../connect.jsp" %>
<%
	String query = "UPDATE MsCustomer SET status="+request.getParameter("status")+" WHERE username = '"+request.getParameter("user")+"'";
	stmt.executeUpdate(query);
	response.sendRedirect("member.jsp");
%>