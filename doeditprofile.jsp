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
	java.sql.Timestamp sqlNow = new java.sql.Timestamp(new java.util.Date().getTime());	
	try{
		ResultSet rs = statement.executeQuery("SELECT kode_paket FROM MsCustomer a WHERE a.username = '"+session.getAttribute("username")+"'");
		rs.next();
		String last_paket = rs.getString("kode_paket");
		
		int changePacket=1;
		if(last_paket.equals(packages)){ changePacket=0; }
		String paket1 = last_paket;
		String paket2 = packages;

		stmt.executeUpdate("UPDATE MsCustomer SET nama = '"+names+"', email = '"+email+"', kode_paket = '"+packages+"', gender = '"+gender+"', umur = "+age+",bank = '"+bank+"', account_number = '"+account+"' WHERE username = '"+username+"'");		
		
		if(changePacket == 1){
			String query2 = "INSERT INTO TrNotification(notif_type,username,notification,notif_time,status) VALUES(2,'"+username+"','<b>"+username+"</b> has just changed his packages from <b>"+paket1+"</b> to <b>"+paket2+"</b>','"+sqlNow+"',0)";
			st.executeUpdate(query2);
		}
		response.sendRedirect("profile.jsp");
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>