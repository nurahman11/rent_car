
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Random</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="bootstrapvalidator/dist/css/bootstrapValidator.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="connect.jsp" %>  
	<%@include file="navbar.jsp" %>    
    <!-- Form --><br /><br /><br />
    <div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<h2>Rent Car</h2><hr/>
            </div>
        	<div class="col-md-12" style="margin-bottom:20px;">	
            	<a href="add_rent.jsp"><button class="btn btn-success"><i class="icon-plus" style="color:white"></i>&nbsp;Advertise Your Car</button></a>
            </div>
            <div class="col-md-12" style="margin-bottom:20px;">
            	<form class="form-inline" role="search" autocomplete="off" method="post">
                    <input type="text" class="form-control" placeholder="Search..." name="q" value="<%if(request.getParameter("q") != null){if(!request.getParameter("q").equals("")){out.print(request.getParameter("q"));}}%>" id="q">
                    <select class="form-control" name="type" id="type">
                        <option value="">All Car Type</option>
                        <% 
                            String query = "SELECT * FROM MsJenisKendaraan";
                            ResultSet rs_type = stmt.executeQuery(query);
                            while(rs_type.next()){
                        %>
                        <option <%if(request.getParameter("type") != null){if(request.getParameter("type").equals(rs_type.getString("kode_jenis_kendaraan"))){%> selected="selected" <%}}%> value="<%=rs_type.getString("kode_jenis_kendaraan")%>"><%=rs_type.getString("nama_jenis_kendaraan")%></option>
                        <%
                            }
                        %>
                    </select>
                     <select class="form-control" name="city" id="city">
                        <option value="">All City</option>
                        <% 
                            query = "SELECT * FROM MsProvinsi ORDER BY CAST(kode_provinsi AS INTEGER) ASC";
                            ResultSet rs_prov = stmt.executeQuery(query);
                            while(rs_prov.next()){
                        %>
                        <option <%if(request.getParameter("city") != null){if(request.getParameter("city").equals(rs_prov.getString("kode_provinsi"))){%> selected="selected" <%}}%> value="<%=rs_prov.getString("kode_provinsi")%>"><%=rs_prov.getString("nama_provinsi")%></option>
                        <%
                            }
                        %>
                    </select>
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>
            <div class="col-md-12">
            	<div class="row">
                	<% 
						ResultSet rs_adv;
						query = "SELECT a.kode_iklan, a.judul, b.username, c.nama_kendaraan, e.nama_provinsi, a.gambar, a.tanggal_post, CONVERT(VARCHAR(12),a.tanggal_post,106) AS tanggal_post_out ";
						query += "FROM TrIklan a ";
						query += "JOIN MsCustomer b ON a.username=b.username ";
						query += "JOIN MsKendaraan c ON a.kode_kendaraan=c.kode_kendaraan ";
						query += "JOIN MsJenisKendaraan d ON c.kode_jenis_kendaraan=d.kode_jenis_kendaraan ";
						query += "JOIN MsProvinsi e ON a.kode_provinsi=e.kode_provinsi ";
						query += "WHERE a.status = 1 ";
						if(request.getParameter("q") != null){
							if(!request.getParameter("q").equals("")){
								query += "AND a.judul like '%"+request.getParameter("q")+"%'";
							}	
						}
						if(request.getParameter("type") != null){
							if(!request.getParameter("type").equals("")){
								query += "AND d.kode_jenis_kendaraan like '"+request.getParameter("type")+"'";
							}	
						}
						if(request.getParameter("city") != null){
							if(!request.getParameter("city").equals("")){
								query += "AND e.kode_provinsi like '"+request.getParameter("city")+"'";
							}	
						}
						query += "ORDER BY tanggal_post DESC";
						rs_adv = stmt.executeQuery(query);
						int num_row=0;
						while(rs_adv.next()){
						num_row++;
					%>
                	<a href="detail_rent.jsp?rent=<%=rs_adv.getString("kode_iklan")%>">
                        <div class="col-md-3">
                            <div class="thumbnail xxx">
                                <img src="img/upload/<%=rs_adv.getString("gambar")%>" style="height:160px" />
                                <div class="caption" style="padding-bottom:0px">
                                    <h4><%=rs_adv.getString("judul")%></h4>
                                    <p><i class="icon-map-marker" style="color:#009933; font-size:16px"></i>&nbsp;<%=rs_adv.getString("nama_provinsi")%></p>
                                    <p style="font-size:10px; color:#999999"><%=rs_adv.getString("tanggal_post_out")%></p>
                                </div>        
                            </div>
                        </div>
                 	</a>
                    <%
						}
						if(num_row == 0){
					%>
                    	<div class="col-md-12" style="text-align:center;">
                    		<h3 style="border:1px #CCCCCC solid; padding:20px 0px; border-radius:5px">No Result</h3>
                        </div>
                    <%
						}
					%>
                </div>
            </div>
        </div>
    </div>
	<%@include file="footer.jsp" %> 
    <script src="js/jquery-2.1.1.js"></script>
	<script src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
