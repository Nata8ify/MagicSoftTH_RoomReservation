<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="widget">
						<div class="widget-header">
							<i class="icon-pencil"></i>
							<h3>Room Management</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<!-- <button class="btn btn-default" id="btn-add-room">Add</button> -->
							<fieldset>
								<legend>Register a Room for Reservation</legend>
								<form method='post' action="addroom" accept-charset="UTF-8">
								<input name="roomCode" type="text" placeholder="Room Code (Optional)" /> 
								<input name="roomName" type="text" placeholder="Room Name" required /> 
								<input name="floor" type="number" placeholder="Floor" required /> 
								<input name="building" type="text" placeholder="Building" required />
								<input name="description" type="text" placeholder="Description (Optional)" /> 
								Available <a href="javascript:alert('If this you want to make this room available for reserve then this option should be checked.');">[?]</a> : <input type="checkbox" name="isAvailable" /> <br/><br />
								<input type="submit" value="Register" />
							</form>
							</fieldset>
							
							<hr />
							<fieldset>
								<legend>Room Explorer</legend>
							<div>
								<table id="table-room"
									class="table table-responsive table-stripted">
									<thead>
										<tr>
											<th>Room code</th>
											<th>Room Name</th>
											<th>Building</th>
											<th>Floor</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
							</fieldset>
							<jsp:include page="modal_roomeditor.jsp" flush="true"></jsp:include>
						</div>
						<!-- /widget-content -->
					</div>
					<!-- /widget -->
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /main-inner -->
</div>

<!-- /main -->
<script>
	var rooms;
	var roomDataTable = $("#table-room")
			.DataTable(
					{"ajax" : {
							"type" : "post",
							"url" : "findRoom/findAllRooms",
							"dataSrc" : function(json) {
								rooms = json;
								console.log(rooms);
								return rooms;
							}
						},
						"columns" : [ {
							"data" : "roomCode",
							"width" : "20%"
						}, {
							"data" : "roomName",
							"width" : "30%"
						}, {
							"data" : "building",
							"width" : "20%"
						}, {
							"data" : "floor",
							"width" : "20%"
						}, {
							"width" : "10%"
						} ],
						"columnDefs" : [ {
							"targets" : -1,
							"data" : "",
							"searchable" : false,
							"defaultContent" : "<button class='btnEditRoom btn btn-default'><i class='glyphicon glyphicon-pencil'></i>Edit</button>"
						} ], 
 						"language": {
						      "emptyTable": "Empty"
					    }
					});
	$("table tbody").on("click", "tr .btnEditRoom", function(evt) {
		$("#modal-room-editor").prop("hidden")?$("#modal-room-editor").prop("hidden", false):""; //Fix unclickable last two options's nav.
		var rowData = roomDataTable.row($(this).parents("tr")).data();
		console.log(rowData.roomId);
		$("#input-edit-room-id").val(rowData.roomId);
		$("#input-edit-room-code").val(rowData.roomCode);
		$("#input-edit-room-name").val(rowData.roomName);
		$("#input-edit-room-floor").val(rowData.floor);
		$("#input-edit-room-building").val(rowData.building);
		$("#input-edit-room-desc").val(rowData.description);
		if (rowData.isAvailable) {
			$("#input-edit-room-available").prop("checked", true);
		} else {
			$("#input-edit-room-available").prop("checked", false);
		}
		$("#modal-room-editor").modal();
	});
	$("#btn-add-room").click(function(){
		$("#modal-room-insert").prop("hidden", false);
		$("#modal-room-insert").modal("show");
	});
</script>