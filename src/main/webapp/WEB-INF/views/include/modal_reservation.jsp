<c:if test="${thisStaff != null}">
	<div class="modal fade" id='modal-reserve-room'>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Please Fill the Reservation's Form.</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="reserve" accept-charset="UTF-8">
						<input type="hidden" name="usageId" value="0" />
						<input type="hidden" id="input-reserve-room-id" name="roomId" />
						<input type="hidden" id="input-reserve-staff-id" name="byStaffId" />
						<p><b>Room : </b><i id="i-room-name"></i></p>
						<table class='table table-responsive' id='table-reserve-form'>
							<tbody>
								<tr>
									<td>*Date:<input type="date" class="form-control"
										id="input-reserve-date" name="reservedDate"
										required="required" /></td>
									<td>*Start:<input type="time" class="form-control"
										id="input-reserve-start" name="accessBegin" min="08:00"
										max="17:00" step="1800" required="required" /></td>
									<td>*Until:<input type="time" class="form-control"
										id="input-reserve-end" name="accessUntil" min="08:30"
										max="17:00" step="1800" required="required" /></td>
									<td><b id="b-time-validate"></b></td>
								</tr>
								<tr>
									<td>*Purpose :</td>
									<td colspan="4"><textarea class="form-control"
											id="input-reserve-purpose" name="purpose" required="required"></textarea></td>
								</tr>
								<tr>
									<td>Note (Optional) :</td>
									<td colspan="3"><textarea class="form-control"
											id="input-reserve-note" name="note"></textarea></td>
								</tr>
								<tr>
									<td></td>
									<td align="right"><input type="submit"
										class="btn btn-success" id="btn-reservation-submit" disabled /></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		/* Angular */

		/* Angular */
		
		/* #input-reserve-end, #input-reserve-start : For Converting Input Date's format and Push Spring Acceptable time's format (Not return 400 After form is Submited) */
		$("#input-reserve-end, #input-reserve-start").change(function(){
			$(this).val($(this).val()+":00");
		});
		
		/* #btn-reserve LISTENER : If Reservse was Click so this Dialog will be Fired. */
		btnReserve.click(function() {
			console.log(room);
			$("#i-room-name").html((room.roomName+(room.roomCode==null?"":(" &nbsp;("+room.roomCode+")"))));
			$("#input-reserve-room-id").val(room.roomId);
			$("#input-reserve-staff-id").val("${thisStaff.staffId}");
			$("#modal-reserve-room").modal();
		});
		$("#input-reserve-start, #input-reserve-end").change(function() {
			var btnSubmit = $("#btn-reservation-submit");
			var bTimeValidate = $("#b-time-validate");
			var start = $("#input-reserve-start");
			var end = $("#input-reserve-end");
			if (end.val() == "") {
				bTimeValidate.html("Specify end time.");
			}
			if (start.val() >= end.val()) {
				bTimeValidate.html("Start-time must before End-time.");
				btnSubmit.prop("disabled", true);
			} else {
				btnSubmit.prop("disabled", false);
			}
		});
	</script>
</c:if>