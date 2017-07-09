<div class="modal fade" id='modal-mreserve-detail'>
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
							<th>Room : </th>
							<td><b><span id="sp-mreserve-detail-roomname"></span> <a href="#" id="a-">[?]</a></b></td>
						</tr>
						<tr>
							<th>For : </th>
							<td><span id="sp-mreserve-detail-for"></span></td>
						</tr>
						<tr>
							<th>Date : </th>
							<td><span id="sp-mreserve-detail-date"></span></td>
						</tr>
						<tr>
							<th>Period  : </th>
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
		console.log(reservationDetail);
		$("#sp-mreserve-detail-roomname").html(reservationDetail.roomName);
		$("#sp-mreserve-detail-for").html(reservationDetail.purpose);
		$("#sp-mreserve-detail-date").html(reservationDetail.reservedDate);
		$("#sp-mreserve-detail-start").html(reservationDetail.accessBegin);
		$("#sp-mreserve-detail-end").html(reservationDetail.accessUntil);
		$("#modal-mreserve-detail").modal();
	}
</script>