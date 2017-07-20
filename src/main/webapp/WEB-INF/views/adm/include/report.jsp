<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="resPath" value="${pageContext.request.contextPath}/resources" />
<link href="${resPath}/Print.js-1.0.18/dist/print.min.css" rel="stylesheet" />
<script src="${resPath}/Print.js-1.0.18/dist/print.min.js"></script>
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
                 		<!-- <table>
                 			<tbody>
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
             								case "date" : $divReportSectionDate.show();$divReportSectionDateUntil.hide();$inputReportSpecifyDateUntil.val("");break;
             								case "date-period" :$divReportSectionDate.show();$divReportSectionDateUntil.show();break;
             								case "date-all" :$divReportSectionDate.hide();$divReportSectionDateUntil.hide(); getFilteredReservationByDate(reservations, null, null); break;
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
                 		</table> -->
                 		<br/>
                 	</div>
                 	<!-- /Report Properties -->
                 	<!-- Report Attribute -->
                 	<div class="tab-pane fade" id="tab-report-attr">
						<div class="row" id="print-usage-report" >
						  	<div class="col-xl-offset-2 col-xl-10">
						  		<table class="table table-striped">
						  			<tbody>
						  				<!-- Room Usages -->
						  				<tr class="tr-print-room-usage">
						  					<td colspan="2"><br/><h3>Reservation Detail </h3></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Date : </b></td>
						  					<td><span id="span-print-room-usage-date"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Period : </b></td>
						  					<td><span id="span-print-room-usage-period"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Reservation's Purpose : </b></td>
						  					<td><span id="span-print-room-usage-purpose"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Reservation's Note : </b></td>
						  					<td><span id="span-print-room-usage-note"></span></td>
						  				</tr>
						  				<!-- /Room Usages -->
						  				<!-- Room Detail -->
						  				<tr class="tr-print-room-detail">
						  					<td colspan="2"><br/><h3>Room Detail</h3></td>
						  					<td><span id="span-print-room-detail"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-detail">
						  					<td><b>Room : </b></td>
						  					<td><span id="span-print-room-detail-room"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-detail">
						  					<td><b>Room's Address : </b></td>
						  					<td><span id="span-print-room-detail-roomaddr"></span></td>
						  				</tr>
						  				<!-- /Room Detail -->
						  				<!-- Reserver Information-->
						  				<tr class="tr-print-reserver">
						  					<td colspan="2"><br/><h3>Reserver's Information</h3></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Staff ID : </b></td>
						  					<td><span id="span-print-reserver-staffid"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Name & Surname : </b></td>
						  					<td><span id="span-print-reserver-staffid"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>E-mail : </b></td>
						  					<td><span id="span-print-reserver-email"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Tel. : </b></td>
						  					<td><span id="span-print-reserver-tel"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Mobile Tel. : </b></td>
						  					<td><span id="span-print-reserver-mobile-tel"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Position : </b></td>
						  					<td><span id="span-print-reserver-position"></span></td>
						  				</tr>
						  				<!-- /Reserver Information -->
						  				<!-- Room Facility -->
						  				<tr class="tr-print-facilities">
						  					<td colspan="2"><br/><h3>Facility's Usages</h3></td>
						  				</tr>
						  				<tr class="tr-print-facilities">
						  					<td colspan="2"><span id="span-print-facilities"></span></td>
						  				</tr>
						  				<!-- /Room Facility -->
						  			</tbody>
						  		</table>
						  	</div>
						  </div>
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
  <!-- /report-page -->
  <!-- /report-page -->
  <jsp:include page="modal_rep_reservation_detail.jsp"></jsp:include>
  <script type="text/javascript">
  	/** Listener **/
  	/* Listening Date Time Period Input Change for Filtered Data on Table */
  	/* $("#input-report-specify-date, #input-report-specify-date-until, #input-report-specify-time, #input-report-specify-time-until").change(function(){
  		log("F");
  		var date = $inputReportSpecifyDate.val()==""?null:$inputReportSpecifyDate.val();
  		var dateEnd = $inputReportSpecifyDateUntil.val()==""?null:$inputReportSpecifyDateUntil.val();
		var start = $inputReportSpecifTime.val()==""?null:$inputReportSpecifTime.val();
		var end =  $inputReportSpecifyTimeUntil.val()==""?null:$inputReportSpecifyTimeUntil.val();
  		filterByDateTime(reservations, date, dateEnd, start, end);
  		setTimeout(function(){log("CL : ");log(filteredReservations);}, 1000);
  	}); */
  	
  	/** Functions **/
  	/* filterByDateTime : This Function For Filtering Reservation's Collection By Date and Time */
  	/* ! : <= 2000ms Required for returning Value. */
  	/* function filterByDateTime(roomUsages , date, dateEnd, start, end){
  		filteredReservations = [];
		if(start != null && end != null){
			log("time");
  			getFilteredReservationByTime(roomUsages , $inputReportSpecifTime.val(), $inputReportSpecifyTimeUntil.val());
  		} else {
  			log("notime");
  			filteredReservations = roomUsages;
  		}
		setTimeout(function() {
			if(date == null && dateEnd == null){
				log("no date");
	  			return filteredReservations;
	  		} else if (date != null && dateEnd == null) {
	  			log("no date-end");
	  			$.when($.each(filteredReservations , function(index, reservation){
	  				if(reservation.reservedDate != date){
	  					delete filteredReservations[index];
	  				}
	  			})).then(function(noResult){
	  				return filteredReservations;
	  			});
	  		} else if (date != null && dateEnd != null) {
	  			log("date date-end");
	  			$.when($.each(filteredReservations , function(index, reservation){
	  				if(date >= reservation.reservedDate && reservation.reservedDate >= dateEnd){
	  					delete filteredReservations[index];
	  				}
	  			})).then(function(noResult){
	  				return filteredReservations;
	  			});
	  		} else {
	  			alert("No Result Cursed by Missing of Argument");
	  		}
		}, 500);
  	} */
  </script>