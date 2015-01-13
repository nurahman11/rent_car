<%@include file="../connect.jsp" %>
<%
	try{
		String query = "UPDATE MsKendaraan SET nama_kendaraan = '"+request.getParameter("car_name")+"', kode_jenis_kendaraan = '"+request.getParameter("car_type")+"', kapasitas = "+request.getParameter("capacity")+", transmisi = '"+request.getParameter("trans")+"' WHERE kode_kendaraan = '"+request.getParameter("kode")+"'";
		stmt.executeUpdate(query);
		response.sendRedirect("car.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>