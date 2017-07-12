	
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
							function setUpTodayReservationTable(todayReservationData){
									$("#table-view-reservation-today").DataTable({
									"data" : todayReservationData,
									"columns" : [{width : "20%"},{width : "70%", data : "room.roomName"}, {width : "10%"}],
									"columnDefs" : [{
										targets : 0,
										render : function(url, type, row, meta){
											log(row);
											return (row.accessBegin.substring(0,5) + " - " + row.accessUntil.substring(0,5)); 
										}
									},{
										targets : -1,
										defaultContent : "<button class='btn btn-default'>View</button>"
									}],
									"searching": false,
									"bLengthChange": false
								});$("#b-today").html(" ("+new moment().format("LL")+")");}
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
							function setUpComingReservationTable(comingReservationData){
									$("#table-view-reservation-coming").DataTable({
									"data" : comingReservationData,
									"columns" : [{width : "20%", data : "reservedDate"},{width : "70%", data : "room.roomName"}, {width : "10%"}],
									"columnDefs" : [{
										targets : -1,
										defaultContent : "<button class='btn btn-default'>View</button>"
									}],
									"searching": false,
									"bLengthChange": false
								});}
							</script>
						</div>

						<!-- /widget -->
					</div>
					<!-- /span6 -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /main-inner -->
	</div>
	<!-- /main -->