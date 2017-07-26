<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="resPath"
	value="${pageContext.request.contextPath}/resources" />
<c:set var="appPath"
	value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>

<!-- /.website title -->
<title>MST Room Reservation</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />

<!-- CSS Files -->
<link href="${resPath}/user_backyard/css/bootstrap.min.css"
	rel="stylesheet" media="screen" />
<link href="${resPath}/user_backyard/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${resPath}/user_backyard/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet" />
<link href="${resPath}/user_backyard/css/animate.css" rel="stylesheet"
	media="screen" />
<link href="${resPath}/user_backyard/css/owl.theme.css" rel="stylesheet" />
<link href="${resPath}/user_backyard/css/owl.carousel.css"
	rel="stylesheet" />
<link href="${resPath}/user_backyard/css/custom_home.css"
	rel="stylesheet" media="screen" />	
<%-- <link href="${resPath}/user_backyard/css/iziModal.min.css"
	rel="stylesheet" /> --%>

<!-- Colors -->
<link href="${resPath}/user_backyard/css/css-index.css" rel="stylesheet"
	media="screen" />

<!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
<!-- <link href="css/css-index-yellow.css" rel="stylesheet" media="screen"> -->

<!-- Jquery -->

<!-- /.javascript files -->
<script src="${resPath}/user_backyard/js/jquery.js"></script>
<script src="${resPath}/user_backyard/js/bootstrap.min.js"></script>
<script src="${resPath}/user_backyard/js/custom.js"></script>
<script src="${resPath}/user_backyard/js/jquery.sticky.js"></script>
<script src="${resPath}/user_backyard/js/wow.min.js"></script>
<script src="${resPath}/user_backyard/js/bootstrap3-typeahead.min.js"></script>
<script src="${resPath}/user_backyard/js/owl.carousel.min.js"></script>
<script src="${resPath}/user_backyard/js/home_selectors_dict.js" type="text/javascript" async="async"></script>
<script src="${resPath}/user_backyard/js/home_animate.js"></script>
<script src="${resPath}/user_backyard/js/velocity.min.js"></script>
<script src="${resPath}/user_backyard/js/velocity.ui.js"></script>
<%-- <script src="${resPath}/user_backyard/js/iziModal.min.js"></script> --%>

<!--Full Calendar-->
<link href="${resPath}/fullcalendar/fullcalendar.min.css"
	rel="stylesheet">
<link href="${resPath}/fullcalendar/fullcalendar.print.min.css"
	rel="stylesheet" media="print">
<script src="${resPath}/fullcalendar/moment.min.js"></script>
<script src="${resPath}/fullcalendar/fullcalendar.min.js"></script>


<script src="${resPath}/jslib/angular.min.js"></script>

<!-- Google Fonts -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

<!-- Initial CSS -->
<style>
#schedule-reservation-result {
	max-width: 900px;
	margin: 0 auto;
}
.fc-content, .fc-bg,  .fc-widget-content .fc-list-item-title{
	cursor: pointer;
}
</style>
<!-- / Initial CSS -->

