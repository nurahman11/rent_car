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
            	<h2>Edit Car</h2><hr/>
                <form class="form-horizontal" action="doeditcar.jsp" method="post" id="frmSignUp" autocomplete="off">
                	<%
						String query = "SELECT * FROM MsKendaraan WHERE kode_kendaraan = '"+request.getParameter("car")+"'";
						ResultSet rs_car = st.executeQuery(query);
						if(rs_car.next()){
							String kode_car = rs_car.getString("kode_kendaraan");
					%>
                	<div class="form-group">
                    	<label for="code" class="col-sm-2 control-label">Code</label>
                        <div class="col-sm-6">
	                        <input type="text" value="<%=kode_car%>" id="code" disabled="disabled" name="code" class="form-control" placeholder="Enter code..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="car_name" class="col-sm-2 control-label">Car name</label>
                        <div class="col-sm-6">
	                        <input type="text" value="<%=rs_car.getString("nama_kendaraan")%>" id="car_name" name="car_name" class="form-control" placeholder="Enter car name..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="car_type" class="col-sm-2 control-label">Car Type</label>
                        <div class="col-sm-3">
	                        <select id="car_type" name="car_type" class="form-control">
                            	<option value="">Choose Car Type</option>
                            	<% 
									String kode = rs_car.getString("kode_jenis_kendaraan");
    	       						ResultSet rs = stmt.executeQuery("SELECT * FROM MsJenisKendaraan ORDER BY kode_jenis_kendaraan ASC");
									while ( rs.next() ) {
								%>
                            	<option <% if(kode.equals(rs.getString("kode_jenis_kendaraan"))){ %> selected="selected" <% } %> value="<%=rs.getString("kode_jenis_kendaraan")%>"><%=rs.getString("nama_jenis_kendaraan")%></option>
                                <%
									}
								%>
                            </select>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="trans" class="col-sm-2 control-label">Transmission</label>
                        <div class="col-sm-3">
	                        <select id="trans" name="trans" class="form-control">
                            	<option value="">Choose Transmission</option>
                            	<option <% if(rs_car.getString("transmisi").equals("AT")){ %> selected="selected" <% } %> value="AT">Automatic</option>
                            	<option <% if(rs_car.getString("transmisi").equals("MT")){ %> selected="selected" <% } %> value="MT">Manual</option>
                            </select>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="capacity" class="col-sm-2 control-label">Capacity</label>
                        <div class="col-sm-2">
	                        <input type="text" value="<%=rs_car.getString("kapasitas")%>" id="capacity" name="capacity" class="form-control" placeholder="Enter Capacity..." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                            <button type="submit" id="btn_submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                    <input type="hidden" id="kode" name="kode" value="<%=kode_car%>"/>
                    <%
						}
					%>
                </form>
            </div>
        </div>
    </div> 	
	<%@include file="footer.jsp" %>       
    <script src="../js/jquery-2.1.1.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-filestyle.min.js"></script>
    <script src="../bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
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
					code: {
						validators: {
							notEmpty: {
								message: 'Code is required'
							}
						}
					},
					car_name: {
						validators: {
							notEmpty: {
								message: 'Car name is required'
							}
						}
					},
					car_type: {
						validators: {
							notEmpty: {
								message: 'Car type is required'
							}
						}
					},
					trans: {
						validators: {
							notEmpty: {
								message: 'Transmission is required'
							}
						}
					},
					capacity: {
						validators: {
							notEmpty: {
								message: 'Capacity is required'
							},
							numeric: {
								message: 'Capacity must be numeric'
							}
						}
					}
				}
			});
		});

	</script>
</body>
</html>
