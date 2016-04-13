<!DOCTYPE html>
<html lang="es">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>iFactura</title>
	<!-- Bootstrap Core CSS -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="../css/login.css" rel="stylesheet">
	<link href="../css/animate-custom.css" rel="stylesheet"> 
	<!-- Custom Fonts -->
	<link href="../fonts/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body class="fade-in">
	<!-- Start Login box -->
	<div class="container" id="login-block">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4 animated flipInY">
				<div class="login-box clearfix" style="padding-top: 50px; padding-bottom: 50px;">
					<div class="login-logo">
						<img src="../images/login-logo.png" alt="Company Logo">
					</div> 
					<hr>
					<div class="login-form" style="margin-top: 16px;">
						<!-- Start Error box -->
						<div class="alert alert-danger hide">
							<button type="button" class="close" data-dismiss="alert"> ×</button>
							<h4>Error</h4>Mensaje de error
						</div>
						<!-- End Error box -->
						<form action="#" method="get">
							<input type="text" placeholder="Usuario o correo" class="input-field" required=""> 
							<input type="password" placeholder="Contraseña" class="input-field" required=""> 
							<button type="submit" class="btn btn-login">Login</button> 
						</form>
						<hr>
						<div style="width: 195px; margin: 0 auto;">
							<!--<c:if test="${user != null}">
								<c:out value="${user}" />
								<p>Puedes pulsar el siguiente enlace para salir</p>
							</c:if>
							<c:if test="${user == null}">
								<p>Puedes pulsar el siguiente enlace para registrarte</p>
							</c:if>-->
							<a class="btn azm-social azm-btn azm-border-bottom azm-google" href="<c:url value="${url}"/>">
								<i class="fa fa-google"></i>
								Login con Google
							</a>
						</div>
					</div>
				</div>
				<div class="login-links"> 
					<a href="https://hungerfreethemes.com/preview/login-pack1/login5/forgot-password.html?login-theme-1" style="padding: 10px 0 0 0;">
						¿Has olvidado tu contraseña?
					</a>
					<br>
					<a href="https://hungerfreethemes.com/preview/login-pack1/login5/sign-up.html?login-theme-1">
						¿No tienes una cuenta? <strong>Regístrate</strong>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- End Login box -->
	<footer class="container">
		<p id="footer-text"><small>Copyright © 2016 iFactura. Todos los derechos reservados</small></p>
	</footer>
	<!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>