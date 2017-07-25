<div class="modal fade" id='modal-facility-editor' >
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
								<td>Danger Zone :</td>
								<td><input type="button" value="Delete"
									class="btn btn-danger" id="btn-edit-facility-delete" /></td>
							</tr>
							<tr>
								<td></td>
								<td align="right"><input type="submit"
									class="btn btn-success" id="btn-edit-facility-submit" /></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$("#btn-edit-facility-delete").click(function(){
	if(confirm("This Facility will be permantly deleted, Select \"YES\" to continue this action.")){
		$.post({"url" : "deletefacili",
				"data" : {facilityId : $("#input-edit-facility-id").val()},
				"success" : function(response){
					location.reload();
				}});
	}
});
</script>
