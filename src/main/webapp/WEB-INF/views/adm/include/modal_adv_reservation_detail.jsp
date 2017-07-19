<div class="modal fade" id='modal-adv-reserve-detail' data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Reservation's Detail.</h4>
			</div>
			<div class="modal-body">
				<table class='table table-responsive' id='table-adv-reserve-detail'>
					<tbody>
						<tr>
							<th>Room : </th>
							<td><b><i id="i-adv-reserve-detail-roomname"></i> <a style="cursor: pointer;" id="a-adv-reserve-detail-room">[?]</a></b><span id="sp-adv-reserve-detail-room"></span></td>
						</tr>
						<tr>
							<th>Reserved By :</th>
							<td><span id="sp-adv-reserve-detail-rsvby"></span> <a style="cursor: pointer;" id="a-adv-reserve-detail-reserver">[?]</a><span id="sp-adv-reserve-detail-reserver"></span></td>
						</tr>
						<tr>
							<th>For :</th>
							<td><span id="sp-adv-reserve-detail-for"></span></td>
						</tr>
						<tr>
							<th>Date :</th>
							<td><span id="sp-adv-reserve-detail-date"></span></td>
						</tr>
						<tr>
							<th>Period  :</th>
							<td><span id="sp-adv-reserve-detail-start"></span> - <span id="sp-adv-reserve-detail-end"></span></td>
						</tr>
						<tr>
							<th>Note :</th>
							<td><span id="sp-adv-reserve-detail-note"></span></td>
						</tr>
						<tr>
							<th>Facility's Information : </th>
							<td><span id="sp-adv-reserve-detail-facilis">Loading...</span></td>
						</tr>
						<tr>
							<th>Option :</th>
							<td><!-- <button id="btn-adv-reserve-detail-fwdemail" class="btn">Forward an E-mail</button> &nbsp; --><a style="cursor: pointer; color:red;" id="a-reservation-cancel" data-usageId="">Cancel this Reservation</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	/** Listener **/
	/* .btn-adv-reservation-detail : When this was Clicked then the Reservation Detail's Dialog will be Fired. */
	$("#table-view-reservation-today tbody").on("click", "tr .btn-adv-reservation-detail", function(evt){
		var roomDetail = todayReservationTable.row($(this).parents("tr")).data();
		$.when(findUserByStaffId(roomDetail.byStaffId)).then(function(user){
				roomDetail["user"] = user;
				log(roomDetail);
				viewAdvanceReservationDetail(roomDetail);
		});
	});
	$("#table-view-reservation-coming tbody").on("click", "tr .btn-adv-reservation-detail", function(evt){
		var roomDetail = comingReservationTable.row($(this).parents("tr")).data();
		$.when(findUserByStaffId(roomDetail.byStaffId)).then(function(user){
				roomDetail["user"] = user;
				log(roomDetail);
				viewAdvanceReservationDetail(roomDetail);
		});
	});
	
	/* [Edit Mode] #a-reservation-cencel : Listening Delete action on Selected Resrvation. */
	$("#a-reservation-cancel").click(function() {
		var usageId = $(this).data("usageId");
		console.log(usageId);
		if (confirm("This Reservation will be Remove from the System, would you like to Continue?")) {
		$.ajax({
			"type" : "post",
			"url" : "manageReservation/delete",
			"data" : {usageId : usageId},
			"success" : function(result) {
				if (result) {
				alert("This Reservation is Canceled Successfuly.");
				$("#modal-reserve-room").modal("hide");
			  	}
			}
		});}});
</script>
<script>
	/** Reservation Details's Function. **/
	/* viewAdvanceReservationDetail : To Append value into the Advance Reservation's Table. */
	function viewAdvanceReservationDetail(detail) {
				$("#sp-adv-reserve-detail-facilis").html("Loading...");
				$("#i-adv-reserve-detail-roomname").html(detail.room.roomName);
				$("#sp-adv-reserve-detail-rsvby").html(detail.user.name);
				$("#sp-adv-reserve-detail-for").html(detail.purpose);
				$("#sp-adv-reserve-detail-date").html(new moment(detail.reservedDate).format("dddd, MM Do YYYY"));
				$("#sp-adv-reserve-detail-start").html(detail.accessBegin.substring(0,5));
				$("#sp-adv-reserve-detail-end").html(detail.accessUntil.substring(0,5));
				$("#sp-adv-reserve-detail-note").html(detail.note);
				$("#sp-adv-reserve-detail-room").html("");
				$("#sp-adv-reserve-detail-reserver").html("");
				$("#a-reservation-cancel").data("usageId", detail.usageId);
				/*+ #a-adv-reserve-detail-room : Listening the Click "[?]" for view More Room's Detail.*/
				$("#a-adv-reserve-detail-room").click(function(){
					$("#sp-adv-reserve-detail-room").html("<br/> Building : <i>"+detail.room.building+"</i>, Floor : <i>"+detail.room.floor+"</i>");
				});
				/*+ #a-adv-reserve-detail-reserver : Listening the Click "[?]" for view More Reserver's Detail.*/
				$("#a-adv-reserve-detail-reserver").click(function(){
					$("#sp-adv-reserve-detail-reserver").html("</br> <b>E-mail : </b><i>"+detail.user.email+"</i></br> <b>Contact Number : </b><i>"+detail.user.tel+"</i></br> <b>Mobile No. : </b><i>"+detail.user.mobileTel)+"</i></b>";
				});
				getFacilitiesUsageDetailByUsageId(detail.usageId);
				setTimeout(function(){
						if(selectedFacilityDetails.length > 0){
							var isFirst = true;
							$.each(selectedFacilityDetails, function(index, facility){
								if(isFirst){
									$("#sp-adv-reserve-detail-facilis").html("<b>"+facility.facility.facility+" :</b> <i>"+facility.accessedQuantity+"</i>");
									isFirst = false;
								} else {
									$("#sp-adv-reserve-detail-facilis").append("<br/><b>"+facility.facility.facility+" :</b> <i>"+facility.accessedQuantity+"</i>");
								}
							});
							} else {
								$("#sp-adv-reserve-detail-facilis").html("No Facility's Usage");
							}
					
					
				}, 1000);
				$("#modal-adv-reserve-detail").modal();
	}
</script>