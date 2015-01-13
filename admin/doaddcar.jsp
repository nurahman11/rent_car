<%@include file="../connect.jsp" %>
<%
	String query = "INSERT INTO MsKendaraan VALUES('"+request.getParameter("code")+"','"+request.getParameter("car_name")+"','"+request.getParameter("car_type")+"',"+request.getParameter("capacity")+",'"+request.getParameter("trans")+"',1)";
	stmt.executeUpdate(query);
	response.sendRedirect("car.jsp");
%>