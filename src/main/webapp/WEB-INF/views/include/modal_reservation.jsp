<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:if test="${thisStaff != null}">
	<div class="modal fade" id='modal-reserve-room' data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="">&times;</button>
					<h4 class="modal-title">Please Fill the Reservation's Form.</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="reserve" accept-charset="UTF-8"
						id="form-reservation">
						<input type="hidden" id="input-reserve-usage-id" name="usageId"
							value="0" /> <input type="hidden" id="input-reserve-room-id"
							name="roomId" /> <input type="hidden"
							id="input-reserve-staff-id" name="byStaffId" />
						<p>
							<b>Room : </b><i id="i-room-name"></i>
						</p>
						
						<ul class="nav nav-tabs">
						  <li role="presentation" class="active"><a href="#tab" id="a-tab-room">Room</a></li>
						  <li role="presentation"><a href="#tab" id="a-tab-facilis">Facilities</a></li>
						</ul>
						<div class="tab-content">
							<div  id="tab-room">
								<table class='table table-responsive' id='table-reserve-form'>
									<tbody>
										<tr>
											<td colspan="4">
												<div class="row">
													<div class="col-sm-6">*Date:<input type="date" class="form-control" id="input-reserve-date" name="reservedDate" required="required" /></div>
													<div class="col-sm-3">*Start:<input type="time" class="form-control" id="input-reserve-start" name="accessBegin" min="08:00" max="17:00" step="1800" required="required"/></div>
													<div class="col-sm-3">*Until:<input type="time" class="form-control" id="input-reserve-end" name="accessUntil" min="08:30" max="17:00" step="1800" required="required"/></div>
												</div>
												<div class="row"><div class="col-sm-12"><br/><b id="b-time-validate"></b></div></div>
											</td>
										</tr>
										<tr>
											<td>*Purpose :</td>
											<td colspan="3"><textarea class="form-control"
													id="input-reserve-purpose" name="purpose" required="required" ></textarea></td>
										</tr>
										<tr>
											<td>Note (Optional) :</td>
											<td colspan="3"><textarea class="form-control"
													id="input-reserve-note" name="note" ></textarea></td>
										</tr>
										<tr>
											<td align="left"><a style="color: red; cursor: pointer;"
												id="a-reservation-cancel" hidden="">Cancel the Reservation</a></td>
											<td align="right" colspan="2"><input type="submit"
												class="btn btn-success" id="btn-reservation-submit" disabled/> <input type="button"
												class="btn" id="btn-reservation-reset-restore" value=""/></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="tab-facilis" style="display:none;"><br/>
								<table class='table table-responsive table-striped table-hover'>
									<thead>
										<tr>
											<th>Facility</th>
											<th>Quantity</th>
										</tr>
									</thead>
									<tbody id="tbody-reserve-room-facility"></tbody>
								</table>
								<script>
									/* document : Certainly the Document was Loaded the Facility's Table will Load Instatiate Data.*/
									$("document").ready(function(){
										$.ajax({
											"type" : "post",
											"url" : "facility/findAll",
											"success" : function(facilities){
												console.log(facilities);
												$.each(facilities, function(index, val){
													$("#tbody-reserve-room-facility").append("<tr><td>"+val.facility+"</td><td><input placeholder='0' class='form-control input-facilis' type='number' min='0' name='facilis$"+val.roomFacilityId+"'/></td></tr>");
												});
											} 
										});
									});
								</script>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		/* Angular */

		/* Angular */

		/* #input-reserve-end, #input-reserve-start : For Converting Input Date's format and Push Spring Acceptable time's format (Not return 400 After form is Submited) */
		$("#input-reserve-end, #input-reserve-start").change(function() {
			$(this).val($(this).val() + ":00");
		});

		/* #btn-reserve LISTENER : If Reservse was Click so this Dialog will be Fired. */
		$("#btn-reserve").click(function() {
			renderReservationModal(room, false);
		});
		/* #input-reserve-start, #input-reserve-end, #input-reserve-date : Validate Any Date and Time (Start-End) Change then this listener will Perform Time's Validator and Reservation's Validator Logic.*/
		$("#input-reserve-start, #input-reserve-end, #input-reserve-date").change(function() {
			var btnSubmit = $("#btn-reservation-submit");
			var bTimeValidate = $("#b-time-validate");
			var roomId = $("#input-reserve-room-id").val();
			var start = $("#input-reserve-start").val();
			var end = $("#input-reserve-end").val();
			var date =$("#input-reserve-date").val();
			if (end == "") {
				displayDateTimeValidatorMsg("Specify end time.", null);
			} else if (start >= end) {
				displayDateTimeValidatorMsg("End-time is Invalid.", "red");
				btnSubmit.prop("disabled", true);
			} else {
				if (start != "" && end != "" && date != ""){
					 reservationDateTimeValidator(roomId, date, start, end);
				}
				btnSubmit.prop("disabled", false);
			}
		});
		/* .btn-m-reserve : Listening Action Button for make Editing on Each [My] Reservation Row.*/
		$("#table-my-reserve tbody").on("click", "tr .btn-m-reserve-edit", function(evt) {
					console.log(mReserveTable.row($(this).parents("tr")).data());
					renderReservationModal(mReserveTable.row($(this).parents("tr")).data(), true);
		});
		/* #modal-reserve-room on hidden.bs.modal : Clear Temporary Data on Reservation's Dialog. */
		$("#modal-reserve-room").on("hidden.bs.modal", function() {
				resetReservationForm(true);
				$("#a-tab-room").click();
		});
		/* [Edit Mode] #a-reservation-cencel : Listening Delete action on Selected Resrvation. */
		$("#a-reservation-cancel").click(function() {
			var usageId = $("#input-reserve-usage-id").val();
			if (confirm("This Reservation will be Remove from the System, would you like to Continue?")) {
			$.ajax({
				"type" : "post",
				"url" : "manageReservation/delete",
				"data" : {usageId : usageId},
				"success" : function(result) {
					if (result) {
					alert("This Reservation is Canceled Successfuly.")
					setUpMyReservationTable(rooms);
					$("#modal-reserve-room").modal("hide");
				  	}
				}
			});}});
		
		/* a-tab-room, a-tab-facilis : Swap the Tap after these Selector was Clicked.*/
		$("#a-tab-room, #a-tab-facilis").click(function(){
			$("#tab-facilis").css("display", "none");
			$("#tab-room").css("display", "block");
			$("li[role='presentation']").removeClass("active");
			$(this).parent("li").addClass("active");
		});
		$("#a-tab-facilis").click(function(){
			$("#tab-room").css("display", "none");
			$("#tab-facilis").css("display", "block");
			$("li[role='presentation']").removeClass("active");
			$(this).parent("li").addClass("active");
		});
	</script>
	<script>
		/** Reservation Insert/Dialog's Functions **/
		/* renderReservationModal : This Function will Manage about how Reservation's Modal will be Operate on Reserve Mode or Editor Mode. */
		function renderReservationModal(room, isEditMode) {
			if (isEditMode) {
				$("#btn-reservation-reset-restore").val("Restore");
				$("#form-reservation").attr("action", "modify");
				$("#a-reservation-cancel").prop("hidden", false);
				$("#input-reserve-usage-id").val(room.usageId);
				$("#input-reserve-date").val(room.reservedDate);
				$("#input-reserve-start").val(room.accessBegin);
				$("#input-reserve-end").val(room.accessUntil);
				$("#input-reserve-purpose").val(room.purpose);
				$("#input-reserve-note").val(room.note);
				$("#btn-reservation-submit").prop("disabled", false);
				// Facilities Things Here!.
				$.when($.ajax({
					"type" : "post",
					"url" : "reservation/findFacilisUsage",
					"data" : {usageId : room.usageId}
				})).then(function(results){
					var facilityUsage;
					$(".input-facilis").each(function(index){
						var facilityUsage = results[index];
						var inputFacilis;
						if(facilityUsage != undefined){
							inputFacilis = $("input[name='facilis$"+facilityUsage.roomFacilityId+"']");
							inputFacilis.val(facilityUsage.accessedQuantity);
						}
					});
				});
			} else {
				$("#form-reservation").attr("action", "reserve");
				$("#a-reservation-cancel").prop("hidden", true);
				$("#btn-reservation-reset-restore").val("Reset");
				$("#btn-reservation-reset-restore").click(function(){
					resetReservationForm(true);
				});
			}
			$("#i-room-name").html(
					((room.roomName == undefined ? room.room.roomName
							: room.roomName) + (room.roomCode == null ? ""
							: (" &nbsp;(" + room.roomCode + ")"))));
			$("#input-reserve-room-id").val(room.roomId);
			$("#input-reserve-staff-id").val("${thisStaff.staffId}");
			$("#modal-reserve-room").modal();
		}
		/** reservationDateTimeValidator : Validating Date and Time of the Reservation which may be Overlaped with Another. **/
		function reservationDateTimeValidator(roomId, date, start, end){
			$.ajax({
				"type" : "post",
				"url" : "reservation/getOverlapByDate",
				"data" : {date : date, start : start, end : end, roomId : roomId},
				"success" : function(result){
					console.log(result);
					var isOverlap = result.length > 0;
					console.log(isOverlap);
					if(isOverlap){
						displayDateTimeValidatorMsg("This Period is Overlaped to Another Reservation.", "orange");
						$("#btn-reservation-submit").prop("disabled", true);
					} else {
						displayDateTimeValidatorMsg(null, null);
						$("#btn-reservation-submit").prop("disabled", false);
					}
				}
			});
		}

		/* Utility's Fucntions */
		/** displayDateTimeValidatorMsg : Output Display Message on #b-time-validate **/
		function displayDateTimeValidatorMsg(message, color){
			var bTimeValidatorMsg = $("#b-time-validate");
			bTimeValidatorMsg.html(message==null?"":message);
			bTimeValidatorMsg.css("color", color==null?"#aaa":color);
		}
		/** resetReservationForm : Reset the Reservation's Form. **/
		function resetReservationForm(isHardReset){
			if(isHardReset){
				$("input[id^=input-reserve], textarea[id^=input-reserve]").not("#input-reserve-staff-id, #input-reserve-usage-id").val("");
				displayDateTimeValidatorMsg(null, null);
				$(".input-facilis").each(function(index){$(this).val("");});
			} else {
				alert("Not Hard...");
			}
		}
	</script>
</c:if>