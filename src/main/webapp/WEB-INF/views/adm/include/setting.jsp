<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="widget">
						<div class="widget-header">
							<i class="icon-pencil"></i>
							<h3>Application Setting</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<div class="row">
								<div class="span8">
									<table class="table table-responsive">
										<tbody>
											<tr>
												<td>Administrator Permission</td>
												<td><input id="input-ap-staff-id" type="text" placeholder="Staff ID"/><br/><i id="i-ap-message"></i></td>
												<td><button class="btn btn-info" id="btn-ap-grant" data-option="g">Grant</button> </td>
												<td><button class="btn btn-danger" id="btn-ap-revoke" data-option="r">Revoke</button></td>
											</tr>
										</tbody>
									</table>
									<script>
										$("#btn-ap-grant, #btn-ap-revoke").click(function(){
											var option = $(this).data("option");
											var $inputStaffId = $("#input-ap-staff-id");
											var $iAdminPermissionMsg = $("#i-ap-message");
											$.ajax({
												"type" : "post",
												"url" : "utils/setting/role",
												"data" : {staffId : $inputStaffId.val(), option},
												"success" : function(isSuccess) {
													if(isSuccess){
														console.log(option);
														switch(option){
															case "g" : $iAdminPermissionMsg.html("Administrator Permission is granted to "+$inputStaffId.val().toUpperCase()); break;
															case "r" : $iAdminPermissionMsg.html("Administrator Permission is revoked to "+($inputStaffId.val().toUpperCase()));
														}	
														$inputStaffId.val("");
													} else {
														alert("Staff ID is Invalid or Empty");
													}
												}
											});
										});
									</script>
								</div>
							</div>
						</div>
						<!-- /widget-content -->
					</div>
					<!-- /widget -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /main-inner -->
</div>