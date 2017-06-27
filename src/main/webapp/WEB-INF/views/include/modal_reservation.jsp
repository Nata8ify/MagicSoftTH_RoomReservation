<div class="modal fade" id='modal-reserve-room'>
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Please Fill the Reservation's Form.</h4>
			</div>
			<div class="modal-body">
				<form method="post" action="updatefacili" accept-charset="UTF-8">
					<input type="hidden" id="input-reserve-room-id" name="roomId" /> <input
						type="hidden" id="input-reserve-staff-id" name="byStaffId" /> <input
						type="hidden" id="input-reserve-date" name="reservedDate" />
					<table class='table table-responsive' id='table-facility-edit-form'>
						<tbody>
							<tr>
								<td>Start:<input type="time" class="form-control"
									id="input-reserve-start" name="accessBegin"  min="08:00" max="17:00" step="1800" required="required"/></td>
								<td>Until:<input type="time" class="form-control"
									id="input-reserve-end" name="accessUntil" min="08:30" max="17:00" step="1800" required="required" /></td>
								<td><b id="b-time-validate"></b></td>
							</tr>
							<tr>
								<td>Purpose :</td>
								<td colspan="3"><textarea class="form-control"
										id="input-reserve-purpose" name="purpose" required="required" ></textarea></td>
							</tr>
							<tr>
								<td>Facilities :</td>
								<td colspan="3"><textarea class="form-control"
										id="input-reserve-facilities" name="facilities"></textarea></td>
							</tr>
							<tr>
								<td>Note (Optional) :</td>
								<td colspan="3"><textarea class="form-control"
										id="input-reserve-note" name="note"></textarea></td>
							</tr>
							<tr>
								<td></td>
								<td align="right"><input type="submit"
									class="btn btn-success" id="btn-reservation-submit" disabled/></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$("#input-reserve-start, #input-reserve-end").change(function(){
		var btnSubmit = $("#btn-reservation-submit");
		var bTimeValidate = $("#b-time-validate");
		var start = $("#input-reserve-start");
		var end = $("#input-reserve-end");
		if(end.val() == ""){
			bTimeValidate.html("Specify end time.");
		}
		if(start.val() >= end.val()){
			bTimeValidate.html("Start-time must before End-time.");
			btnSubmit.prop("disabled", true);
		}else{
			btnSubmit.prop("disabled", false);
		}
	});
</script>
