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
								<div class="span6">
									<fieldset>
										<legend>Wipe Reservation Data <a href="javascript:alert('Wipe old reservation data from the System.\n\n *If you want to wipe ENTIRELY data \(Present Reservation and Upcoming Reservation\), then check \'Include Now and Future\' option. ');">[?]</a></legend>
										<table>
											<tr>
												<td valign="bottom">
													<div class="form-group">
														<label>Please Enter a Confirm Word Below</label>
														<input type="text" maxlength="21"  placeholder="WIPE_RESERVATION_DATA" id="input-empty-reservation-confword"/>
													</div>
												</td>
												<td valign="baseline"><br/><div class="form-group">&emsp;<input type="button" class="btn btn-danger" value="Wipe" id="btn-reservation-wipe" disabled="disabled" /></div></td>
											<tr>	
												<td colspan="2"><input type="checkbox" id="chkbox-upcomming-include" /> : Include Now and Future</td>
											</tr>
										</table>
									</fieldset>
									<script>
									/* #input-empty-reservation-confword : Confirm word validator */
									$("#input-empty-reservation-confword").keyup(function(){
										console.log($(this).val());
										$("#btn-reservation-wipe").prop("disabled", true);
										if($(this).val()=="WIPE_RESERVATION_DATA"){$("#btn-reservation-wipe").prop("disabled", false);}
									});
									
									/* #btn-reservation-wipe : Listening wipe action click */
									$("#btn-reservation-wipe").click(function(){
											var isUpcommingInclude = $("#chkbox-upcomming-include").prop("checked");
											if(!confirm("Please confirm this action, click OK to continue or not to cancel the action.")){return;}
											$.ajax({
												"type" : "post",
												"url" : "manageReservation/empty",
												"data" : {isUpcommingInclude : isUpcommingInclude},
												"success" : function(noResult){
														alert("Your Action is Executed.");
												}
											});
										});
									</script>
								</div>
								<div class="span6">	
									<hr/>
									<fieldset>
										<legend>Administrator Permission</legend>
									<table class="table table-responsive">
										<tbody>
											<tr>
												<td><input id="input-ap-staff-id" type="text" placeholder="Staff ID"/><br/><i id="i-ap-message"></i></td>
												<td><button class="btn btn-info" id="btn-ap-grant" data-option="g">Grant</button> </td>
												<td><button class="btn btn-danger" id="btn-ap-revoke" data-option="r">Revoke</button></td>
											</tr>
										</tbody>
									</table>
									</fieldset>
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