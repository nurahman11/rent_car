<%@include file="../connect.jsp" %>
<%
	String query = "DELETE FROM MsProvinsi WHERE kode_provinsi = '"+request.getParameter("city")+"'";
	stmt.executeUpdate(query);
	response.sendRedirect("city.jsp");
%>