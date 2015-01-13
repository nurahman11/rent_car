
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
            	<h2>City</h2><hr/>
                <div class="table-responsive">
                	<a href="add_city.jsp"><button class="btn btn-primary" type="submit">Add City</button></a>
                    <div style="margin-top:20px;"></div>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th style="width:4%">No</th>
                                <th>Code</th>
                                <th>City Name</th>
                                <th>Action</th>
                            </tr>
                      	</thead>
                        <tbody>
                        	<%
								int no=0;
								ResultSet rs;
								String query = "SELECT * FROM MsProvinsi";
								
								rs = stmt.executeQuery(query);
								while(rs.next()){
									no++;
									String kode = rs.getString("kode_provinsi");
							%>
                            <tr>
                                <td align="center"><%=no%></td>
                                <td align="center"><%=kode%></td>
                                <td><%=rs.getString("nama_provinsi")%></td>
                                <td align="center">
                                	<a href="editcity.jsp?city=<%=kode%>"><img src="../img/icon/edit_small.png" width="15" title="Edit Car" /></a>&nbsp;&nbsp;
                                    <a href="dodeletecity.jsp?city=<%=kode%>"><img title="Delete Car" src="../img/icon/delete_small.png" width="15"/></a></td>
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
