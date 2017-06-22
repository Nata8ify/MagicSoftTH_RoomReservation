<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="resPath" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html  xmlns:th="http://www.thymeleaf.org">

<head>

    <!-- /.website title -->
    <title>Backyard Landing Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>

    <!-- CSS Files -->
    <link href="${resPath}/user_backyard/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <link href="${resPath}/user_backyard/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="${resPath}/user_backyard/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet"/>
    <link href="${resPath}/user_backyard/css/animate.css" rel="stylesheet" media="screen"/>
    <link href="${resPath}/user_backyard/css/owl.theme.css" rel="stylesheet"/>
    <link href="${resPath}/user_backyard/css/owl.carousel.css" rel="stylesheet"/>

    <!-- Colors -->
    <link href="${resPath}/user_backyard/css/css-index.css" rel="stylesheet" media="screen"/>
    <!-- <link href="css/css-index-green.css" rel="stylesheet" media="screen"> -->
    <!-- <link href="css/css-index-purple.css" rel="stylesheet" media="screen"> -->
    <!-- <link href="css/css-index-red.css" rel="stylesheet" media="screen"> -->
    <!-- <link href="css/css-index-orange.css" rel="stylesheet" media="screen"> -->
    <!-- <link href="css/css-index-yellow.css" rel="stylesheet" media="screen"> -->

    <!--Full Calendar-->
    <link href="${resPath}/fullcalendar/fullcalendar.min.css" rel="stylesheet"/>
    <link href="${resPath}/fullcalendar/fullcalendar.print.css" rel="stylesheet"/>


    <!-- Google Fonts -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic"
    />

</head>

