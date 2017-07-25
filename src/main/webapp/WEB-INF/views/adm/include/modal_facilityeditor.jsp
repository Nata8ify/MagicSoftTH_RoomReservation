<div class="modal fade" id='modal-facility-editor' data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Facility Editor</h4>
			</div>
			<div class="modal-body">
				<form method="post" action="updatefacili" accept-charset="UTF-8">
					<input type="hidden" id="input-edit-facility-id" name="roomFacilityId" />
					<table class='table table-responsive' id='table-facility-edit-form'>
						<tbody>
							<tr>
								<td>Facility's Name:</td>
								<td><input type="text" class="form-control"
									id="input-edit-facility-name" name="facility" required /></td>
							</tr>
							<tr>
								<td>Quantity :</td>
								<td><input type="number" class="form-control"
									id="input-edit-facility-quantity" name="quantity" required /></td>
							</tr>
							<tr>
								<td>Description :</td>
								<td><textarea class="form-control"
										id="input-edit-facility-desc" name="description"></textarea></td>
							</tr>
							<tr>
								<td>Is a Device :</td>
								<td><input type="checkbox" class="form-control"
									id="input-edit-facility-device" name="isDevice" /></td>
							</tr>
							<tr>
								<td>Option <a href="javascript:alert('Option \n\nUnregister : Remove the Selected Facility from the System. Hence, a User will no longer see and reserve this facility.');">[?]</a> :</td>
								<td><input type="button" value="Unregister"
									class="btn btn-danger" id="btn-edit-facility-delete" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<input type="submit" class="btn btn-success" id="btn-edit-facility-submit" />
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$("#btn-edit-facility-delete").click(function(){
	if(confirm("This Facility will be permantly deleted, Select \"YES\" to continue this action. \n\nATTENTION! : If there are any facility's usage on a room's usage or current reservation's usage on the database, then the facility will not be unregistered. So you have to empty room's usage data which involed on this facility before unregister it'.")){
		$.post({"url" : "deletefacili",
				"data" : {facilityId : $("#input-edit-facility-id").val()},
				"success" : function(response){
					location.reload();
				}});
	}
});
</script>
