<%@include file="../connect.jsp" %>
<%
	String username = request.getParameter("log_user");
	String password = request.getParameter("log_pass");
	
	try{
		String query = "SELECT * FROM MsCustomer WHERE username = '"+username+"' AND password = '"+password+"' AND role = 'admin' AND status = 1";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			session.setAttribute("user_admin",rs.getString("username"));
			response.sendRedirect("member.jsp");
		}
		else{
			response.sendRedirect("index.jsp?msg=2");
		}
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>