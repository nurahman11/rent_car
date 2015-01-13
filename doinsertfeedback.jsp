<%@include file="connect.jsp" %>
<%
	String name = request.getParameter("nama");
	String email = request.getParameter("email");
	String message = request.getParameter("message");
	try{
		String query = "INSERT INTO Feedback VALUES('"+name+"','"+email+"','"+message+"')";
		stmt.executeUpdate(query);
		response.sendRedirect("contact.jsp?msg=insert_success");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>