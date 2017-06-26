<div class="modal fade" id='modal-reserve-room'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Please Fill the Reservation's Form.</h4>
			</div>
			<div class="modal-body">
				<form method="post" action="updatefacili" accept-charset="UTF-8">
					<input type="hidden" id="input-reserve-room-id" name="roomId" />
					<input type="hidden" id="input-reserve-staff-id" name="byStaffId" />
					<input type="hidden" id="input-reserve-date" name="reservedDate" />
					<table class='table table-responsive' id='table-facility-edit-form'>
						<tbody>
							<tr>
								<td>Start:</td>
								<td><input type="text" class="form-control"
									id="input-reserve-start" name="accessBegin" /></td>
							</tr>
							<tr>
								<td>End:</td>
								<td><input type="number" class="form-control"
									id="input-reserve-end" name="accessUntil" /></td>
							</tr>
							<tr>
								<td>Purpose :</td>
								<td><textarea class="form-control"
										id="input-reserve-purpose" name="purpose"></textarea></td>
							</tr>
							<tr>
								<td>Note (Optional) :</td>
								<td><textarea class="form-control"
										id="input-reserve-note" name="note"></textarea></td>
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