<body data-spy="scroll" data-target="#navbar-scroll">

    <!-- /.preloader -->
    <div id="preloader"></div>
    <div id="top"></div>

    <!-- /.parallax full screen background image -->
    <div class="fullscreen landing parallax" style="background-image:url('../../resources/user_backyard/images/bg.jpg');" data-img-width="2000"
        data-img-height="1333" data-diff="100">

        <div class="overlay">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">

                        <!-- /.logo -->
                        <div class="logo wow fadeInDown">
                            <a href=""><img src="../../resources/user_backyard/images/logo.png" alt="logo"/></a>
                        </div>

                        <!-- /.main title -->
                        <h1 class="wow fadeInLeft">
                            MST Room Reservation
                        </h1>

                        <!-- /.header paragraph -->
                        <div class="landing-text wow fadeInUp">
                            <p>Make a room reservation easier to anywhere and anytime.</p>
                        </div>

                        <!-- /.header button -->
                        <div class="head-btn wow fadeInLeft">
                            <a href="#schedule" class="btn-primary">Schedules</a>
                            <a href="#available" class="btn-default">My Booking -L</a>
                        </div>
                    </div>

                    <!-- /.signup form -->
                    <div class="col-md-5">

                        <div class="signup-header wow fadeInUp">
                            <h3 class="form-title text-center">GET STARTED</h3>
                            <form class="form-header" action="http://moxdesign.us10.list-manage.com/subscribe/post" role="form" method="POST" id="#">
                                <input type="hidden" name="u" value="503bdae81fde8612ff4944435"/>
                                <input type="hidden" name="id" value="bfdba52708"/>
                                <div class="form-group">
                                    <input class="form-control input-lg" name="staffid" id="input-signin-staffid" type="text" placeholder="Staff ID" required="required" />
                                </div>
                                <div class="form-group">
                                    <input class="form-control input-lg" name="password" id="input-signin-password" type="password" placeholder="Password" required="required" />
                                </div>
                                <div class="form-group last">
                                    <input type="submit" class="btn btn-warning btn-block btn-lg" value="SIGN IN"/>
                                </div>
                                <p class="privacy text-center">We will not share your email. Read our <a href="privacy.html">privacy policy</a>.</p>
                            </form>
                        </div>

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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-backyard">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    <a class="navbar-brand site-name" href="#top"><img src="../../resources/user_backyard/images/logo2.png" alt="logo"/></a>
                </div>

                <div id="navbar-scroll" class="collapse navbar-collapse navbar-backyard navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="#schedule">Schedule</a></li>
                        <li><a href="#available">My Booking</a></li>
                        <li><a href="#facilities">Facilities</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <hr/>
    <!-- /.schedule section -->
    <div id="schedule">
        <div class="container">
            <h2 class="wow fadeInLeft">Room Schedules</h2>
            <p>BODY</p>
            <div class="row">
                <!-- /.schedule image -->
                <div class="col-md-2 intro-pic wow slideInLeft">
                    <br/>
                    <div class="form-group">
                        <label class='form-label'>Room: </label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                            <input class='form-control' id='schedule-search-room' placeholder="" />
                        </div>
                    </div>
                    <hr/>
                    <input type="date" id="schedule-search-date-room" class='form-control' />
                </div>
                <div class="col-md-10 intro-pic wow slideInRight">
                    <div id="schedule-reservation-result"></div>
                </div>
                <!--Room Schedule content-->
            </div>
        </div>
    </div>
    <hr/>
    <!-- /.available section -->
    <div id="available">
        <div class="container">
            <h2>Available Room</h2>
            <p>BODY</p>
            <!--<div class="row">
                <div class="col-md-10 col-md-offset-1 col-sm-12 text-center fetaure-title">
                </div>
            </div>-->
            <div class="row row-feat">
                <!--Datatable content-->
                <div class="col-md-12 intro-pic wow slideInLeft">
                    <img src="../../resources/user_backyard/images/intro-image.jpg" alt="image" class="img-responsive"/>
                </div>
            </div>
        </div>
    </div>
    <hr/>
    <!-- /.facilities section -->
    <div id="facilities">
        <div class="container">
            <div>
                <h2 class="wow fadeInLeft">Facilities</h2>
                <p>BODY</p>
            </div>
            <div class="row">
                <!--Facilities content-->
                <div class="col-md-12 intro-pic wow slideInLeft">
                    <img src="../../resources/user_backyard/images/intro-image.jpg" alt="image" class="img-responsive"/>
                </div>
            </div>
        </div>
    </div>

    <!-- /.contact section -->
    <div id="contact">
        <div class="contact fullscreen parallax" style="background-image:url('images/bg.jpg');" data-img-width="2000" data-img-height="1334"
            data-diff="100">
            <div class="overlay">
                <div class="container">
                    <div class="row contact-row">

                        <!-- /.address and contact -->
                        <div class="col-sm-5 contact-left wow fadeInUp">
                            <h2><span class="highlight">Get</span> in touch</h2>
                            <ul class="ul-address">
                                <li><i class="pe-7s-map-marker"></i>1600 Amphitheatre Parkway, Mountain View<br/>
                                    California 55000
                                </li>
                                <li><i class="pe-7s-phone"></i>+1 (123) 456-7890<br/>
                                    +2 (123) 456-7890
                                </li>
                                <li><i class="pe-7s-mail"></i><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
                                <li><i class="pe-7s-look"></i><a href="#">www.yoursite.com</a></li>
                            </ul>

                        </div>

                        <!-- /.contact form -->
                        <div class="col-sm-7 contact-right">
                            <form method="POST" id="contact-form" class="form-horizontal" action="contactengine.php" onSubmit="alert( 'Thank you for your feedback!' );">
                                <div class="form-group">
                                    <input type="text" name="Name" id="Name" class="form-control wow fadeInUp" placeholder="Name" required="required" />
                                </div>
                                <div class="form-group">
                                    <input type="text" name="Email" id="Email" class="form-control wow fadeInUp" placeholder="Email" required="required" />
                                </div>
                                <div class="form-group">
                                    <textarea name="Message" rows="20" cols="20" id="Message" class="form-control input-message wow fadeInUp" placeholder="Message"
                                        required="required"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="submit" name="submit" value="Submit" class="btn btn-success wow fadeInUp" />
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
                        <li><a class="wow fadeInUp" href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                        <li><a class="wow fadeInUp" href="https://www.facebook.com/" data-wow-delay="0.2s"><i class="fa fa-facebook"></i></a></li>
                        <li><a class="wow fadeInUp" href="https://plus.google.com/" data-wow-delay="0.4s"><i class="fa fa-google-plus"></i></a></li>
                        <li><a class="wow fadeInUp" href="https://instagram.com/" data-wow-delay="0.6s"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
                <div class="text-center wow fadeInUp" style="font-size: 14px;">Copyright Backyard 2015 - Template by <a href="http://bootstrapthemes.co/" target="_blank">BootstrapThemes</a></div>
                <a href="#" class="scrollToTop"><i class="pe-7s-up-arrow pe-va"></i></a>
            </div>
        </div>
    </footer>

    <!-- /.javascript files -->
    <script src="${resPath}/user_backyard/js/jquery.js"></script>
    <script src="${resPath}/user_backyard/js/bootstrap.min.js"></script>
    <script src="${resPath}/user_backyard/js/custom.js"></script>
    <script src="${resPath}/user_backyard/js/jquery.sticky.js"></script>
    <script src="${resPath}/user_backyard/js/wow.min.js"></script>
    <script src="${resPath}/user_backyard/js/owl.carousel.min.js"></script>
    <script src="${resPath}/fullcalendar/lib/moment.min.js"></script>
    <script src="${resPath}/fullcalendar/fullcalendar.min.js"></script>
    <!--Full Calender Scripts-->
    <script>
        $('#schedule-reservation-result').fullCalendar({
            // put your options and callbacks here
        });
    </script>
    <script>
        new WOW().init();
    </script>


</body>

</html>