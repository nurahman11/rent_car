
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Random</title>
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="../bootstrapvalidator/dist/css/bootstrapValidator.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="../connect.jsp" %>  
	<%@include file="navbar.jsp" %>    
    <!-- Form --><br /><br /><br />
    <div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<h2>Inbox</h2><hr/>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="width:4%">No</th>
                                <th style="width:20%">Name</th>
                                <th style="width:20%">Email</th>
                                <th>Message</th>
                            </tr>
                      	</thead>
                        <tbody>
                        	<%
								int no=0;
								ResultSet rs;
								String query = "SELECT * FROM Feedback";
								
								rs = stmt.executeQuery(query);
								while(rs.next()){
									no++;
									String kode = rs.getString("name");
							%>
                            <tr>
                                <td align="center"><%=no%></td>
                                <td align="center"><%=kode%></td>
                                <td><%=rs.getString("email")%></td>
                                <td><%=rs.getString("message")%></td>
                            </tr>
                            <%
								}
							%>
                        </tbody>
                    </table>
                    </div>
            </div>
        </div>
    </div> 	
	<%@include file="footer.jsp" %> 
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.js"></script>
</body>
</html>
