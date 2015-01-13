<%@include file="../connect.jsp" %>
<%
	String query = "INSERT INTO MsJenisKendaraan VALUES('"+request.getParameter("code")+"','"+request.getParameter("car_name")+"')";
	stmt.executeUpdate(query);
	response.sendRedirect("car_type.jsp");
%>