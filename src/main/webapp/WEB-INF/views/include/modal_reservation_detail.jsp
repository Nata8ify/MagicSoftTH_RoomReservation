<div class="modal fade" id='modal-reserve-detail' data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Reservation's Detail.</h4>
			</div>
			<div class="modal-body">
				<table class='table table-responsive' id='table-reserve-detail'>
					<tbody>
						<tr>
							<th>Room : </th>
							<td><b><i id="i-reserve-detail-roomname"></i> <a style="cursor: pointer;" id="a-reserve-detail-room">[?]</a></b><span id="sp-reserve-detail-room"></span></td>
						</tr>
						<tr>
							<th>Reserved By :</th>
							<td><span id="sp-reserve-detail-rsvby"></span></td>
						</tr>
						<tr>
							<th>For :</th>
							<td><span id="sp-reserve-detail-for"></span></td>
						</tr>
						<tr>
							<th>Date :</th>
							<td><span id="sp-reserve-detail-date"></span></td>
						</tr>
						<tr>
							<th>Period  :</th>
							<td><span id="sp-reserve-detail-start"></span> - <span id="sp-reserve-detail-end"></span></td>
						</tr>
						<tr>
							<th>Reserver's E-mail :</th>
							<td><span id="sp-reserve-detail-email">-</span></td>
						</tr>
						<tr>
							<th>Reserver's Tel :</th>
							<td><span id="sp-reserve-detail-tel">-</span></td>
						</tr>
						<tr>
							<th>Reserver's Mobile No. :</th>
							<td><span id="sp-reserve-detail-mobileno">-</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	
</script>
<script>
	/** Reservation Details's Function. **/
	function viewDetail(detail) {
		$.ajax({
			"type" : "post",
			"url" : "utils/find/staff",
			"data" : {
				staffId : detail.byStaffId
			},
			"success" : function(resrevedStaff) {
				addRoomUsageDetailById(detail.roomId, rooms, detail);
				$("#i-reserve-detail-roomname").html(detail.room.roomName);
				$("#sp-reserve-detail-rsvby").html(resrevedStaff.name);
				$("#sp-reserve-detail-for").html(detail.purpose);
				$("#sp-reserve-detail-date").html(detail.reservedDate);
				$("#sp-reserve-detail-start").html(detail.accessBegin.substring(0,5));
				$("#sp-reserve-detail-end").html(detail.accessUntil.substring(0,5));
				$("#sp-reserve-detail-email").html(resrevedStaff.email!=null?resrevedStaff.email:"-");
				$("#sp-reserve-detail-tel").html(resrevedStaff.tel!=null?resrevedStaff.tel:"-");
				$("#sp-reserve-detail-mobileno").html(resrevedStaff.mobileTel!=null?resrevedStaff.mobileTel:"-");
				$("#sp-reserve-detail-room").html("");
				/*+ #a-reserve-detail-room : Listening the Click "[?]" for view More Room's Detail.*/
				$("#a-reserve-detail-room").click(function(){
					$("#sp-reserve-detail-room").html("<br/> Building : "+detail.room.building+", Floor : "+detail.room.floor);
				});
				$("#modal-reserve-detail").modal();
			}
		});
	}
</script>