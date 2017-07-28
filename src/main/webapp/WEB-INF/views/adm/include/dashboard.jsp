	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:set var="resPath" value="${pageContext.request.contextPath}/resources" />
	<script src="${resPath}/fullcalendar/moment.min.js"></script>
	<script src="${resPath}/app/room.js"></script>
	<div class="main">
		<div class="main-inner">
			<div class="container">
				<div class="row">
					<div class="span6">
						<div class="widget">
							<div class="widget-header">
								<i class="icon-file"></i>
								<h3>Today Reservation <b id="b-today"></b></h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered" id="table-view-reservation-today">
									<thead>
										<tr>
											<th>Period</th>
											<th>Room</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
							<script type="text/javascript">
							/* setUpTodayReservationTable : This is a Function for Initialize Today Reservation's Data Table. */
							var todayReservationTable; //[GLOBAL]
							function setUpTodayReservationTable(todayReservationData){
								todayReservationTable = $("#table-view-reservation-today").DataTable({
									"data" : todayReservationData,
									"columns" : [{width : "20%"},{width : "70%", data : "room.roomName"}, {width : "10%"}],
									"columnDefs" : [{
										targets : 0,
										render : function(url, type, row, meta){
											return (row.accessBegin.substring(0,5) + " - " + row.accessUntil.substring(0,5)); 
										}
									},{
										targets : -1,
										defaultContent : "<button class='btn btn-default btn-adv-reservation-detail'>View</button>"
									}],
									"searching": false,
									"bLengthChange": false, 
			 						"language": {
			 						      "emptyTable": "There are no reservation on this day"
			 					    }
								});$("#b-today").html(" ("+new moment().format("LL")+")");}
							/* Deal with DataTable Function */
							/* updateReservationForCurrentDayTime : Get Reservation that Filtered Passed Reservation form the Day by Time on todayReservations*/
							function updateReservationForCurrentDayTime(){ //#
								var now = moment().format("HH:mm:ss");
								
								$.each(todayReservations, function(index, reservation){
									console.log(now+" :: "+reservation.accessUntil);
									if(reservation.accessUntil.localeCompare(now) == 1){
										console.log(reservation.accessUntil.localeCompare(now));
									}
								});
								setTimeout(() => {
									console.log("F");
								}, 2000); 
							}

							/* refetchTodayReservationTable : The Function for refetch Today Reservation's Data table */
							function refetchTodayReservationTable(reservations){
								todayReservationTable.clear().draw();
								todayReservationTable.rows.add(reservations);
								todayReservationTable.columns.adjust().draw();
							} // /#
							</script>
						</div>
						<!-- /widget -->
					</div>
					<!-- /span6 -->
					<div class="span6">

						<div class="widget widget-table action-table">
							<div class="widget-header">
								<i class="icon-th-list"></i>
								<h3>Coming Reservation</h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-bordered" id="table-view-reservation-coming">
									<thead>
										<tr>
											<th>Date</th>
											<th>Room</th>
											<th class="td-actions"></th>
										</tr>
									</thead>
									<tbody>
								
									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
							<script type="text/javascript">
							/* setUpTodayReservationTable : This is a Function for Initialize Today Reservation's Data Table. */
							var comingReservationTable; //[GLOBAL]
							function setUpComingReservationTable(comingReservationData){
								comingReservationTable = $("#table-view-reservation-coming").DataTable({
									"data" : comingReservationData,
									"columns" : [{width : "20%", data : "reservedDate"},{width : "70%", data : "room.roomName"}, {width : "10%"}],
									"columnDefs" : [{
										targets : -1,
										defaultContent : "<button class='btn btn-default btn-adv-reservation-detail'>View</button>"
									}],
									"searching": false,
									"bLengthChange": false, 
			 						"language": {
			 						      "emptyTable": "There are no reservation in upconing days"
			 					    }
								});}
							</script>
						</div>

						<!-- /widget -->
					</div>
					<!-- /span6 -->
				</div>
				<!-- /row -->
				<div class="row">
					<div class="span12">
						<div class="widget">
							<div class="widget-header">
								<i class="icon-file"></i>
								<h3>User's Reports <b id="b-today"></b></h3>
							</div>
							<!-- /widget-header -->
							<div class="widget-content">
								<table class="table table-striped table-responsive table-hover">
									<tbody id="tbody-informs">
										
									</tbody>
								</table>
							</div>
							<!-- /widget-content -->
							<script type="text/javascript">
								var $tbodyInform = $("#tbody-informs");
								var informNumber = 0;
								$("document").ready(function(){
									buildInformTable();
									/* Refresh Inform's Table Every 1 minute. */
									setInterval(function() {
										buildInformTable();
									}, 60000);
								});
								
								/* buildInformTable : Load and Render the Inform data into Inform Table. */
								function buildInformTable(){
									$.ajax({
										"type" : "post",
										"url" : "utils/find/informs",
										"success" : function(results){
											informNumber = results.length;
											console.log(results);
											var $rowData;
											if(informNumber > 0){ 
											$tbodyInform.empty();
											$.each(results, function(index, inform){
												$rowData = $("<tr><td>"+(inform.byStaffId==null?"Anonymous":inform.byStaffId)+"</td><td><b>"+inform.title+"</b> (<i>"+moment.unix(inform.timeStamp/1000).format("LLLL")+"</i>)<br/>"+inform.message+"</td><td><button class='btn-dismiss-inform' data-informid='"+inform.informId+"'>Dismiss</button></td></tr>");
												$rowData.find("button").click(function(){
													dismissInform($(this).data("informid"), $rowData);
													$(this).closest("tr").remove();
													if($tbodyInform.find("tr").length == 0){
														$tbodyInform.html("<tr><td colspan='4'><center><b>Empty</b></center></td></tr>");
													}
												});
												$tbodyInform.append($rowData);	
											});
											 } else {
												$rowData = "<tr><td colspan='4'><center><b>Empty</b></center></td></tr>";
												$tbodyInform.html($rowData);
											} 
										}
									});
								}
								
								/* dismissInform : To Dismiss yhe Selected Inform. */
								function dismissInform(informId, informRow){
									
									$.ajax({
										"type" : "post",
										"url" : "utils/delete/inform",
										"data" : {informId : informId},
										"success" : function(isSuccess){
											
										}
									});	
								}	
							</script>
						</div>
						<!-- /widget -->
					</div>
				</div>
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
	</div>
	<!-- /main -->
	<jsp:include page="modal_adv_reservation_detail.jsp"></jsp:include>