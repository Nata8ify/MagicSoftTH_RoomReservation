<div class="modal fade" id='modal-room-editor'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Room Editor</h4>
			</div>
			<div class="modal-body">
				<form method="post" action="updateroom">
				<input type="hidden" id="input-edit-room-id" />
					<table class='table table-responsive' id='table-room-edit-form'>
						<tbody>
							<tr>
								<td>Room's Code : </td>
								<td><input type="text" class="form-control" id="input-edit-room-code" /></td>
							</tr>
							<tr>
								<td>Room's Name : </td>
								<td><input type="text" class="form-control" id="input-edit-room-name" /></td>
							</tr>
							<tr>
								<td>Building : </td>
								<td><input type="text" class="form-control" id="input-edit-room-building" /></td>
							</tr>
							<tr>
								<td>Floor : </td>
								<td><input type="number" class="form-control" id="input-edit-room-floor" /></td>
							</tr>
							<tr>
								<td>Description : </td>
								<td><textarea class="form-control" id="input-edit-room-desc" ></textarea></td>
							</tr>
							<tr>
								<td>Available For Reserve? : </td>
								<td><input type="checkbox" class="form-control" id="input-edit-room-available"  /></td>
							</tr>
							<tr>
								<td >Danger Zone : </td>
								<td><input type="button" value="Delete" class="btn btn-danger" id="btn-edit-room-delete"  /></td>
							</tr>
							<tr>
								<td></td>
								<td align="right"><input type="submit" class="btn btn-success" id="btn-edit-room-submit"  /></td>
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
