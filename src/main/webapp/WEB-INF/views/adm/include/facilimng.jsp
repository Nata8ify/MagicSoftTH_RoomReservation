
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
						<fieldset>
								<legend>Register a Facility for Room's Reservation</legend>
							<form method='post' action="addfacili">
								<input type="text" name="facility" placeholder="Facility" maxlength="30" required /> 
								<input type="text" name="description" placeholder="Description" maxlength="100"  />
								<input type="number" name="quantity" placeholder="Quantity" maxlength="5" />
								<br/>Is a Device <a href="javascript:alert('If this Facility can be reusable like a Projector, Digital Pen, Multiple plug socket and so on, then this option is eligible.');">[?]</a> : <input type="checkbox" name="isDevice" />
								<br/><br/><input type="submit" value="Register" />
							</form>
						</fieldset>
						
						<hr />
						<fieldset>
								<legend>Facility Explorer</legend>
							<div>
								<table id="table-facility"
									class="">
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
						</fieldset>	
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
							"type" : "post",
							"url" : "facility/findAll",
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
						} ], 
 						"language": {
						      "emptyTable": "Empty"
					    }
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
