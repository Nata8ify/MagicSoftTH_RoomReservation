<div class="modal fade" id='modal-room-editor'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Room Editor</h4>
			</div>
			<div class="modal-body">
				<form method="post" action="updateroom">
					<input type="hidden" id="input-edit-room-id" name="roomId" />
					<table class='table table-responsive' id='table-room-edit-form'>
						<tbody>
							<tr>
								<td>Room's Code :</td>
								<td><input type="text" class="form-control"
									id="input-edit-room-code" name="roomCode" /></td>
							</tr>
							<tr>
								<td>Room's Name :</td>
								<td><input type="text" class="form-control"
									id="input-edit-room-name" name="roomName" /></td>
							</tr>
							<tr>
								<td>Building :</td>
								<td><input type="text" class="form-control"
									id="input-edit-room-building" name="building" /></td>
							</tr>
							<tr>
								<td>Floor :</td>
								<td><input type="number" class="form-control"
									id="input-edit-room-floor" name="floor" /></td>
							</tr>
							<tr>
								<td>Description :</td>
								<td><textarea class="form-control"
										id="input-edit-room-desc" name="description"></textarea></td>
							</tr>
							<tr>
								<td>Available For Reserve? :</td>
								<td><input type="checkbox" class="form-control"
									id="input-edit-room-available" name="isAvailable" /></td>
							</tr>
							<tr>
								<td>Danger Zone :</td>
								<td><input type="button" value="Delete"
									class="btn btn-danger" id="btn-edit-room-delete" /></td>
							</tr>
							<tr>
								<td></td>
								<td align="right"><input type="submit"
									class="btn btn-success" id="btn-edit-room-submit" /></td>
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
$("#btn-edit-room-delete").click(function(){
	if(confirm("This Room will be permantly deleted, Select \"YES\" to continue this action.")){
		$.post({"url" : "deleteroom",
				"data" : {roomId : $("#input-edit-room-id").val()},
				"success" : function(response){
					location.reload();
				}});
	}
});
</script>
