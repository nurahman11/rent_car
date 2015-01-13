
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
            	<h2>Edit Profile</h2><hr/>
                <form class="form-horizontal" action="doeditprofile.jsp" method="post" id="frmSignUp" autocomplete="off">
                	<%
						String query = "SELECT * FROM MsCustomer WHERE username = '"+session.getAttribute("username")+"'"; 
						ResultSet rs = st.executeQuery(query);
						if(rs.next()){
					%>
                	<div class="form-group">
                    	<label for="username" class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-6">
	                        <input type="text" value="<%=rs.getString("username")%>" disabled="disabled" id="username" name="username" class="form-control" placeholder="Enter username..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="name" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-6">
	                        <input type="text" value="<%=rs.getString("nama")%>" id="names" name="names" class="form-control" placeholder="Enter name..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-6">
	                        <input type="email" value="<%=rs.getString("email")%>" id="email" name="email" class="form-control" placeholder="Enter email..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="gender" class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-6">
	                        <label class="radio-inline">
                            	<input type="radio" <% if(rs.getString("gender").equals("M")){%> checked="checked" <% } %> value="M" name="gender" id="gender" /> Male
                            </label>
	                        <label class="radio-inline">
                            	<input type="radio" <% if(rs.getString("gender").equals("F")){%> checked="checked" <% } %> value="F" name="gender" id="gender" /> Female
                            </label>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="gender" class="col-sm-2 control-label">Age</label>
                        <div class="col-sm-6">
	                        <select class="form-control" name="age" id="age">
                            	<option value="">Choose Age</option>
                            	<% 
									int i=0;
									int umur = Integer.parseInt(rs.getString("umur"));
									for(i=17; i<=60; i++){ 
								%>
                            	<option <% if(umur == i){%> selected="selected" <% } %> value="<%=i%>"><%=i%></option>
                                <%
									}
								%>
                            </select>
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="bank" class="col-sm-2 control-label">Bank Account</label>
                        <div class="col-sm-3">
	                        <select class="form-control" name="bank" id="bank">
                            	<option value="">Choose Bank</option>
                            	<% 
    	       						ResultSet rs_bank = stmt.executeQuery("SELECT * FROM MsBank");
									while ( rs_bank.next() ) {
								%>
                            	<option <% if(rs.getString("bank").equals(rs_bank.getString("kode_bank"))){%> selected="selected" <% } %> value="<%=rs_bank.getString("kode_bank")%>"><%=rs_bank.getString("nama_bank")%></option>
                                <%
									}
								%>
                            </select>
                        </div>
                        <div class="col-sm-3">
	                        <input type="text" value="<%=rs.getString("account_number")%>" id="account" name="account" class="form-control" placeholder="Enter account number..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="packages" class="col-sm-2 control-label">Package</label>
                        <div class="col-sm-6">
	                        <select class="form-control" name="packages" id="packages">
                            	<option value="">Choose Package</option>
                            	<% 
            						ResultSet rs_packet = stmt.executeQuery("SELECT * FROM MsPaket ORDER BY order_no ASC");
									while ( rs_packet.next() ) {
								%>
                            	<option <% if(rs.getString("kode_paket").equals(rs_packet.getString("kode_paket"))){%> selected="selected" <% } %> value="<%=rs_packet.getString("kode_paket")%>"><%=rs_packet.getString("nama_paket")%></option>
                                <%
									}
								%>
                            </select>
                        </div>
                    </div>
                	<div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                        	<button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                    <%
						}
					%>
                </form>
            </div>
        </div>
    </div> 	
	<%@include file="footer.jsp" %>       
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script>
		$(document).ready(function() {
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
					names: {
						validators: {
							notEmpty: {
								message: 'Name is required'
							}
						}
					},
					password: {
						validators: {
							notEmpty: {
								message: 'Password is required'
							},
							stringLength: {
								max: 50,
								message: 'Password must be less than 50 characters'
							},
							stringLength: {
								min: 6,
								message: 'Password must be more than 5 characters'
							}
						}
					},
					cpassword: {
						validators: {
							notEmpty: {
								message: 'Password Confirmation is required'
							},
							identical: {
								field: 'password',
								message: 'The password and its confirm should be same'
							},
							stringLength: {
								max: 50,
								message: 'Password confirmation must be less than 50 characters'
							},
							stringLength: {
								min: 6,
								message: 'Password confirmation must be more than 5 characters'
							}
						}
					},
					email: {
						validators: {
							notEmpty: {
								message: 'Email is required'
							}
						}
					},
					gender: {
						validators: {
							notEmpty: {
								message: 'Gender is required'
							}
						}
					},
					age: {
						validators: {
							notEmpty: {
								message: 'Age is required'
							}
						}
					},
					bank: {
						validators: {
							notEmpty: {
								message: 'Bank is required'
							}
						}
					},
					account: {
						validators: {
							notEmpty: {
								message: 'Bank Account is required'
							},
							numeric: {
								message: 'Bank Account must be numeric'
							}
						}
					},
					packages: {
						validators: {
							notEmpty: {
								message: 'Package cannot be empty'
							}
						}
					},
				}
			});
		});

	</script>
</body>
</html>
