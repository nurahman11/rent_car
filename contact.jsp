<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Random</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%@include file="navbar.jsp" %>
    
    <!-- Form --><br/><br/><br/>
    <div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<h2>Contact</h2>
                <hr/>
                <form class="form-horizontal" action="doinsertfeedback.jsp" autocomplete="off" id="frmContact" name="frmContact" method="post">
                <%
					if(request.getParameter("msg") != null){
						if(request.getParameter("msg").equals("insert_success")){
				%>
                	<div class="form-group">
                    	<label for="title" class="col-sm-2 control-label"></label>
                        <div class="col-sm-6">
	                        <div class="alert alert-success" role="alert">Successfully sent your message, thank you for your feedback</div>
                        </div>
                    </div>
               	<%
						}
					}
                 %>
                	<div class="form-group">
                    	<label for="name" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-6">
	                        <input type="text" class="form-control" name="nama" id="nama" placeholder="Enter name..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="email" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-6">
	                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter email..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="message" class="col-sm-2 control-label">Message</label>
                        <div class="col-sm-6">
	                        <textarea rows="3" class="form-control" name="message" id="message" placeholder="Enter message..."></textarea>
                        </div>
                    </div>
                	<div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                        	<button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </form>
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
			$('#frmContact').bootstrapValidator({
				feedbackIcons: {
					valid: 'glyphicon glyphicon-ok',
					invalid: 'glyphicon glyphicon-remove',
					validating: 'glyphicon glyphicon-refresh'
				},
				fields: {
					nama: {
						validators: {
							notEmpty: {
								message: 'Name is required'
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
					message: {
						validators: {
							notEmpty: {
								message: 'Message is required'
							}
						}
					}
				}
			});
		});

	</script>
</body>
</html>
