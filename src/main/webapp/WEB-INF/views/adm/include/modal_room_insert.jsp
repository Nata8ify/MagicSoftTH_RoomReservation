<div class="modal fade" id='modal-room-insert' hidden>
	<div class="modal-dialog">
		<form method='post' action="addroom" accept-charset="UTF-8">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Please Fill a Room's Detail</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" id="input-insert-room-id" name="roomId" value="0"/>
					<table class='table table-responsive' id='table-room-insert-form'>
						<tbody>
							<tr>
								<td>Room's Code :</td>
								<td><input type="text" class="form-control"
									id="input-insert-room-code" name="roomCode" placeholder="(Optional)" maxlength="10" /></td>
							</tr>
							<tr>
								<td>Room's Name :</td>
								<td><input type="text" class="form-control"
									id="input-insert-room-name" name="roomName" required maxlength="50"  placeholder="Room's Name"/></td>
							</tr>
							<tr>
								<td>Building :</td>
								<td><input type="text" class="form-control"
									id="input-insert-room-building" name="building" required maxlength="100"  placeholder="Building's Name"/></td>
							</tr>
							<tr>
								<td>Floor :</td>
								<td><input type="number" class="form-control"
									id="input-insert-room-floor" name="floor" required /></td>
							</tr>
							<tr>
								<td>Description :</td>
								<td><textarea class="form-control" placeholder="(Optional)"
										id="input-insert-room-desc" name="description" maxlength="100"  placeholder="Description (Optional)"></textarea></td>
							</tr>
							<tr>
								<td>Available For Reserve? :</td>
								<td><input type="checkbox" class="form-control"
									id="input-insert-room-available" name="isAvailable" /></td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-success"
						id="btn-insert-room-submit" /> <input type="button"
						class="btn btn-default" data-dismiss="modal" value="Close" />
				</div>
			</div>
		</form>
	</div>
</div>