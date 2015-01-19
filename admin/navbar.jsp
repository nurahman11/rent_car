<style type="text/css">
	#myLoginModal .modal-dialog  {width:30%;}
</style>
<script src="../js/jquery-2.1.1.js"></script>
<script src="../js/bootstrap.js"></script>
<!-- FIxed navigation bar with dropdown menu -->
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">Random.com</a>
        </div>
        <div class="navbar-collapse collapse nav">
            <ul class="nav navbar-nav">
				<% 
                    if(session.getAttribute("user_admin") != null){
                %>
                <li><a href="member.jsp">Member</a></li>
                <li><a href="advert.jsp">Advert</a></li>
                <li><a href="car.jsp">Car</a></li>
                <li><a href="car_type.jsp">Car Type</a></li>
                <li><a href="city.jsp">City</a></li>
                <li><a href="inbox.jsp">Inbox</a></li>
                <%
					ResultSet rs_notif = statement.executeQuery("SELECT COUNT(notif_id) AS notif FROM TrNotification WHERE status = 0");
					rs_notif.next();
				%>
                <li><a href="notification.jsp">Notifications <span class="badge"><%=rs_notif.getString("notif")%></span></a></li>
                <%
					}
					else{
				%>
                <li><a href="../index.jsp">Home</a></li>
                <%
					}
				%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            <% 
				if(session.getAttribute("user_admin") != null){
			%>
                <li class="dropdown">
                	<a aria-expanded="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">Admin <span class="caret"></span></a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="dologout.jsp">Logout</a></li>
                    </ul>
                </li>
            <% 	
				}
			%>
            </ul>
        </div>
    </div>
    <div class="modal fade" id="myLoginModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <strong>Login</strong>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" action="dologin.jsp" method="post" id="frmLogin" autocomplete="off">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" name="log_user" id="log_user" placeholder="Enter username..." />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" id="log_pass" name="log_pass" class="form-control" placeholder="Enter password..." />
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </form>
                </div>
            </div>
        </div>	
    </div>
</div>