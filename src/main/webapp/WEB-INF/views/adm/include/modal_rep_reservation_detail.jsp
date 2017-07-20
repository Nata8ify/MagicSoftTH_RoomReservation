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
							<td><b><i id="i-adv-reserve-detail-roomname"></i> <a style="cursor: pointer;" id="a-adv-reserve-detail-room">[?]</a></b><span id="sp-report-usage-detail-room"></span></td>
						</tr>
						<tr>
							<th>Reserved By :</th>
							<td><span id="sp-report-usage-detail-rsvby"></span> <a style="cursor: pointer;" id="a-adv-reserve-detail-reserver">[?]</a><span id="sp-report-usage-detail-reserver"></span></td>
						</tr>
						<tr>
							<th>For :</th>
							<td><span id="sp-report-usage-detail-for"></span></td>
						</tr>
						<tr>
							<th>Date :</th>
							<td><span id="sp-report-usage-detail-date"></span></td>
						</tr>
						<tr>
							<th>Period  :</th>
							<td><span id="sp-report-usage-detail-start"></span> - <span id="sp-report-usage-detail-end"></span></td>
						</tr>
						<tr>
							<th>Note :</th>
							<td><span id="sp-report-usage-detail-note"></span></td>
						</tr>
						<tr>
							<th>Facility's Information : </th>
							<td><span id="sp-report-usage-detail-facilis">Loading...</span></td>
						</tr>
						<tr>
							<th>Option :</th>
							<td><button id="btn-report-usage-print" class="btn" onclick="printJS('print-usage-report', 'html')"> Print</button> &nbsp;<b>or</b> &nbsp;<button id="btn-report-usage-save" class="btn">Save Report</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	/** Listener **/
	/* .btn-report-reservation-detail : When this was Clicked then the Reservation Detail's Dialog will be Fired. */
	$("#table-room-usages tbody").on("click", "tr .btn-report-reservation-detail", function(evt){
		var roomDetail = roomUsagesTable.row($(this).parents("tr")).data();
		$.when(findUserByStaffId(roomDetail.byStaffId)).then(function(user){
				roomDetail["user"] = user;
				viewAdvanceReservationDetail(roomDetail);
		});
	});
	/* #btn-report-usage-print : Listening User Printing Option */
	$("#btn-report-usage-print").click(function(){
		console.log(roomUsagesTable.rows( { filter : 'applied'} ).data());
	});
	/* #btn-report-usage-save : Listening User Report Saving Option */
	$("#btn-report-usage-save").click(function(){
		alert("dd");
	});
</script>
<script>
	/** Reservation Details's Function. **/
	/* viewAdvanceReservationDetail : To Append value into the Advance Reservation's Table. */
	function viewAdvanceReservationDetail(detail) {
				$("#sp-report-usage-detail-facilis").html("Loading...");
				$("#i-adv-reserve-detail-roomname").html(detail.room.roomName);
				$("#sp-report-usage-detail-rsvby").html(detail.user.name);
				$("#sp-report-usage-detail-for").html(detail.purpose);
				$("#sp-report-usage-detail-date").html(new moment(detail.reservedDate).format("dddd, MM Do YYYY"));
				$("#sp-report-usage-detail-start").html(detail.accessBegin.substring(0,5));
				$("#sp-report-usage-detail-end").html(detail.accessUntil.substring(0,5));
				$("#sp-report-usage-detail-note").html(detail.note);
				$("#sp-report-usage-detail-room").html("");
				$("#sp-report-usage-detail-reserver").html("");
				$("#a-reservation-cancel").data("usageId", detail.usageId);
				/*+ #a-adv-reserve-detail-room : Listening the Click "[?]" for view More Room's Detail.*/
				$("#a-adv-reserve-detail-room").click(function(){
					$("#sp-report-usage-detail-room").html("<br/> Building : <i>"+detail.room.building+"</i>, Floor : <i>"+detail.room.floor+"</i>");
				});
				/*+ #a-adv-reserve-detail-reserver : Listening the Click "[?]" for view More Reserver's Detail.*/
				$("#a-adv-reserve-detail-reserver").click(function(){
					$("#sp-report-usage-detail-reserver").html("</br> <b>E-mail : </b><i>"+detail.user.email+"</i></br> <b>Contact Number : </b><i>"+detail.user.tel+"</i></br> <b>Mobile No. : </b><i>"+detail.user.mobileTel)+"</i></b>";
				});
				getFacilitiesUsageDetailByUsageId(detail.usageId);
				setTimeout(function(){
						if(detail.faciliyUsages.length > 0){
							var isFirst = true;
							$.each(detail.faciliyUsages, function(index, facility){
								if(isFirst){
									$("#sp-report-usage-detail-facilis").html("<b>"+facility.facility.facility+" :</b> <i>"+facility.accessedQuantity+"</i>");
									isFirst = false;
								} else {
									$("#sp-report-usage-detail-facilis").append("<br/><b>"+facility.facility.facility+" :</b> <i>"+facility.accessedQuantity+"</i>");
								}
							});
							} else {
								$("#sp-report-usage-detail-facilis").html("No Facility's Usage");
							}
					
					
				}, 999);
				$("#modal-adv-reserve-detail").modal();
	}
</script>