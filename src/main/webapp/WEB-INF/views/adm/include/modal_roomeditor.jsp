<div class="modal fade" id='modal-room-editor' hidden data-backdrop="static">
	<div class="modal-dialog">
		<form method="post" action="updateroom">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Room Editor</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="input-edit-room-id" name="roomId" />
					<table class='table table-responsive' id='table-room-edit-form'>
						<tbody>
							<tr>
								<td>Room's Code :</td>
								<td><input type="text" class="form-control"
									id="input-edit-room-code" name="roomCode" placeholder="Empty" /></td>
							</tr>
							<tr>
								<td>Room's Name :</td>
								<td><input type="text" class="form-control"
									id="input-edit-room-name" name="roomName" required /></td>
							</tr>
							<tr>
								<td>Building :</td>
								<td><input type="text" class="form-control"
									id="input-edit-room-building" name="building" required /></td>
							</tr>
							<tr>
								<td>Floor :</td>
								<td><input type="number" class="form-control"
									id="input-edit-room-floor" name="floor" required /></td>
							</tr>
							<tr>
								<td>Description :</td>
								<td><textarea class="form-control" placeholder="Empty"
										id="input-edit-room-desc" name="description"></textarea></td>
							</tr>
							<tr>
								<td>Available For Reserve? :</td>
								<td><input type="checkbox" class="form-control"
									id="input-edit-room-available" name="isAvailable" /></td>
							</tr>
							<tr>
								<td>Option <a href="javascript:alert('Option \n\nUnregister : Remove the Selected Room from the System. Hence, a User will no longer see and reserve this room');">[?]</a> :</td>
								<td><input type="button" value="Unregister"
									class="btn btn-danger" id="btn-edit-room-delete" /></td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success"
						id="btn-edit-room-submit" /> <input type="button"
						class="btn btn-default" data-dismiss="modal" value="Close" />
				</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$("#btn-edit-room-delete")
			.click(
					function() {
						if (confirm("This Room will be permantly deleted, Select \"YES\" to continue this action  \n\nATTENTION! : If there are any room's usage or current reservation on the database, then the room will not be unregistered. So you have to empty these data before unregister the room'.")) {
							$.post({
								"url" : "deleteroom",
								"data" : {
									roomId : $("#input-edit-room-id").val()
								},
								"success" : function(response) {
									location.reload();
								}
							});
						}
					});
</script>
