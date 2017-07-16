<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@page contentType="text/html; charset=UTF-8"%>
<c:set var="resPath"
	value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Login - MST Room Reservation's Administrator Panel</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="${resPath}/admin_vamp/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${resPath}/admin_vamp/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="${resPath}/admin_vamp/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="${resPath}/admin_vamp/css/style.css" rel="stylesheet" type="text/css">
<link href="${resPath}/admin_vamp/css/pages/signin.css" rel="stylesheet" type="text/css">

</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="../">
				MST Room Reservation		
			</a>			
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container">
	
	<div class="content clearfix">
		
		<form action="login" method="post">
		
			<h1>Administrator Login</h1>		
			
			<div class="login-fields">
				
				<p>Please provide your details</p>
				
				<div class="field">
					<label for="username">Staff ID</label>
					<input type="text" id="username" name="staffId" value="M00000" placeholder="Staff Id" class="login username-field" required />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Password:</label>
					<input type="password" id="password" name="password" value="kogy9i8u" placeholder="Password" class="login password-field" required />
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
<!-- 				<span class="login-checkbox">
					<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Keep me signed in</label>
				</span>	 -->		
				<button class="button btn btn-success btn-large">Sign In</button>
				
			</div> <!-- .actions -->
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->


<script src="${resPath}/admin_vamp/js/jquery-1.7.2.min.js"></script>
<script src="${resPath}/admin_vamp/js/bootstrap.js"></script>

<script src="${resPath}/admin_vamp/js/signin.js"></script>
<script type="text/javascript">
	$("#")
</script>
</body>

</html>
