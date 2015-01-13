
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
            	<h2>Create Ad</h2><hr/>
                <%
				if(session.getAttribute("username") == null){
				%>
                	<h3>You must be logged in to create ad. Click <a href="login.jsp">here</a> to login</h3>
                <%
				}
				else{
				%>
                <form class="form-horizontal" action="docreatead.jsp" method="post" id="frmSignUp" enctype="multipart/form-data" autocomplete="off">
                <%
					if(request.getParameter("msg") != null){
						if(request.getParameter("msg").equals("success")){
				%>
                	<div class="form-group">
                    	<label for="title" class="col-sm-2 control-label"></label>
                        <div class="col-sm-6">
	                        <div class="alert alert-success" role="alert">Successfully create new ad, your ad will be displayed after finished all your transaction</div>
                        </div>
                    </div>
               	<%
						}
					}
					else{
						if(session.getAttribute("username") != null){
							ResultSet rs_limit;
							String query = "SELECT COUNT(kode_iklan) AS jml_iklan, c.max_posting FROM TrIklan a JOIN MsCustomer b ON a.username=b.username JOIN MsPaket c ON b.kode_paket=c.kode_paket WHERE a.username = '"+session.getAttribute("username")+"' GROUP BY max_posting";
							rs_limit = stmt.executeQuery(query);
							if(rs_limit.next()){
								if(Integer.parseInt(rs_limit.getString("jml_iklan")) >= Integer.parseInt(rs_limit.getString("max_posting"))){
				%>
                	<div class="form-group">
                    	<label for="title" class="col-sm-2 control-label"></label>
                        <div class="col-sm-6">
	                        <div class="alert alert-danger" role="alert">You have exceeded your posting limit, please upgrade your package</div>
                        </div>
                    </div>
                <%
								}
							}
						}
					}
				%>
                	<div class="form-group">
                    	<label for="title" class="col-sm-2 control-label">Title</label>
                        <div class="col-sm-6">
	                        <input type="text" id="title" name="title" class="form-control" placeholder="Enter title..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="car" class="col-sm-2 control-label">Car</label>
                        <div class="col-sm-6">
	                        <select class="form-control" name="car" id="car">
                            	<option value="">Choose Car</option>
                            	<% 
            						ResultSet rs;
    	       						rs = stmt.executeQuery("SELECT * FROM MsKendaraan ORDER BY nama_kendaraan ASC");
									while ( rs.next() ) {
								%>
                            	<option value="<%=rs.getString("kode_kendaraan")%>"><%=rs.getString("nama_kendaraan")%></option>
                                <%
									}
								%>
                            </select>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="city" class="col-sm-2 control-label">City</label>
                        <div class="col-sm-6">
	                        <select class="form-control" name="city" id="city">
                            	<option value="">Choose City</option>
                            	<% 
    	       						rs = stmt.executeQuery("SELECT * FROM MsProvinsi ORDER BY nama_provinsi ASC");
									while ( rs.next() ) {
								%>
                            	<option value="<%=rs.getString("kode_provinsi")%>"><%=rs.getString("nama_provinsi")%></option>
                                <%
									}
								%>
                            </select>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="harga_per_jam" class="col-sm-2 control-label">Price Per Hour</label>
                        <div class="col-sm-6">
	                        <input type="text" id="harga_per_jam" name="harga_per_jam" class="form-control" placeholder="Enter Price..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="harga_per_hari" class="col-sm-2 control-label">Price Per Day</label>
                        <div class="col-sm-6">
	                        <input type="text" id="harga_per_hari" name="harga_per_hari" class="form-control" placeholder="Enter Price..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="harga_per_minggu" class="col-sm-2 control-label">Price Per Week</label>
                        <div class="col-sm-6">
	                        <input type="text" id="harga_per_minggu" name="harga_per_minggu" class="form-control" placeholder="Enter Price..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="harga_per_bulan" class="col-sm-2 control-label">Price Per Month	</label>
                        <div class="col-sm-6">
	                        <input type="text" id="harga_per_bulan" name="harga_per_bulan" class="form-control" placeholder="Enter Price..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="driver" class="col-sm-2 control-label">Driver available</label>
                        <div class="col-sm-6">
	                        <label class="radio-inline">
                            	<input type="radio" value="1" name="driver" id="driver" checked="checked" /> Yes
                            </label>
	                        <label class="radio-inline">
                            	<input type="radio" value="0" name="driver" id="driver" /> No
                            </label>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="company" class="col-sm-2 control-label">Company</label>
                        <div class="col-sm-6">
	                        <input type="text" id="company" name="company" class="form-control" placeholder="Enter Company..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="phone" class="col-sm-2 control-label">Phone</label>
                        <div class="col-sm-6">
	                        <input type="text" id="telepon" name="telepon" class="form-control" placeholder="Enter Phone..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="phone" class="col-sm-2 control-label">Address</label>
                        <div class="col-sm-6">
	                        <textarea id="alamat" name="alamat" class="form-control no_resize" placeholder="Enter Address..."></textarea>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="img1" class="col-sm-2 control-label">Image</label>
                        <div class="col-sm-6">
	                        <input type="file" id="img1" name="img1" class="filestyle" data-icon="false">
                        </div>
                    </div>
                    <%
						if(session.getAttribute("username") != null){
								ResultSet rs_limit;
								String query = "SELECT COUNT(a.kode_iklan) AS jml_iklan, SUM(c.max_posting) AS max_posting FROM MsCustomer b LEFT JOIN MsPaket c ON b.kode_paket=c.kode_paket LEFT JOIN TrIklan a ON a.username=b.username WHERE b.username = '"+session.getAttribute("username")+"'";
								rs_limit = stmt.executeQuery(query);								
								if(rs_limit.next()){
									if(Integer.parseInt(rs_limit.getString("jml_iklan")) < Integer.parseInt(rs_limit.getString("max_posting"))){
									
					%>
                        <div class="form-group">
                            <div class="col-sm-6 col-sm-offset-2">
                                <button type="submit" id="btn_submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
					<%
									}
								}
							}
					%>
                </form>
                <%
				}
				%>
            </div>
        </div>
    </div> 	
	<%@include file="footer.jsp" %>       
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap-filestyle.min.js"></script>
    <script src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script>
		$(document).ready(function() {
			$(":file").filestyle({input: false});
			$('#frmSignUp').bootstrapValidator({
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					username: {
						validators: {
							notEmpty: {
								message: 'Username is required'
							},
							stringLength: {
								max: 50,
								message: 'Username must be less than 50 characters'
							},
							stringLength: {
								min: 6,
								message: 'Username must be more than 5 characters'
							}
						}
					},
					title: {
						validators: {
							notEmpty: {
								message: 'Title is required'
							}
						}
					},
					car: {
						validators: {
							notEmpty: {
								message: 'Car is required'
							}
						}
					},
					city: {
						validators: {
							notEmpty: {
								message: 'City is required'
							}
						}
					},/*
					harga_per_jam: {
						validators: {
							notEmpty: {
								message: 'Price per hour is required'
							},
							numeric: {
								message: 'Price per hour must be numeric'
							},
						}
					},
					harga_per_minggu: {
						validators: {
							notEmpty: {
								message: 'Price per week is required'
							},
							numeric: {
								message: 'Price per week must be numeric'
							},
						}
					},
					harga_per_hari: {
						validators: {
							notEmpty: {
								message: 'Price per day is required'
							},
							numeric: {
								message: 'Price per day must be numeric'
							},
						}
					},
					harga_per_bulan: {
						validators: {
							notEmpty: {
								message: 'Price per month is required'
							},
							numeric: {
								message: 'Price per month must be numeric'
							},
						}
					},*/
					telepon: {
						validators: {
							notEmpty: {
								message: 'Phone is required'
							},
						}
					},
					alamat: {
						validators: {
							notEmpty: {
								message: 'Address is required'
							},
						}
					},
					company: {
						validators: {
							notEmpty: {
								message: 'Company is required'
							},
						}
					},
					img1: {
						validators: {
							notEmpty: {
								message: 'Image is required'
							},
							file: {
								extension: 'jpeg,png,jpg',
                       			type: 'image/png,image/jpeg,image/jpg',
								maxSize: 2097152,   // 2048 * 1024
								message: 'Only jpeg / jpg / png allowed and image size no more than 2 MB'
							}
						}
					}
				}
			});
		});

	</script>
</body>
</html>
