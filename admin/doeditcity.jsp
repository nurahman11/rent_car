<%@include file="../connect.jsp" %>
<%
	try{
		String query = "UPDATE MsProvinsi SET nama_provinsi = '"+request.getParameter("city")+"' WHERE kode_provinsi = '"+request.getParameter("kode")+"'";
		stmt.executeUpdate(query);
		response.sendRedirect("city.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>