<!-- Initial Script -->
<script>
	/* User Properties .. with Some Data of Session's ${EL}.[Global] */
	var thisStaff = {staffId: "${thisStaff.staffId}" , name: "${thisStaff.name}", nameLocale: "${thisStaff.nameLocale!=null?thisStaff.email:'-'}", email: "${thisStaff.email!=null?thisStaff.email:'-'}", tel: "${thisStaff.tel!=null?thisStaff.tel:'-'}", mobileTel: "${thisStaff.mobileTel!=null?thisStaff.mobileTel:'-'}"};
	var calendar; //Holding Calendar Object.[Global]
	var events //[Global];
	$("document").ready(function() {
		$.ajax({
			"type" : "post",
			"url" : "reservation/all",
			"success" : function(response) {
				events = response;
				calendar = $('#schedule-reservation-result').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaDay,listWeek'
					},
					allDaySlot : false,
					slotEventOverlap : false,
					slotLabelFormat:"HH:mm",
				    timeFormat: 'HH:mm',
					defaultDate : moment(),
					navLinks : true, // can click day/week names to navigate views
					eventLimit : true, // allow "more" link when too many events
					eventClick: function(calReservation, jsEvent, view) {
						viewDetail(calReservation);
				        // change the border color just for fun
				        $(this).css('border-color', '#fff');

				    }
				});
				//Load a List of Room Data.
				$.ajax({
					"type" : "post",
					"url" : "findRoom/findAllRooms",
					"success" : function(results){
						$.when(addRoomUsageDetail(events, results)).then(function(events){
							console.log(events);
							renderCalendar(calendar, events, true);
						});
					},
					"error" : function(err){
						alert("No Room Data Available.");
					}
				});
			}
		}); //Hold a Total Room Usages.

	});
</script>
<!-- /Initial Script -->
</head>

