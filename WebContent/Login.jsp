<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<!-- BOOTSTRAP CDN -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<!-- META -->
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

		<!-- CSS FILES-->
		<link rel="stylesheet" href="css/style.css" type="text/css" media="all">

		<!-- FONTS-->	
		<link href="https://fonts.googleapis.com/css?family=Dosis|Open+Sans:300,400,600,700,800|Oswald:300,400,700" rel="stylesheet">	
	</head>

	<body>
		<div id="main" class="col-sm-12">
			<div id="header" class="col-sm-12">
			</div>

			<div id="loginForm" class="container">
				<div id="classcolLogo" class="col-sm-12">
				</div>

				<div id="introtext">
					Your own virtual classroom by A11
				</div>

				<div id="form">
					<form class="form-horizontal"name="login" id="login" action="classroom.jsp">
						<input type = "text" id="text" name="email" placeholder="UserId">
						<br>
						<input type = "password" id="password_signup" name="password"placeholder="Password">
						<input type="submit" value="Sign in" id="loginButton">
					</form>

					
						
					
				</div>
			</div>	
		</div>
	</body>
</html>