<%@include file="../connect.jsp" %>
<%
	String query = "UPDATE TrIklan SET status="+request.getParameter("status")+" WHERE kode_iklan = "+request.getParameter("iklan")+"";
	stmt.executeUpdate(query);
	response.sendRedirect("advert.jsp");
%>