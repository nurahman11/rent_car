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
	<%@include file="carrousel.jsp" %>    
    <!-- Grid System-->
    <!---div class="container">          
        <div class="row">
        	<div class="col-md-12"><br />
            	<div class="panel panel-default">
                    <div class="panel-heading">
                        <p style="line-height:3em; text-align:justify;"><strong>Random Rent Car</strong> bla bla bla
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div---><br />
    <div class="container">          
        <div class="row">
        	<div class="col-md-4" align="center">
            	<div class="panel panel-default">
                    <div class="panel-heading">
                        <p style="line-height:3em; text-align:center;"><strong><h2>Paket Reguler</strong></h2><hr/>	
                        </p>
                        <p style="line-height:3em; text-align:center;"><strong>Maximum 5 posts</strong>
                        </p>
                        <p style="line-height:3em; text-align:center;"><strong>Rp. 500.000</strong>
                        </p>
                    </div>
                </div>
            </div>	
        	<div class="col-md-4" align="center">
            	<div class="panel panel-default">
                    <div class="panel-heading">
                        <p style="line-height:3em; text-align:center;"><strong><h2>Paket Premium</h2></strong><hr/>	
                        </p>
                        <p style="line-height:3em; text-align:center;"><strong>Maximum 15 posts</strong>
                        </p>
                        <p style="line-height:3em; text-align:center;"><strong>Rp. 1.000.000</strong>
                        </p>
                    </div>
                </div>
            </div>	
        	<div class="col-md-4" align="center">
            	<div class="panel panel-default">
                    <div class="panel-heading">
                        <p style="line-height:3em; text-align:center;"><strong><h2>Paket Pro</h2></strong><hr/>	
                        </p>
                        <p style="line-height:3em; text-align:center;"><strong>Maximum 50 posts</strong>
                        </p>
                        <p style="line-height:3em; text-align:center;"><strong>Rp. 2.000.000</strong>
                        </p>
                    </div>
                </div>
            </div>	
        </div>
    </div>
    
    <!-- font Awesome -->
    <div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="well">
                	<a href="#" title="Facebook"><i class="icon-facebook largeIcon"></i></a>
                	<a href="#" title="Twitter"><i class="icon-twitter largeIcon"></i></a>
                	<a href="#" title="Instagram"><i class="icon-instagram largeIcon"></i></a>
                	<a href="#" title="Youtube"><i class="icon-youtube largeIcon"></i></a>
                </div>
            </div>
        </div>
    </div>
   	
	<%@include file="footer.jsp" %>   
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
		$(function(){
			$('.carousel').carousel({
			  interval: 3000
			});
		});
	</script>
</body>
</html>