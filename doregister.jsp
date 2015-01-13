<%@include file="connect.jsp" %>
<%
	String username = request.getParameter("username");
	String names = request.getParameter("names");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String packages = request.getParameter("packages");
	String bank = request.getParameter("bank");
	String account = request.getParameter("account");
	java.sql.Timestamp sqlNow = new java.sql.Timestamp(new java.util.Date().getTime());
	try{
		stmt.executeUpdate("INSERT INTO MsCustomer VALUES('"+username+"','"+password+"','"+names+"','"+email+"','"+packages+"','"+gender+"',"+age+",'user','"+sqlNow+"',0,'"+bank+"','"+account+"')");		
		response.sendRedirect("register_success.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>