
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
            	<h2>Advert</h2><hr/>
                <div class="table-responsive">   
                    <form role="search" method="get" class="form-inline" style="margin-bottom:20px" autocomplete="off">
                        <div class="form-group">
                            <select name="status" id="status" class="form-control">
                            	<option value="">All Status</option>
                            	<option <% if(request.getParameter("status") != null){ if(request.getParameter("status").equals("0")){ %> selected="selected" <% } } %> value="0">Pending</option>
                            	<option <% if(request.getParameter("status") != null){ if(request.getParameter("status").equals("1")){ %> selected="selected" <% } } %> value="1">Active</option>
                            	<option <% if(request.getParameter("status") != null){ if(request.getParameter("status").equals("2")){ %> selected="selected" <% } } %> value="2">Inactive</option>
                            </select>
                        </div>
                        <button class="btn btn-primary" type="submit">Search</button>
                    </form>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="width:4%">No</th>
                                <th>Title</th>
                                <th>Username</th>
                                <th>Post Date</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                      	</thead>
                        <tbody>
                        	<%
								int no=0;
								ResultSet rs;
								String query = "SELECT a.*, CONVERT(VARCHAR(20),tanggal_post,13) AS tgl_post, b.nama ";
								query += "FROM TrIklan a ";
								query += "JOIN MsCustomer b ON a.username=b.username ";
								query += "JOIN MsKendaraan c ON a.kode_kendaraan=c.kode_kendaraan ";
								query += "JOIN MsJenisKendaraan d ON c.kode_jenis_kendaraan=d.kode_jenis_kendaraan ";
								query += "JOIN MsProvinsi e ON a.kode_provinsi=e.kode_provinsi ";
								query += "WHERE 1=1 ";
								if(request.getParameter("status") != null){
									if(!request.getParameter("status").equals("")){
										query += "AND a.status = "+request.getParameter("status")+"";
									}
								}
								query += "ORDER BY a.kode_iklan DESC";
								rs = stmt.executeQuery(query);
								while(rs.next()){
									no++;
									String iklan = rs.getString("kode_iklan");
							%>
                            <tr>
                                <td align="center"><%=no%></td>
                                <td><%=rs.getString("judul")%></td>
                                <td><%=rs.getString("username")%></td>
                                <td align="center"><%=rs.getString("tgl_post")%></td>
                                <td align="center">
                           	<%
									if(rs.getString("status").equals("0")){
							%>
									<img src="../img/icon/pending-small.png" width="15" title="Pending" />
                            <%
									}
									else if(rs.getString("status").equals("1")){
							%>
									<img src="../img/icon/yes.png" width="15" title="Active" />
                            <%
									}
									else if(rs.getString("status").equals("2")){
							%>
									<img src="../img/icon/not.png" width="15" title="Inactive" />
                            <%
									}
							%>
                                </td>
                                <td align="center">
                           	<%
									if(rs.getString("status").equals("0")){
							%>
									<a href="dosetadstatus.jsp?iklan=<%=iklan%>&status=1">Set as Active</a>
                            <%
									}
									else if(rs.getString("status").equals("1")){
							%>
									<a href="dosetadstatus.jsp?iklan=<%=iklan%>&status=2">Set as Inactive</a>
                            <%
									}
									else if(rs.getString("status").equals("2")){
							%>
									<a href="dosetadstatus.jsp?iklan=<%=iklan%>&status=1">Set as Active</a>
                            <%
									}
							%>
                                </td>
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
