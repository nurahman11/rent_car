<%@include file="connect.jsp" %>
<%
	String rent_id = request.getParameter("rent");
	try{
		String query = "UPDATE TrIklan SET status = 2 WHERE kode_iklan = "+rent_id+"";
		stmt.executeUpdate(query);
		response.sendRedirect("rent.jsp?msg=delete_success");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>