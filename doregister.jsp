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
	String company = request.getParameter("company");
	java.sql.Timestamp sqlNow = new java.sql.Timestamp(new java.util.Date().getTime());
	try{
		stmt.executeUpdate("INSERT INTO MsCustomer VALUES('"+username+"','"+password+"','"+names+"','"+email+"','"+packages+"','"+gender+"',"+age+",'user','"+sqlNow+"',0,'"+company+"','"+bank+"','"+account+"')");		
		String query = "INSERT INTO TrNotification(notif_type,username,notification,notif_time,status) VALUES(1,'"+username+"','User <b>"+username+"</b> has just been registered','"+sqlNow+"',0)";
		st.executeUpdate(query);
		response.sendRedirect("index.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>