<body data-spy="scroll" data-target="#navbar-scroll">

	<!-- /.preloader -->
	<div id="preloader"></div>
	<div id="top"></div>

	<!-- /.parallax full screen background image -->
	<div class="fullscreen landing parallax"
		style="background-image:url('${resPath}/user_backyard/images/bg.jpg');"
		data-img-width="2000" data-img-height="1333" data-diff="100">

		<div class="overlay">
			<div class="container">
				<div class="row">
					<div class="col-md-7">

						<!-- /.logo -->
						<div class="logo wow fadeInDown">
							<a href=""><img
								src="${resPath}/user_backyard/images/logo.png" alt="logo" /></a>
						</div>


						<!-- /.main title -->
						<h1 class="wow fadeInLeft">MST Room Reservation</h1>

						<!-- /.header paragraph -->
						<div class="landing-text wow fadeInUp">
							<c:choose>
								<c:when test="${thisAccess==null}">
									<p>Make a room reservation easier to anywhere and anytime.</p>
								</c:when>
								<c:otherwise>
									<p>Welcome ${thisStaff.name}</p>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- /.header button -->
						<div class="head-btn wow fadeInLeft">
							<a href="#schedule" class="btn-primary">Scheduler</a>
							<c:if test="${thisStaff != null}">
								<a href="#available" class="btn-default">My Reservation</a>
							</c:if>
						</div>
						<br /> <br />
					</div>

					<!-- /.signup form -->
					<div class="col-md-5">
						<c:if test="${thisStaff == null}">
							<div class="signup-header wow fadeInUp">
								<h3 class="form-title text-center">GET STARTED</h3>
								<form class="form-header" action="login" role="form"
									method="POST" id="#">
									<input type="hidden" name="u" value="503bdae81fde8612ff4944435" />
									<input type="hidden" name="id" value="bfdba52708" />
									<div class="form-group">
										<input class="form-control input-lg" name="staffId"
											id="input-signin-staffid" type="text" placeholder="Staff ID"
											required="required" value="M00000" />
									</div>
									<div class="form-group">
										<input class="form-control input-lg" name="password"
											id="input-signin-password" type="password"
											placeholder="Password" required="required" value="kogy9i8u" />
									</div>
									<div class="form-group last">
										<input type="submit" class="btn btn-warning btn-block btn-lg"
											value="SIGN IN" />
									</div>
									<p  class="privacy text-center" style="color:red"><b hidden id="b-invalid-login-msg">${loginMsg}</b></p>
									<script type="text/javascript">setTimeout(() => {
										$("#b-invalid-login-msg").fadeIn();
									}, 1800);</script>
								</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- NAVIGATION -->
	<div id="menu">
		<nav class="navbar-wrapper navbar-default" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-backyard">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand site-name" href="#top"><img
						src="${resPath}/user_backyard/images/logo2.png" alt="logo" /></a>
				</div>

				<div id="navbar-scroll"
					class="collapse navbar-collapse navbar-backyard navbar-right">
					<ul class="nav navbar-nav">
						<li><a href="#schedule">Schedule</a></li>
						<c:if test="${thisStaff != null}">
							<li><a href="#available">My Reservation</a></li>
						</c:if>
						<li><a href="#contact">Contact</a></li>
						<c:if test="${thisStaff != null}">
							<li><a href="logout" style="color: red">Logout</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<hr />
	<!-- /.schedule section -->
	<div id="schedule" ng-app="reservationScheduler" ng-controller="contRs">
		<div class="container">
			<h2 class="wow fadeInLeft">Reservation Scheduler</h2>
			<p>Check for a Reservation's Queues.</p>
			<div class="row">
			<c:if test="${thisStaff != null}">
					<div class="col-sm-3">
						<select id="select-schedule-search-mode">
							<option value="name">Room Name</option>
							<option value="period">Time Period</option>
						</select>
						<script type="text/javascript">
							/* #select-schedule-search-mode : Schedule Search's Mode Listener that Performs How Searching Input will be Displayed. */
							$("#select-schedule-search-mode").change(function(){
								var nameSearchInputSec = $("#div-form-group-search-room");
								var periodSearchInputSec = $("#div-form-group-search-period");
								var reservationScheduleSec = $("#schedule-reservation-result");
								var roomTableSec = $("#table-reservation-result");
								switch($(this).val()){
									case "name" : periodSearchInputSec.css("display", "none");
										$("#div-detail-and-reserve").hide().fadeIn();
										roomTableSec.css("display", "none");
										nameSearchInputSec.css("display", "block");
										reservationScheduleSec.css("display", "block");
										calendar.fullCalendar('changeView', 'month');
										$("#btn-see-all").show();
									break;
									case "period" : periodSearchInputSec.css("display", "block");
									$("#btn-see-all").hide();
										$("#div-detail-and-reserve").fadeOut().css("display", "none");
										roomTableSec.css("display", "block");
										nameSearchInputSec.css("display", "none");
										reservationScheduleSec.css("display", "none");
										updateAvailableRoomTable($("#schedule-search-date-room"), $("#schedule-search-period-start").val(), $("#schedule-search-period-end").val(), $("#tbody-available-room-detail"));
									break; 
								}
							});
						</script>
					</div>
					<div class="col-sm-9">
						<div class="alert alert-warning" hidden id="alert-validate-search-time-period">
							   <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							   <span id="span-search-time-period-msg">Indicates a warning that might need attention.</span>
						</div>
					</div>
			</c:if>
			</div>
			<div class="row">
				<!-- /.schedule image -->
				<div class="col-md-3 intro-pic wow slideInLeft">
					<button onclick="refreshCalendar(true);" class="btn" disabled id="btn-see-all"><i class="glyphicon glyphicon-eye-open"></i> View All</button>
					<br />
					<div class="form-group" id="div-form-group-search-room">
						<label class='form-label'>Room: </label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-search"></i></span> <input
								class='form-control' id='schedule-search-room' placeholder="Search by room name" />
						</div>
					</div>
					<div class="form-group" id="div-form-group-search-period" style="display: none;">
						<label class='form-label'>Period: </label>
							<div class="row">
								<div class="col-sm-5"><input class='form-control' id='schedule-search-period-start' type="time" min="08:00" max="17:00" step="1800" /></div>
								<div class="col-sm-2">To</div>
								<div class="col-sm-5"><input class='form-control' id='schedule-search-period-end' type="time" min="08:00" max="17:00" step="1800" /></div>
						</div>
					</div>
					<input type="date" id="schedule-search-date-room"
						class='form-control' value="{{current}}" />
					<div id="div-detail-and-reserve">
						<c:if test="${thisStaff != null}">
							<hr />
							<button id="btn-reserve" hidden="">
								<i class="glyphicon glyphicon-plus"></i>Reserve</button>
						</c:if>
						<hr />
						<div class="row">
							<table class="table table-striped" id="table-room-details"></table>
						</div>
					</div>
				</div>
				<div class="col-md-9 intro-pic wow slideInRight">
					<div id="schedule-reservation-result"></div>
					<div id="table-reservation-result" style="display: none; width: 100%;" >
						<table class="table table-hover table-striped table-responsive">
							<thead>
								<tr>
									<th>Room Name</th>
									<th>Address</th>
									<th>Description</th>
								</tr>
							</thead>
							<tbody id="tbody-available-room-detail">
								<tr><td colspan="3"><img src="${resPath}/images/plsselectdate.jpg" alt="Please Specify Date & Time" width="100%" /></td></tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 				<div class="col-md-9 intro-pic wow slideInRight"  style="display: none;">
					<div id="schedule-reservation-result" class=""></div>
				<div id="table-reservation-result"></div> -->
				<!--Room Schedule content-->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var room; //Selected Room Object.[Global]
		var rooms; // Total Rooms.[Global]
		var roomMap = []; //Map Object for Typeahead.[Global]
		var roomInput = $("#schedule-search-room"); //Room Search Input.  
		var reservationScheduler = angular.module("reservationScheduler", []);
		reservationScheduler.controller("contRs", function($scope, $http) {
			$scope.current = new Date().toISOString().split("T")[0];
			$http({"url" : "findRoom/byRoomsName", "method": "POST", "params" : {available : false}}).then(function(response) {
				rooms = response.data;
				<c:if test="${thisStaff != null}">
				setUpMyReservationTable(rooms);
				</c:if>
				/* $ */
				/* Filter Available Rooms for TypeAhead. */
				$.when(getAvailableRooms(rooms)).then(function(arooms){
					$.each(arooms, function(index, val) {
						roomMap.push({
							id : val.roomId,
							name : val.roomName
						});
					});
					roomInput.typeahead({
						source : roomMap
					});
				});
			});
		});
		roomInput.change(function() {
			var current = roomInput.typeahead("getActive");
			$.each(rooms, function(index, val) {
				if (current.id == val.roomId) {
					room = val;
					$.ajax({
						"type" : "post",
						url : "reservation/getRsvByRoomId",
						"data" : {
							roomId : val.roomId
						},
						"success" : function(response) {
							renderCalendar(calendar, response, false); 
						}
					});
					appendRoomDetail(val);
				}
			});
			$("#btn-see-all").prop("disabled", false);
		});
		
		/* #schedule-search-period-start, #schedule-search-period-end : When Seacrh By Period Input (start-end) Changed. */
		$("#schedule-search-period-start, #schedule-search-period-end, #schedule-search-date-room").change(function(){
			var start = $("#schedule-search-period-start").val();
			var end = $("#schedule-search-period-end").val();
			var date = $("#schedule-search-date-room").val();
			var alertSearchTimePeriod = $("#alert-validate-search-time-period");
			var spanSearchPeriodMsg = $("#span-search-time-period-msg");
			var tbodyAvailableRoomDetail = $("#tbody-available-room-detail");
			var availableOnPeriodRooms = [];
			if(start == "" && end == ""){
				alertSearchTimePeriod.fadeIn();
				spanSearchPeriodMsg.html("Please specify a time period");
			} /* else if(start != "" && end == "" ) {
				alertSearchTimePeriod.fadeIn();
				spanSearchPeriodMsg.html("Please Select the end time.");
			} */ else if (start != "" && end != "") {
				if(moment(start, "HH:mm").isBefore(moment(end, "HH:mm"))){
					updateAvailableRoomTable(date, start.concat(":00"), end.concat(":00"), tbodyAvailableRoomDetail);
					alertSearchTimePeriod.fadeOut();
				} else {
					alertSearchTimePeriod.fadeIn();
					spanSearchPeriodMsg.html("End-time must be after Start-time.");
				}
			} else if (start == "" && end != "") {
				alertSearchTimePeriod.fadeIn();
				spanSearchPeriodMsg.html("Start-time is required");
			}
		});
		/* #btn-see-all : When is was clicked by User the Full-calender will Refetch and Render the  Data into Full-calendar. */
		$("#btn-see-all").click(function(){
			refreshCalendar(true);
			$("#schedule-search-room").val("");
			$("#table-room-details, #btn-reserve").fadeOut();
			$(this).prop("disabled", true);
		});
	</script>
	<hr />

	<c:if test="${thisStaff != null}">
		<link href="${resPath}/datatable/jquery.dataTables.min.css"
			rel="stylesheet" />
		<script src="${resPath}/datatable/jquery.dataTables.min.js"></script>
		<!-- /.available section -->
		<div id="available">
			<div class="container">
				<h2>My Reservation</h2>
				<p></p>
				<div class="row row-feat">
					<!--Datatable content-->
					<table id="table-my-reserve">
						<thead>
							<tr>
								<th>Date</th>
								<th>Period</th>
								<th>Room</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
		<hr />
		<script>
		var mReservations;
		var mReserveTable;
 		/* Initialize [My] Reservation's Table */
 		function setUpMyReservationTable(rooms){
 			$.ajax({
 				"type" : "post",
 				"url" : "reservation/getRsvByStaffId",
 				"data" : {staffId : thisStaff.staffId, pass : false},
 				"success" : function(response){
 					mReservations = response;
 					$.each(mReservations, function(index, roomUsage){
 						addRoomUsageDetailById(roomUsage.roomId, rooms, roomUsage);
 					});
 					if(mReserveTable == undefined){
	 					mReserveTable = $("#table-my-reserve").DataTable({ //! Show Room's name instead of Room's Id.
	 						"data" : mReservations,
	 						"order" : [[0, "asc"],[1, "asc"]],
	 						"columns" : [{data: "reservedDate", width : "10%"}, {width : "20%", "orderable": false}, {data: "room.roomName", width : "50%", "orderable": false}, {width : "20%", "orderable": false}],
	 						"columnDefs" : [{
	 							targets : -1,
	 							defaultContent : "<button class='btn-m-reserve-detail'><i class='glyphicon glyphicon-search'></i></button> &nbsp;"+
	 							"<button class='btn-m-reserve-edit'><i class='glyphicon glyphicon-pencil'></i></button>"
	 						},{
	 							targets : 1,
	 							render : function(url, type, row, meta){
									return (row.accessBegin.substring(0,5) + " - " + row.accessUntil.substring(0,5)); 
								}
	 						}], 
	 						"language": {
	 						      "emptyTable": "Reservation is Empty"
	 					    }
	 					});
 					} else  {
 						mReserveTable.clear().draw();
 						mReserveTable.rows.add(mReservations);
 						mReserveTable.columns.adjust().draw();
 					}
 				}
 			}); 
 		}
		</script>
	</c:if>

	<!-- /.contact section -->
	<div id="contact">
		<div class="contact fullscreen parallax"
			style="background-image: url('images/bg.jpg');" data-img-width="2000"
			data-img-height="1334" data-diff="100">
			<div class="overlay">
				<div class="container">
					<div class="row contact-row">

						<!-- /.address and contact -->
						<div class="col-sm-5 contact-left wow fadeInUp">
							<h2>
								<span class="highlight">Get</span> in touch
							</h2>
							<ul class="ul-address">
								<li><i class="pe-7s-map-marker"></i>Reservation Operating Location</li>
								<li><i class="pe-7s-phone"></i>Operating Officer Tel.</li>
								<li><i class="pe-7s-mail"></i><a
									href="mailto:info@yoursite.com">operatinOfficer@mail.com</a></li>
								
							</ul>
						</div>

						<!-- /.contact form -->
						<div class="col-sm-7 contact-right">
							<form method="POST" id="contact-form" class="form-horizontal"
								action="utils/inform"
								onSubmit="alert( 'Thank you to inform us the Problem. An Informed Message will be sent to the Administrator.' );">
								<input type="hidden" name="byStaffId" value="${thisStaff.staffId}" />
								<div class="form-group">
									<input type="text" name="title" id="input-inform-title"
										class="form-control wow fadeInUp" placeholder="Title"
										required="required" maxlength="100" />
								</div>
								
								<div class="form-group">
									<textarea name="message" rows="20" cols="20" id="input-inform-message"
										class="form-control input-message wow fadeInUp"
										placeholder="Message" required="required" maxlength="500"></textarea>
								</div>
								<div class="form-group">
									<input type="submit" name="submit" value="Submit"
										class="btn btn-success wow fadeInUp" />
								</div>
							</form>
							<!-- viJhk\rI -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /.footer -->
	<footer id="footer">
		<div class="container">
			<div class="col-sm-4 col-sm-offset-4">
				<!-- /.social links -->
				<!-- <div class="social text-center">
					<ul>
						<li><a class="wow fadeInUp" href="https://twitter.com/"><i
								class="fa fa-twitter"></i></a></li>
						<li><a class="wow fadeInUp" href="https://www.facebook.com/"
							data-wow-delay="0.2s"><i class="fa fa-facebook"></i></a></li>
						<li><a class="wow fadeInUp" href="https://plus.google.com/"
							data-wow-delay="0.4s"><i class="fa fa-google-plus"></i></a></li>
						<li><a class="wow fadeInUp" href="https://instagram.com/"
							data-wow-delay="0.6s"><i class="fa fa-instagram"></i></a></li>
					</ul>
				</div> -->
				<div class="text-center wow fadeInUp" style="font-size: 14px;">
					Copyright Backyard 2015 - Template by <a
						href="http://bootstrapthemes.co/" target="_blank">BootstrapThemes</a>
				</div>
				<a href="#" class="scrollToTop"><i class="pe-7s-up-arrow pe-va"></i></a>
			</div>
		</div>
	</footer>
	<jsp:include page="include/modal_reservation.jsp" flush="false"></jsp:include>
	<jsp:include page="include/modal_reservation_detail.jsp"></jsp:include>
	<jsp:include page="include/modal_mreservation_detail.jsp"></jsp:include>


	<!-- Function -->
	<script>

	/** renderCalendar : Render Reservations (Events) into Full Calendar. **/
		function renderCalendar(calendar, roomUsages, isRoomNameOnEvent) {
			events = []; //Empty Pervious.
			$.each(roomUsages, function(index, val) {
				var title = isRoomNameOnEvent?(val.room.roomName):val.purpose;
				events.push({
					id : val.usageId,
					title : title,
					reservedDate : val.reservedDate,
					start : getISODateTime(val.reservedDate, val.accessBegin),
					end : getISODateTime(val.reservedDate, val.accessUntil),
					accessBegin : val.accessBegin,
					accessUntil : val.accessUntil,
					roomId : val.roomId,
					byStaffId : val.byStaffId,
					purpose : val.purpose,
					note : val.note
				});
			});
			calendar.fullCalendar('removeEvents');
			calendar.fullCalendar('addEventSource', events);
			calendar.fullCalendar({
				eventClick : function(calEvent, jsEvent, view) {
					alert(calEvent.title);
				}
			});
		}

		/** refreshCalendar : To Refresh new Data and push them into Full-calendar. **/
		function refreshCalendar(isHardRefresh){
			if(isHardRefresh){
				$.ajax({
					"type" : "post",
					"url" : "reservation/all",
					"success" : function(results) {
						events = results;
						$.when(addRoomUsageDetail(events, rooms)).then(function(events){
							renderCalendar(calendar, events, true); //CONCERNED.
						});
					}
				});
			}
		}
	
		/** getISODateTime : ISO8601 Format Builder for Full Calendar start-end Compatable . **/
		function getISODateTime(date, time) {
			return $.fullCalendar.moment.utc(date + "T" + time);
		}
		/** appendRoomDetail : Display Room's Detail on Selected Room on #table-room-details. **/
		function appendRoomDetail(room) {
			var tableRoomDetails = $("#table-room-details");
			var roomtableContent = $("<tr><td><b>Room</b></td><td>"
					+ room.roomName
					+ "</td></tr><tr><td><b>Building</b></td><td>"
					+ room.building + "</td></tr><tr><td><b>Floor</b></td><td>"
					+ room.floor + "</td></tr>");
			$("#btn-reserve").hide().fadeIn();
			tableRoomDetails.empty();
			tableRoomDetails.html(roomtableContent).hide().fadeIn();
		}
		/** #schedule-search-date-room LISTENER : Jump to Specific Date on Full calendar. **/
		$("#schedule-search-date-room").change(function() {
			calendar.fullCalendar("gotoDate", $(this).val());
			calendar.fullCalendar('changeView', 'agendaDay');
			//Make Highlight
		});
		/** addRoomUsageDetailById : Use for get Information by Room Id. **/
		/* Ps. addRoomUsageDetailById is "Optional" Parameter to be appended Room's Object. */
		function addRoomUsageDetailById(roomId, rooms, roomUsage){
			//Better $.each and $.each mReservations.
			$.each(rooms , function(index, val){
				if(val.roomId == roomId){
					if(roomUsage !== undefined){roomUsage["room"] = val;}
					return val;
				}
			});
			return null;
		}
		
		/* addRoomUsageDetail : Seem 'addRoomUsageDetailById' But Done by 'rooms' and 'roomUsages' */
		function addRoomUsageDetail(roomUsages, rooms){
			//Better $.each and $.each mReservations.
			var reservations = [];
			$.each(roomUsages, function(index, roomUsage){
				$.each(rooms , function(index, room){
					if(room.roomId == roomUsage.roomId){
						roomUsage["room"] = room;
						reservations.push(roomUsage);
					}
				});
			});
			return reservations;
		}
		
		/** getAvailableRooms : Filter the Available Rooms from a Total Rooms. **/
		function getAvailableRooms(rooms){
			var availableRooms = [];
			$.each(rooms , function(index, room){
				if(room.isAvailable == true){
					availableRooms.push(room);
				}
			});
			return availableRooms;
		}
		
		/** updateAvailableRoomTable : Make Available Room's Table Data Up to Specify Date-time. **/
		function updateAvailableRoomTable(date, start, end, tbodyAvailableRoomDetail){
			if(start != "" && end != "" && date != ""){
				$.ajax({
					"url" : "reservation/getAvailableRoomByDateTime",
					"data" : {date : date, start: start , end : end},
					"success" : function(results){
							var roomName, roomAddress, description, rowData;
						tbodyAvailableRoomDetail.empty();
						$.each(results , function(index, room){
								roomName = room.roomName+(room.roomCode==null?"":("("+room.roomCode+")"));
							roomAddress = "Building : "+room.building+", Floor : "+room.floor;
							description = room.description;
							rowData = $("<tr><td>"+roomName+"</td><td> "+roomAddress+"</td><td>"+description+"</td></tr>")
							tbodyAvailableRoomDetail.append(rowData.click(function(){
								$("#input-reserve-date").val(date);
								$("#input-reserve-start").val(start);
								$("#input-reserve-end").val(end);
								$("#btn-reservation-submit").prop("disabled", false);
								renderReservationModal(room, false);
							}));
						});
					}
				});
			}
		}
		</script>
	<!-- /Function -->
	<script>
		new WOW().init();
	</script>
	<%-- 	<link href="${resPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" media="screen" />
<script src="${resPath}/bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="${resPath}/bootstrap/js/bootstrap.min.js"></script> --%>
</body>

</html>