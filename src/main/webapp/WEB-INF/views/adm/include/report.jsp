	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:set var="resPath" value="${pageContext.request.contextPath}/resources" />
	<script src="${resPath}/fullcalendar/moment.min.js"></script>
	<script src="${resPath}/app/report.js"></script>
  <div class="main">
    <div class="main-inner">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="widget">
              <div class="widget-header"> <i class="icon-bar-chart"></i>
                <h3> Report</h3>
              </div>
              <!-- /widget-header -->
              <div class="widget-content">
                 <!--TODO Content-->
                 <ul class="nav nav-tabs">
                 	<li class="active"><a href="#tab-report-prop" data-toggle="tab">Properties</a></li>
                 	<li><a href="#tab-report-attr" data-toggle="tab">Report Attributes</a></li>
                 </ul>
                 <div class="tab-content">
                 	<!-- Report Properties -->
                 	<div class="tab-pane fade in active" id="tab-report-prop">
                 		<table id="table-room-usages">
                 			<thead>
                 				<tr>
                 					<th>Date</th>
                 					<th>Room</th>
                 					<th>Using Purpose</th>
                 					<th>Detail</th>
                 				</tr>
                 			</thead>
                 			<tbody>
                 			</tbody>
                 		</table>
                 		<script type="text/javascript">
                 			var roomUsagesTable;
                 		</script>
                 		<table>
                 			<tbody>
                 				<tr>
                 					<td>
                 					<div class="form-group">
                 						<label>Room</label>
	                 					<select class="form-control" id="select-report-room">
	                 						<option value="all" selected>Total Rooms</option>
	                 						<option value="room">Specify Room</option>
	                 						<option value="building">Room On Building</option>
	                 					</select>
                 					</div>
                 					</td>
                 					<td>
                 					<div class="form-group hide-first"  id="div-report-section-room">	
                 						<label>Specify a Room</label>
                 						<input type="text" id="input-report-specify-room" class="form-control" placeholder="Room Name" />
                 					</div>
                 					<div class="form-group hide-first"  id="div-report-section-room-building" >	
                 						<label>Specify a Building</label>
                 						<input type="text" id="input-report-specify-room-bulding" class="form-control" placeholder="Room Building" />
                 					</div>
                 					</td>
                 					<script type="text/javascript">
                 						/* #select-report-room : When this Selector has Changed the Value then Check the Option and Render an Appropiated Input. */
                 						var $selectReportRoom = $("#select-report-room");
                 						var $divReportSectionRoom = $("#div-report-section-room");
                 						var $divReportSectionRoomBd = $("#div-report-section-room-building");
                 						var $inputReportSpecifyRoom  = $("#input-report-specify-room");
                 						var $inputReportSpecifyRoomBd  = $("#input-report-specify-room-bulding");
                 						$selectReportRoom.change(function(){
                 							switch($(this).val()){
                 								case "all" : $divReportSectionRoom.hide();$divReportSectionRoomBd.hide();break;
                 								case "room" : $divReportSectionRoom.show();$divReportSectionRoomBd.hide();break;
                 								case "building" : $divReportSectionRoom.hide();$divReportSectionRoomBd.show(); break;
                 							}
                 						});
                 					</script>
                 				</tr>
                 				<tr>
                 					<td>
                 					<div class="form-group">
                 						<label>Date</label>
	                 					<select class="form-control" id="select-report-date">
	                 						<option disabled selected>Select a Date Option</option>
	                 						<option value="date">Date Specify</option>
	                 						<option value="date-period">On Date Period Specify</option>
	                 						<option value="date-all">Since from Beginning</option>
	                 					</select>
                 					</div>
                 					</td>
                 					<td>
	                 					<div class="form-group hide-first"  id="div-report-section-date">	
	                 						<label>Specify a Date</label>
	                 						<input type="date" id="input-report-specify-date" class="form-control"/>
	                 					</div>
                 					</td>
                 					<td>
	                 					<div class="form-group hide-first"  id="div-report-section-date-until">	
	                 						<label>Until Date...</label>
	                 						<input type="date" id="input-report-specify-date-until" class="form-control"/>
	                 					</div>
	                 				</td>
	                 				<script type="text/javascript">
	                 					var $selectReportDate = $("#select-report-date");
	                 					var $divReportSectionDate = $("#div-report-section-date");
	                 					var $divReportSectionDateUntil = $("#div-report-section-date-until");
	                 					var $inputReportSpecifyDate = $("#input-report-specify-date");
	                 					var $inputReportSpecifyDateUntil = $("#input-report-specify-date-until");
	                 					/* #select-report-date : When this Selector has Changed the Value then Check the Option and Render an Appropiated Input. */
	                 					$selectReportDate.change(function(){
	                 						switch($(this).val()){
             								case "date" : $divReportSectionDate.show();$divReportSectionDateUntil.hide();break;
             								case "date-period" :$divReportSectionDate.show();$divReportSectionDateUntil.show();break;
             								case "date-all" :$divReportSectionDate.hide();$divReportSectionDateUntil.hide(); break;
             								}
	                 					});
	                 				</script>	
                 				</tr>
                 				<tr>
                 					<td>
                 					<div class="form-group">
                 						<label>Time</label>
	                 					<select class="form-control" id="select-report-time">
	                 						<option value="time-no">No Time Specify</option>
	                 						<option value="time-period">On Time Period Specify</option>
	                 					</select>
                 					</div>
                 					</td>
                 					<td>
	                 					<div class="form-group hide-first"  id="div-report-section-time">
	                 						<label>Specify a Time</label>
	                 						<input type="time" id="input-report-specify-time" class="form-control"/>
	                 					</div>
                 					</td>
                 					<td>
	                 					<div class="form-group hide-first"  id="div-report-section-time-until">
	                 						<label>Until Time...</label>
	                 						<input type="time" id="input-report-specify-time-until" class="form-control"/>
	                 					</div>
                 					</td>
                 					<script type="text/javascript">
	                 					var $selectReportTime = $("#select-report-time");
	                 					var $divReportSectionTime = $("#div-report-section-time");
	                 					var $divReportSectionTimeUntil = $("#div-report-section-time-until");
	                 					var $inputReportSpecifTime = $("#input-report-specify-time");
	                 					var $inputReportSpecifyTimeUntil = $("#input-report-specify-time-until");
	                 					$selectReportTime.change(function(){
                 							switch($(this).val()){
                 								case "time-no" : $divReportSectionTime.hide();$divReportSectionTimeUntil.hide();break;
                 								case "time-period" : $divReportSectionTime.show();$divReportSectionTimeUntil.show();break;
                 							}
                 						});
                 					</script>
                 				</tr>
                 			</tbody>
                 		</table>
                 		<br/>
                 	</div>
                 	<!-- /Report Properties -->
                 	<!-- Report Attribute -->
                 	<div class="tab-pane fade" id="tab-report-attr">
						
                 	<!-- /Report Attribute -->
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
  <!-- /main -->