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
                 	<li class="active" id="li-report-usages"><a href="#tab-report-usages" data-toggle="tab">Usage's Overview</a></li>
                 	<li hidden="" id="li-report-body"><a href="#tab-report-body" data-toggle="tab"  > > Report Body</a></li>
                 </ul>
                 <div class="tab-content">
                 	<!-- Report Properties -->
                 	<div class="tab-pane fade in active" id="tab-report-usages">
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
                 	</div>
                 	<!-- /Report Properties -->
                 	<!-- Report Attribute -->
                 	<div class="tab-pane fade" id="tab-report-attr"></div>
                 	<div class="tab-pane " id="tab-report-body">
						<div id="print-usage-report">
								<h1>MST Room Reservation Report<br/></h1>
						  		<table class="table table-striped">
						  			<tbody>
						  				<!-- Room Usages -->
						  				<tr class="tr-print-room-usage">
						  					<td colspan="4"><br/><h3>Reservation Detail </h3></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Date : </b></td>
						  					<td><span id="span-print-room-usage-date"></span></td>
						  					<td><b>Period : </b></td>
						  					<td><span id="span-print-room-usage-period"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Reservation's Purpose : </b></td>
						  					<td colspan="3"><span id="span-print-room-usage-purpose"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-usage">
						  					<td><b>Reservation's Note : </b></td>
						  					<td colspan="3"><span id="span-print-room-usage-note"></span></td>
						  				</tr>
						  				<!-- /Room Usages -->
						  				<!-- Room Detail -->
						  				<tr class="tr-print-room-detail">
						  					<td colspan="4"><br/><h3>Room Detail</h3></td>
						  					<td><span id="span-print-room-detail"></span></td>
						  				</tr>
						  				<tr class="tr-print-room-detail">
						  					<td><b>Room : </b></td>
						  					<td colspan="1"><span id="span-print-room-detail-room"></span></td>
						  					<td><b>Room's Address : </b></td>
						  					<td colspan="1"><span id="span-print-room-detail-roomaddr"></span></td>
						  				</tr>
						  				<!-- /Room Detail -->
						  				<!-- Reserver Information-->
						  				<tr class="tr-print-reserver">
						  					<td colspan="4"><br/><h3>Reserver's Information</h3></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Name & Surname : </b></td>
						  					<td><span id="span-print-reserver-name"></span></td>
						  					<td><b>Staff ID : </b></td>
						  					<td><span id="span-print-reserver-staffid"></span></td>
						  				
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>E-mail : </b></td>
						  					<td colspan="3"><span id="span-print-reserver-email"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Tel. : </b></td>
						  					<td colspan="3"><span id="span-print-reserver-tel"></span></td>
						  				</tr>
						  				<tr class="tr-print-reserver">
						  					<td><b>Mobile Tel. : </b></td>
						  					<td colspan="3"><span id="span-print-reserver-mobile-tel"></span></td>
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
                 	<!-- /Report Attribute -->
					<div class="row">
						<div class="span 2">
							<button class="btn-report-usage-print" class="btn"> Print</button>
						</div>	  	
					</div>
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
  	/* renderReportPrintForm : Render the Print a Page Detial  */
  	function renderReportPrintForm(roomUsage, attrs){
  		/* $("#tab-report-attr").find("*").css("display", "inline-block");
  		if(true){
  			
  		} */
  		$("[id^=span-print]").html("-");
  		$("#span-print-room-usage-date").html(moment(roomUsage.reservedDate).format("dddd, Do MMMM YYYY"));
  		$("#span-print-room-usage-period").html(roomUsage.accessBegin.substring(0,5).concat(" - ").concat(roomUsage.accessUntil.substring(0,5)));
  		$("#span-print-room-usage-purpose").html(roomUsage.purpose);
  		$("#span-print-room-usage-note").html(roomUsage.note==""?"-":roomUsage.note);
  		$("#span-print-room-detail-room").html(roomUsage.room.roomName.concat(roomUsage.room.roomCode!=null?(" <br/>(".concat(roomUsage.room.roomCode).concat(")")):""));
  		$("#span-print-room-detail-roomaddr").html((roomUsage.room.building!=null?("<b>Building<b/> <i>"+roomUsage.room.building+"<i/>"):"").concat(roomUsage.room.floor!=null?("<b>, Floor</b><i>"+roomUsage.room.floor)+"</i>":""));
  		$("#span-print-reserver-staffid").html(roomUsage.reserver.staffId);
  		$("#span-print-reserver-email").html(roomUsage.reserver.email);
  		$("#span-print-reserver-name").html(roomUsage.reserver.name);
  		$("#span-print-reserver-tel").html(roomUsage.reserver.tel);
  		$("#span-print-reserver-mobile-tel").html(roomUsage.reserver.mobileTel);
  		$("#span-print-reserver-position").html(roomUsage.reserver.position);
  		if(roomUsage.faciliyUsages.length > 0){
  			var facilityHTMLTemplate = "";
  			$.each(roomUsage.faciliyUsages, function(index, facilityUsage){
  				log(facilityUsage);
  				facilityHTMLTemplate += ("<span>"+facilityUsage.facility.facility+" : </span><i>"+facilityUsage.accessedQuantity+"</i> "+(index!=roomUsage.faciliyUsages.length-1?", ":""));
  			});
  			$("#span-print-facilities").html(facilityHTMLTemplate);
  		} else {
  			$("#span-print-facilities").html("No Facilty's Usage");
  		}
  	}
  </script>