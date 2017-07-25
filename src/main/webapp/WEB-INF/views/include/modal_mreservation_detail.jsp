<div class="modal fade" id='modal-mreserve-detail' data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">My Reservation's Detail.</h4>
			</div>
			<div class="modal-body">
				<table class='table table-responsive' id='table-mreserve-detail'>
					<tbody>
						<tr>
							<td><b>Room : </b></td>
							<td><b><span id="sp-mreserve-detail-roomname"></span> <a style="cursor: pointer;" id="a-mreserve-detail-room">[?]</a></b><span id="sp-mreserve-detail-room"></span></td>
						</tr>
						<tr>
							<td><b>For : </b></td>
							<td><span id="sp-mreserve-detail-for"></span></td>
						</tr>
						<tr>
							<td><b>Note : </b></td>
							<td><span id="sp-mreserve-detail-note"></span></td>
						</tr>
						<tr>
							<td><b>Date : </b></td>
							<td><span id="sp-mreserve-detail-date"></span></td>
						</tr>
						<tr>
							<td><b>Period  :</b></td>
							<td><span id="sp-mreserve-detail-start"></span> - <span id="sp-mreserve-detail-end"></span></td>
						</tr>
					</tbody>
				</table>
			</div>
<!-- 			<div class="modal-header" align="right">
				<button type="button" data-dismiss="modal">Close</button>
			</div> -->
		</div>
	</div>
</div>
<script>
	/** My Reservation Details's Listener **/
	/* .btn-m-reserve : Listening Action Button for view Detail on Each [My] Reservation Row.*/
	$("#table-my-reserve tbody").on("click", "tr .btn-m-reserve-detail", function(evt){
		viewMyReservationDetail(mReserveTable.row($(this).parents("tr")).data());
	});
	
	
</script>
<script>
	/** My Reservation Details's Function. **/
	/* viewMyReservationDetail : For set the Value into My Resrvation's Detail's Dialog  (#modal-mreserve-detail).*/
	function viewMyReservationDetail(reservationDetail){
		addRoomUsageDetailById(reservationDetail.roomId, rooms, reservationDetail);
		console.log(reservationDetail);
		$("#sp-mreserve-detail-roomname").html(reservationDetail.room.roomName);
		$("#sp-mreserve-detail-for").html(reservationDetail.purpose);
		$("#sp-mreserve-detail-note").html(reservationDetail.note==""?"-":reservationDetail.note);
		$("#sp-mreserve-detail-date").html(new moment(reservationDetail.reservedDate).format("dddd, MMMM Do YYYY"));
		$("#sp-mreserve-detail-start").html(reservationDetail.accessBegin.substring(0,5));
		$("#sp-mreserve-detail-end").html(reservationDetail.accessUntil.substring(0,5));
		$("#sp-mreserve-detail-room").html("");
		/*+ #a-mreserve-detail-room : Listening the Click "[?]" for view More Room's Detail.*/
		$("#a-mreserve-detail-room").click(function(){
			$("#sp-mreserve-detail-room").html("<br/> Building : "+reservationDetail.room.building+", Floor : "+reservationDetail.room.floor);
		});
		$("#modal-mreserve-detail").modal();
	}
</script>