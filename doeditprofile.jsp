<%@include file="connect.jsp" %>
<%
	String username = (String)session.getAttribute("username");
	String names = request.getParameter("names");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String age = request.getParameter("age");
	String bank = request.getParameter("bank");
	String account = request.getParameter("account");
	String packages = request.getParameter("packages");
	try{
		stmt.executeUpdate("UPDATE MsCustomer SET nama = '"+names+"', email = '"+email+"', kode_paket = '"+packages+"', gender = '"+gender+"', umur = "+age+",bank = '"+bank+"', account_number = '"+account+"' WHERE username = '"+username+"'");		
		response.sendRedirect("profile.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>