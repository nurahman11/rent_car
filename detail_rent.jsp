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
			<% 
                ResultSet rs_adv;
                String kode = request.getParameter("rent");
                String query = "SELECT a.kode_iklan, a.judul, b.username, c.nama_kendaraan, e.nama_provinsi, a.harga_sewa_per_jam, a.harga_sewa_per_hari, a.harga_sewa_per_minggu, a.harga_sewa_per_bulan, a.gambar, a.tanggal_post, CONVERT(VARCHAR(12),a.tanggal_post,106) AS tanggal_post_out, d.nama_jenis_kendaraan, a.include_driver, a.telepon, a.alamat ";
                query += "FROM TrIklan a ";
                query += "JOIN MsCustomer b ON a.username=b.username ";
                query += "JOIN MsKendaraan c ON a.kode_kendaraan=c.kode_kendaraan ";
                query += "JOIN MsJenisKendaraan d ON c.kode_jenis_kendaraan=d.kode_jenis_kendaraan ";
                query += "JOIN MsProvinsi e ON a.kode_provinsi=e.kode_provinsi ";
                query += "WHERE a.kode_iklan = "+kode+" AND a.status=1";
                rs_adv = stmt.executeQuery(query);
            %>
            
			<%
                int num_row=0;
                if(rs_adv.next()){
                num_row++;
					if(session.getAttribute("username") != null){
						if(session.getAttribute("username").equals(rs_adv.getString("username"))){
            %>
        	<div class="col-md-12" style="margin-bottom:20px;">	
            	<a href="dodeletead.jsp?rent=<%=rs_adv.getString("kode_iklan")%>" onclick="return confirm('Are you sure you want to delete this ad ?')"><button class="btn btn-danger"><i class="icon-remove" style="color:white"></i>&nbsp;Delete This Ad</button></a>
            </div>
            <%
						}
					}
			%>
            <div class="col-md-12">
            	<div class="row">
                        <div class="col-md-7">
                        	<div class="row">
                            	<div class="col-md-12">
                                	<h3><b><%=rs_adv.getString("judul")%></b></h3>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Type</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: <%=rs_adv.getString("nama_jenis_kendaraan")%></h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Location</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: <%=rs_adv.getString("nama_provinsi")%></h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Price per hour</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: 
									<% 
										String harga = rs_adv.getString("harga_sewa_per_jam"); 
										if(harga.equals("0")){	
											out.print("N/A");
										}else{
											out.print("Rp. "+harga);
										}
									%>
                                    </h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Price per day</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: 
									<% 
										harga = rs_adv.getString("harga_sewa_per_hari"); 
										if(harga.equals("0")){	
											out.print("N/A");
										}else{
											out.print("Rp. "+harga);
										}
									%>
                                    </h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Price per week</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: 
									<% 
										harga = rs_adv.getString("harga_sewa_per_minggu"); 
										if(harga.equals("0")){	
											out.print("N/A");
										}else{
											out.print("Rp. "+harga);
										}
									%></h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Price per month</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: 
									<% 
										harga = rs_adv.getString("harga_sewa_per_bulan"); 
										if(harga.equals("0")){	
											out.print("N/A");
										}else{
											out.print("Rp. "+harga);
										}
									%></h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Driver Available</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: 
										<% 
											if(rs_adv.getString("include_driver").equals("0")){
												out.print("No");
											}else{
												out.print("Yes");
											}
										%>
                                    </h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Phone</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: <%=rs_adv.getString("telepon")%></h4>
                                </div>
                            </div>
                        	<div class="row">
                            	<div class="col-md-3">
                                	<h4>Address</h4>
                                </div>
                            	<div class="col-md-9">
                                	<h4>: <%=rs_adv.getString("alamat")%></h4>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5">
                        	<h6>&nbsp;</h6>
                            <div class="thumbnail xxx">
                                <img src="img/upload/<%=rs_adv.getString("gambar")%>"/>  
                            </div>
                        </div>
                </div>
            </div>
			<%
                }
				if(num_row == 0){
            %>
            	<div class="col-md-12" style="text-align:center">
                	<h3 style="border:1px #CCCCCC solid; padding:20px 0px; border-radius:5px">Not Found</h3>
                </div>
            <%
				}
			%>
        </div>
    </div>
	<%@include file="footer.jsp" %> 
    <script src="js/jquery-2.1.1.js"></script>
	<script src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>
