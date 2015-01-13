<%@include file="../connect.jsp" %>
<%
	String query = "DELETE FROM MsKendaraan WHERE kode_kendaraan = '"+request.getParameter("car")+"'";
	stmt.executeUpdate(query);
	response.sendRedirect("car.jsp");
%>