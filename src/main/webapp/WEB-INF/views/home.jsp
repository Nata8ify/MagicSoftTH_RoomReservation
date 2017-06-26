<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="resPath"
	value="${pageContext.request.contextPath}/resources" />
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

<!--Full Calendar-->
<link href="${resPath}/fullcalendar/fullcalendar.min.css" rel="stylesheet">
<link href="${resPath}/fullcalendar/fullcalendar.print.min.css" rel="stylesheet" media="print">
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
</style>
<!-- / Initial CSS -->

<!-- Initial Script -->
<script>
	var calendar; //Holding Calendar Object.
	var events;
	$("document").ready(function() {
		$.ajax({
			"url" : "findReservation/getAll",
			"success" : function(response) {
				console.log(response);
				events = response;
				calendar = $('#schedule-reservation-result').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaDay,listWeek'
					},
					allDaySlot : false,
					defaultDate : moment(),
					navLinks : true, // can click day/week names to navigate views
					editable : false, //fuck noo!.
					eventLimit : true, // allow "more" link when too many events
				});
				renderCalendar(calendar, events);
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
							<a href="#schedule" class="btn-primary">Schedules</a>
							<c:if test="${thisStaff != null}">
								<a href="#available" class="btn-default">My Booking</a>
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
											required="required" />
									</div>
									<div class="form-group">
										<input class="form-control input-lg" name="password"
											id="input-signin-password" type="password"
											placeholder="Password" required="required" />
									</div>
									<div class="form-group last">
										<input type="submit" class="btn btn-warning btn-block btn-lg"
											value="SIGN IN" />
									</div>
									<p class="privacy text-center">
										We will not share your email. Read our <a href="privacy.html">privacy
											policy</a>.
									</p>
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
							<li><a href="#available">My Booking</a></li>
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
			<h2 class="wow fadeInLeft">Room Schedules</h2>
			<p>Check for a Reservation's Queue.</p>
			<div class="row">
				<!-- /.schedule image -->
				<div class="col-md-3 intro-pic wow slideInLeft">
					<br />
					<div class="form-group">
						<label class='form-label'>Room: </label>
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-search"></i></span> <input
								class='form-control' id='schedule-search-room' placeholder="" />
						</div>
						<c:if test="${thisStaff != null}">
						<hr />
							<button>
								<i class="glyphicon glyphicon-plus"></i>Reserve
							</button>
						</c:if>
					</div>
					<hr />
					<input type="date" id="schedule-search-date-room"
						class='form-control' value="{{current}}" />
					<hr />
					<div class="row">
						<table class="table table-stripted" id="table-room-details"></table>
					</div>
				</div>
				<div class="col-md-9 intro-pic wow slideInRight">
					<div id="schedule-reservation-result"></div>
				</div>
				<!--Room Schedule content-->
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var room; //Selected Room Object.
		var rooms; // Total Rooms.
		var roomMap = []; //Map Object for Typeahead.
		var roomInput = $("#schedule-search-room"); //Room Search Input.  
		var reservationScheduler = angular.module("reservationScheduler", []);
		reservationScheduler.controller("contRs", function($scope, $http) {
			$scope.current = new Date().toISOString().split("T")[0];
			$http.get("findRoom/byRoomsName").then(function(response) {
				rooms = response.data;
				/* $ */
				$.each(rooms, function(index, val) {
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
		roomInput.change(function() {
			var current = roomInput.typeahead("getActive");
			$.each(rooms, function(index, val) {
				if (current.id == val.roomId) {
					$.ajax({
						url : "findReservation/getRsvByRoomId",
						"data" : {
							roomId : val.roomId
						},
						"success" : function(response) {
							renderCalendar(calendar, response); //val as room.
						}
					});
					appendRoomDetail(val);
				}
			});

		});
	</script>
	<hr />

	<c:if test="${thisStaff != null}">
		<!-- /.available section -->
		<div id="available">
			<div class="container">
				<h2>Room Reserving</h2>
				<p>Find Out and do Reserve the Room</p>
				<!--<div class="row">
                <div class="col-md-10 col-md-offset-1 col-sm-12 text-center fetaure-title">
                </div>
            </div>-->
				<div class="row row-feat">
					<!--Datatable content-->
					<div class="col-md-12 intro-pic wow slideInLeft">
						<img src="${resPath}/user_backyard/images/intro-image.jpg"
							alt="image" class="img-responsive" />
					</div>
				</div>
			</div>
		</div>
		<hr />
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
								<li><i class="pe-7s-map-marker"></i>1600 Amphitheatre
									Parkway, Mountain View<br /> California 55000</li>
								<li><i class="pe-7s-phone"></i>+1 (123) 456-7890<br /> +2
									(123) 456-7890</li>
								<li><i class="pe-7s-mail"></i><a
									href="mailto:info@yoursite.com">info@yoursite.com</a></li>
								<li><i class="pe-7s-look"></i><a href="#">www.yoursite.com</a></li>
							</ul>
						</div>

						<!-- /.contact form -->
						<div class="col-sm-7 contact-right">
							<form method="POST" id="contact-form" class="form-horizontal"
								action="contactengine.php"
								onSubmit="alert( 'Thank you for your feedback!' );">
								<div class="form-group">
									<input type="text" name="username" id="Name"
										class="form-control wow fadeInUp" placeholder="Name"
										required="required" />
								</div>
								<div class="form-group">
									<input type="text" name="email" id="Email"
										class="form-control wow fadeInUp" placeholder="Email"
										required="required" />
								</div>
								<div class="form-group">
									<textarea name="message" rows="20" cols="20" id="Message"
										class="form-control input-message wow fadeInUp"
										placeholder="Message" required="required"></textarea>
								</div>
								<div class="form-group">
									<input type="submit" name="submit" value="Submit"
										class="btn btn-success wow fadeInUp" />
								</div>
							</form>
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
				<div class="social text-center">
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
				</div>
				<div class="text-center wow fadeInUp" style="font-size: 14px;">
					Copyright Backyard 2015 - Template by <a
						href="http://bootstrapthemes.co/" target="_blank">BootstrapThemes</a>
				</div>
				<a href="#" class="scrollToTop"><i class="pe-7s-up-arrow pe-va"></i></a>
			</div>
		</div>
	</footer>


	<!-- Function -->
	<script>
		/** renderCalendar : Render Reservations (Events) into Full Calendar. **/
		function renderCalendar(calendar, roomUsages) {
			events = []; //Empty Pervious.
			console.log(roomUsages);
			$.each(roomUsages, function(index, val) {
				events.push({
					id : val.roomId,
					title : val.purpose,
					start : getISODateTime(val.reservedDate, val.accessBegin),
					end : getISODateTime(val.reservedDate, val.accessUntil)
				});
			});
			calendar.fullCalendar('removeEvents');
			calendar.fullCalendar('addEventSource', events);
		}

		/** getISODateTime : ISO8601 Format Builder for Full Calendar start-end Compatable . **/
		function getISODateTime(date, time) {
			return $.fullCalendar.moment.utc(date + "T" + time);
		}
		/** appendRoomDetail : Display Room's Detail on Selected Room on #table-room-details. **/
		function appendRoomDetail(room) {
			console.log(room);
			var roomtableContent = $("<tr><td><b>Room</b></td><td>"
					+ room.roomName
					+ "</td></tr><tr><td><b>Building</b></td><td>"
					+ room.building + "</td></tr><tr><td><b>Floor</b></td><td>"
					+ room.floor + "</td></tr>");
			var tableRoomDetails = $("#table-room-details");
			tableRoomDetails.empty();
			tableRoomDetails.html(roomtableContent).hide().fadeIn();
		}
		/** #schedule-search-date-room LISTENER : Jump to Specific Date on Full calendar. **/
		$("#schedule-search-date-room").change(function() {
			calendar.fullCalendar("gotoDate", $(this).val());
			//Make Highlight
		});
	</script>
	<!-- /Function -->
	<script>
		new WOW().init();
	</script>
</body>

</html>