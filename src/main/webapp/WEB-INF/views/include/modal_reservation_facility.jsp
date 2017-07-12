<div class="modal fade" id='modal-reserve-room-facility' data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close modal-ficilis">&times;</button>
					<h4 class="modal-title">Available for Reserve's Facilities.</h4>
				</div>
				<div class="modal-body">
						<table class='table  table-hover'>
						<thead>
							<tr>
								<th>Facility</th>
								<th>Quantity</th>
							</tr>
						</thead>
							<tbody id="tbody-reserve-room-facility">
							</tbody>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="modal-ficilis" >Close</button>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-serialize-object/2.5.0/jquery.serialize-object.min.js"></script>
	<script>
		/* document : Certainly the Document was Loaded the Facility's Table will Load Instatiate Data.*/
		$("document").ready(function(){
			$.ajax({
				"type" : "post",
				"url" : "facility/findAll",
				"success" : function(facilities){
					console.log(facilities);
					$.each(facilities, function(index, val){
						$("#tbody-reserve-room-facility").append("<tr><td>"+val.facility+"</td><td><input class='form-control input-facilis' type='number' min='0' name='facilis$"+val.roomFacilityId+"'/></td></tr>");
					});
				} 
			});
		});
		/* .modal-ficilis : For Closing Modal with no affect to Reservation's Modal. */
		$(".modal-ficilis").click(function(){$('#modal-reserve-room-facility').modal('hide');});
	</script>