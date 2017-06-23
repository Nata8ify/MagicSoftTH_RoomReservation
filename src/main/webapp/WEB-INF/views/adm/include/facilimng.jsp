
<!-- /subnavbar -->
<div class="main">
	<div class="main-inner">
		<div class="container">
			<div class="row">
				<div class="span12">
					<div class="widget">
						<div class="widget-header">
							<i class="icon-facetime-video"></i>
							<h3>Facilities Management</h3>
						</div>
						<!-- /widget-header -->
						<div class="widget-content">
							<form method='post' action="addfacili">
								<input type="text" name="facility" placeholder="facility"
									maxlength="30" /> <input type="text" name="description"
									placeholder="description" maxlength="100" /><input
									type="number" name="quantity" placeholder="quantity"
									maxlength="5" /> Is a Device : <input type="checkbox"
									name="isDevice" /> <input type="submit" />
							</form>
						</div>
						<hr />
							<div>
								<table id="table-facility"
									class="table table-responsive table-stripted">
									<thead>
										<tr>
											<th>Facility</th>
											<th>Description</th>
											<th>Quantity</th>
											<th>Edit</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
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
<jsp:include page="modal_facilityeditor.jsp"></jsp:include>
<script>
	var facilities;
	var facilityDataTable = $("#table-facility")
			.DataTable(
					{
						"ajax" : {
							"url" : "findAllFacilis",
							"dataSrc" : function(json) {
								facilities = json;
								console.log(facilities);
								return facilities;
							}
						},
						"columns" : [ {
							"data" : "facility",
							"width" : "20%"
						}, {
							"data" : "description",
							"width" : "50%"
						}, {
							"data" : "quantity",
							"width" : "20%"
						}, {
							"width" : "10%"
						} ],
						"columnDefs" : [ {
							"targets" : -1,
							"data" : "",
							"searchable" : false,
							"defaultContent" : "<button class='btnEditFacility btn btn-default'>Edit</button>"
						} ]
					});

	$("table tbody").on("click", "tr .btnEditFacility", function(evt) {
		var rowData = facilityDataTable.row($(this).parents("tr")).data();
		$("#input-edit-facility-id").val(rowData.roomFacilityId);
		$("#input-edit-facility-name").val(rowData.facility);
		$("#input-edit-facility-quantity").val(rowData.quantity);
		$("#input-edit-facility-desc").val(rowData.description);
		if (rowData.isDevice) {
			$("#input-edit-facility-device").prop("checked", true);
		} else {
			$("#input-edit-facility-device").prop("checked", false);
		}
		$("#modal-facility-editor").modal();
	});
</script>
