<%@include file="../connect.jsp" %>
<%
	try{
		String query = "UPDATE MsJenisKendaraan SET nama_jenis_kendaraan = '"+request.getParameter("car_name")+"' WHERE kode_jenis_kendaraan = '"+request.getParameter("kode")+"'";
		stmt.executeUpdate(query);
		response.sendRedirect("car_type.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>