<!-- Footer and Modal -->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <hr/>
            <p>Copyright &copy; Random.com
            </p>
        </div>
    </div>
</div>
<script src="js/jquery-2.1.1.js"></script>
<script src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
<script src="js/bootstrap.js"></script>
<script>
		$('#frmLogin').bootstrapValidator({
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