
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
            	<h2>Login</h2><hr/>
                <form class="form-horizontal" action="dologin.jsp" method="post" id="frmLogin2" autocomplete="off">
                	<div class="form-group">
                    	<label for="log_user" class="col-sm-2 control-label">Username</label>
                        <div class="col-sm-6">
	                        <input type="text" id="log_user" name="log_user" class="form-control" placeholder="Enter username..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="log_pass" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-6">
	                        <input type="password" id="log_pass" name="log_pass" class="form-control" placeholder="Enter password..." />
                        </div>
                    </div>
                    <% if(request.getParameter("msg") != null){ %>
                    <div class="form-group">
                    	<div class="col-md-6 col-sm-offset-2">                        	
                            <small class="help-block" style="display:block;" data-bv-validator="notEmpty" data-bv-for="log_pass" data-bv-result="VALID">
                            <span style="color:#a94442">
                            <%
								if(request.getParameter("msg").equals("1")){
									out.print("Your Account is not activated yet");
								}
								else if(request.getParameter("msg").equals("2")){
									out.print("Invalid username or password");									
								}
							%>
                            </span>
                            </small>
                        </div>
                    </div>
                    <% } %>
                	<div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                        	<button type="submit" class="btn btn-primary">Login</button>
                        </div>
                    </div>
                	<div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                        	<label>Dont have account? sign up <a href="signup.jsp">here</a></label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div> 	
	<%@include file="footer.jsp" %> 
    <script src="js/jquery-2.1.1.js"></script>
	<script src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
    $('#frmLogin2').bootstrapValidator({
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            log_user: {
                validators: {
                    notEmpty: {
                        message: 'Username is required'
                    }
                }
            },
            log_pass: {
                validators: {
                    notEmpty: {
                        message: 'Password is required'
                    }
                }
            }
        }
    });
    </script>
</body>
</html>
