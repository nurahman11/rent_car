<%@include file="../connect.jsp" %>
<%
	String query = "DELETE FROM MsJenisKendaraan WHERE kode_jenis_kendaraan = '"+request.getParameter("car")+"'";
	stmt.executeUpdate(query);
	response.sendRedirect("car_type.jsp");
%>