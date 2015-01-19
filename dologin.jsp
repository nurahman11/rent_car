<%@include file="connect.jsp" %>
<%
	String username = request.getParameter("log_user");
	String password = request.getParameter("log_pass");
	
	try{
		String query = "SELECT * FROM MsCustomer WHERE username = '"+username+"' AND password = '"+password+"' AND role = 'user' AND status = 1";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			session.setAttribute("username",rs.getString("username"));
			session.setAttribute("name",rs.getString("nama"));
			session.setAttribute("company",rs.getString("company"));
			response.sendRedirect("index.jsp");
			out.print(username+rs.getRow()+password);
		}
		else{
			query = "SELECT * FROM MsCustomer WHERE username = '"+username+"' AND password = '"+password+"' AND status = 0";
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
				response.sendRedirect("login.jsp?msg=1");
			}
			else{
				response.sendRedirect("login.jsp?msg=2");
			}
		}
	}catch(Exception e){
		out.print(e.getMessage());
	}
%>