
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
            	<h2>Member</h2><hr/>
                <div class="table-responsive">   
                    <form role="search" method="get" class="form-inline" style="margin-bottom:20px" autocomplete="off">
                        <div class="form-group">
                            <input type="text" name="q" placeholder="Search Name..." class="form-control">
                        </div>
                        <button class="btn btn-primary" type="submit">Search</button>
                    </form>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="width:4%">No</th>
                                <th>Username</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Package</th>
                                <th>Gender</th>
                                <th>Age</th>
                                <th colspan="2">Bank Acc.</th>
                                <th>Join Date</th>
                                <th>Status</th>
                            </tr>
                      	</thead>
                        <tbody>
                        	<%
								int no=0;
								ResultSet rs;
								String query = "SELECT *, CONVERT(DATE, a.tanggal_join, 103) AS tgl ";
								query += "FROM MsCustomer a LEFT JOIN MsPaket b ON a.kode_paket=b.kode_paket ";
								query += "WHERE role = 'user' ";
								if(request.getParameter("q") != null){
									if(!request.getParameter("q").equals("")){
										query += "AND nama LIKE '%"+request.getParameter("q")+"%'";
									}
								}
								query += "ORDER BY nama ASC";
								
								rs = stmt.executeQuery(query);
								if(rs.next()){
									do{
									no++;
									String user_name = rs.getString("username");
							%>
                            <tr>
                                <td align="center"><%=no%></td>
                                <td><%=user_name%></td>
                                <td><%=rs.getString("nama")%></td>
                                <td><%=rs.getString("email")%></td>
                                <td align="center"><%=rs.getString("nama_paket")%></td>
                                <td align="center" style="font-size:22px;">
									<%
										if(rs.getString("gender").equals("M"))out.print("<i class=\"icon-male\"></i>");
										else out.print("<i class=\"icon-female\"></i>");
									
									%>                                
                                </td>
                                <td align="center"><%=rs.getString("umur")%></td>
                                <td align="center"><%=rs.getString("bank")%></td>
                                <td align="left"><%=rs.getString("account_number")%></td>
                                <td align="center"><%=rs.getString("tgl")%></td>
                                <td align="center">
                           	<%
									if(rs.getString("status").equals("0")){
							%>
									<a href="dosetstatus.jsp?user=<%=user_name%>&status=1"><img src="../img/icon/pending-small.png" width="15" title="Set as Active" /></a>
                            <%
									}
									else if(rs.getString("status").equals("1")){
							%>
									<a href="dosetstatus.jsp?user=<%=user_name%>&status=2"><img src="../img/icon/yes.png" width="15" title="Set as Inactive" /></a>
                            <%
									}
									else if(rs.getString("status").equals("2")){
							%>
									<a href="dosetstatus.jsp?user=<%=user_name%>&status=1"><img src="../img/icon/not.png" width="15" title="Set as Active" /></a>
                            <%
									}
							%>
                                </td>
                            </tr>
                            <%
									}while(rs.next());
								}
								else{
							%>
                            	<td colspan="9" align="center">No Result</td>
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
