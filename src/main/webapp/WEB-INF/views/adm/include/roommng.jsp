<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

							<form method='post' action="addroom" accept-charset="UTF-8">
								<input name="roomCode" type="text" placeholder="roomCode" /> <input
									name="roomName" type="text" placeholder="roomName" /> <input
									name="description" type="text" placeholder="description" /> <input
									name="floor" type="number" placeholder="floor" /> <input
									name="building" type="text" placeholder="building" />
								Available? : <input type="checkbox" name="isAvailable" /> <br />
								<input type="submit" />
							</form>
							<hr />
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
<jsp:include page="modal_roomeditor.jsp"></jsp:include>
<!-- /main -->
<script>
	var rooms;
	var roomDataTable = $("#table-room")
			.DataTable(
					{
						"ajax" : {
							"type" : "post",
							"url" : "findAllRooms",
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
						} ]
					});

	$("table tbody").on("click", "tr .btnEditRoom", function(evt) {
		var rowData = roomDataTable.row($(this).parents("tr")).data();
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
		$("")
	});
</script>