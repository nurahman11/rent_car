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
            	<h2>Add Car Type</h2><hr/>
                <form class="form-horizontal" action="doaddcartype.jsp" method="post" id="frmSignUp" autocomplete="off">
                	<div class="form-group">
                    	<label for="code" class="col-sm-2 control-label">Code</label>
                        <div class="col-sm-6">
	                        <input type="text" id="code" name="code" class="form-control" placeholder="Enter code..." />
                        </div>
                    </div>
                	<div class="form-group">
                    	<label for="car_name" class="col-sm-2 control-label">Type name</label>
                        <div class="col-sm-6">
	                        <input type="text" id="car_name" name="car_name" class="form-control" placeholder="Enter car name..." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                            <button type="submit" id="btn_submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
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
					}
				}
			});
		});

	</script>
</body>
</html>
