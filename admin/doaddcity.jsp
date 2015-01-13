<%@include file="../connect.jsp" %>
<%
	String query = "INSERT INTO MsProvinsi VALUES('"+request.getParameter("code")+"','"+request.getParameter("city")+"')";
	stmt.executeUpdate(query);
	response.sendRedirect("city.jsp");
%>