<c:if test="${thisStaff != null}">
	<div class="modal fade" id='modal-reserve-room'>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Please Fill the Reservation's Form.</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="reserve" accept-charset="UTF-8" id="form-reservation">
						<input type="hidden" id="input-reserve-usage-id" name="usageId" value="0" />
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
									<td align="left"><a style="color:red;cursor: pointer;" id="a-reservation-cancel" hidden="">Cancel the Reservation</a></td>
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
			renderReservationModal(room, false);
		});
		/* #input-reserve-start, #input-reserve-end : Any time Start-End time was Changed then this listener will Perform Time's Validator Logic.*/
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
 		/* .btn-m-reserve : Listening Action Button for make Editing on Each [My] Reservation Row.*/
 		$("#table-my-reserve tbody").on("click", "tr .btn-m-reserve-edit", function(evt){
 			console.log(mReserveTable.row($(this).parents("tr")).data());
 			renderReservationModal(mReserveTable.row($(this).parents("tr")).data(), true);
 		});
		/* #modal-reserve-room on hidden.bs.modal : Clear Temporary Data on Reservation's Dialog. */
 		$("#modal-reserve-room").on("hidden.bs.modal",function(){
 			$("input[id^=input-reserve], textarea[id^=input-reserve]").val("");
 			$("#input-reserve-usage-id").val("0");
 		});
		
 		/* [Edit Mode] #a-reservation-cencel : Listening Delete action on Selected Resrvation. */
 		$("#a-reservation-cancel").click(function(){
 			var usageId = $("#input-reserve-usage-id").val();
 			console.log(usageId);
 			if(confirm("This Reservation will be Remove from the System, would you like to Continue?")){
 				$.ajax({
 				"type" : "post",
 				"url" : "manageReservation/delete",
 				"data" : {usageId : usageId},
 				"success" : function(result){
 					if(result){
 						alert("This Reservation is Canceled Successfuly.")
 						setUpMyReservationTable(rooms);
 						$("#modal-reserve-room").modal("hide");
 					}
 				}
 			});}
 		});
	</script>
	<script>
		/** Reservation Insert/Dialog's Functions **/
		/* renderReservationModal : This Function will Manage about how Reservation's Modal will be Operate on Reserve Mode or Editor Mode. */
		function renderReservationModal(room, isEditMode){
			if(isEditMode){
				$("#form-reservation").attr("action", "modify");
				$("#a-reservation-cancel").prop("hidden", false);
				$("#input-reserve-usage-id").val(room.usageId);
				$("#input-reserve-date").val(room.reservedDate);
				$("#input-reserve-start").val(room.accessBegin);
				$("#input-reserve-end").val(room.accessUntil);
				$("#input-reserve-purpose").val(room.purpose);
				$("#input-reserve-note").val(room.note);
				// Facilities Things Here!.
			} else {
				$("#form-reservation").attr("action", "reserve");
				$("#a-reservation-cancel").prop("hidden", true);
			}
			$("#i-room-name").html(((room.roomName==undefined?room.room.roomName:room.roomName)+(room.roomCode==null?"":(" &nbsp;("+room.roomCode+")"))));
			$("#input-reserve-room-id").val(room.roomId);
			$("#input-reserve-staff-id").val("${thisStaff.staffId}");
			$("#modal-reserve-room").modal();
		}
	</script>
</c:if>