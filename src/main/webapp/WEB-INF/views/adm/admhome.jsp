
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@page contentType="text/html; charset=UTF-8"%>
<c:set var="resPath"
	value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<title>MST Room Reservation Administrator Panel</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<link href="${resPath}/admin_vamp/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${resPath}/admin_vamp/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet" />
<link href="${resPath}/admin_vamp/css/font-awesome.css"
	rel="stylesheet" />
<link href="${resPath}/admin_vamp/css/style.css"
	rel="stylesheet" />
<link href="${resPath}/admin_vamp/css/pages/dashboard.css"
	rel="stylesheet" />
<link href="${resPath}/datatable/jquery.dataTables.min.css" rel="stylesheet" />
<script src="${resPath}/jslib/jquery-3.2.1.min.js"></script>
<script src="${resPath}/datatable/jquery.dataTables.min.js"></script>

<!-- Custom -->
<link
	href="${resPath}/admin_vamp/css/custom_report.css"
	rel="stylesheet" />
</head>

<body>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span> </a><a
					class="brand" href="index.html">MST Room Reservation's Administrator Panel</a>
				<div class="nav-collapse">
					<ul class="nav pull-right">
						<li class="dropdown"><a href="logout"><i class="icon-logout"></i>Logout</a></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- /container -->
		</div>
		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
	<div class="subnavbar">
		<div class="subnavbar-inner">
			<div class="container">
				<ul class="mainnav">
					<li ${include != 'dashboard'?'':'class="active"'}><a href="dashboard"><i
							class="icon-list-alt"></i><span>Dashboard</span> </a></li>
					<li ${include != 'report'?'':'class="active"'}><a href="report"><i class="icon-bar-chart"></i><span>Report</span>
					</a></li>
					<li ${include != 'roommng'?'':'class="active"'}><a href="roommng"><i class="icon-pencil"></i><span>Room
								Management</span> </a></li>
					<li ${include != 'facilimng'?'':'class="active"'}><a href="facilimng"><i class="icon-facetime-video"></i><span>Facilities</span>
					</a></li>
					<li ${include != 'setting'?'':'class="active"'}><a href="setting"><i class="icon-setting"></i><span>Application Setting</span>
					</a></li>
				</ul>
			</div>
			<!-- /container -->
		</div>
		<!-- /subnavbar-inner -->
	</div>
	<jsp:include page="include/${include}.jsp"></jsp:include>
	<div class="extra">
		<div class="extra-inner">
			<div class="container">
				<div class="row">
					<div class="span3">
						<h4>About Free Admin Template</h4>
						<ul>
							<li><a href="javascript:;">EGrappler.com</a></li>
							<li><a href="javascript:;">Web Development ../resources</a></li>
							<li><a href="javascript:;">Responsive HTML5 Portfolio
									Templates</a></li>
							<li><a href="javascript:;">Free ../resources and Scripts</a></li>
						</ul>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /extra-inner -->
		</div>
		<!-- /extra -->
		<div class="footer">
			<div class="footer-inner">
				<div class="container">
					<div class="row">
						<div class="span12">
							&copy; 2013 <a href="#">Bootstrap Responsive Admin Template</a>.
						</div>
						<!-- /span12 -->
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /footer-inner -->
		</div>
	</div>
	<!-- /footer -->
	<!-- Le javascript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="${resPath}/admin_vamp/js/excanvas.min.js"></script>
	<script src="${resPath}/admin_vamp/js/velocity.min.js"
		type="text/javascript"></script>
	<script src="${resPath}/admin_vamp/js/velocity.ui.js"
		type="text/javascript"></script>	
	<script src="${resPath}/admin_vamp/js/bootstrap.js"></script>
	<script language="javascript" type="text/javascript"
		src="${resPath}/admin_vamp/js/full-calendar/fullcalendar.min.js"></script>
	<script src="${resPath}/admin_vamp/js/base.js"></script>
</body>

</html>