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
<%-- <script src="${resPath}/user_backyard/js/iziModal.min.js"></script> --%>



<!-- Google Fonts -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />
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
					<div class="col-md-12 signup-header">
						<!-- /.main title -->
						<h1 class="wow fadeInLeft"><b>Oops.</b></h1>

						<!-- /.header paragraph -->
						<div class="landing-text wow fadeInUp" style="color: white;">
						<h2 class="wow fadeInLeft">Data Cannot be Accessed</h2>
							<h3>There are some possible causes below  ...</h3>
							<br/>
							<ul>
								<li> No Internet Connection or Unreachable.</li>
								<li> You have no Authorized to access the Data.</li>
								<li> Fatally Error on System Database. (This case may be possible if there are no problem on which one of two cases before.)</li>
							</ul>
						<br/>
						<a href="javascript:history.back();"><button style="color:black;">Back</button></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>