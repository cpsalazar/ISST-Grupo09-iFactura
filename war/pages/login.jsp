<!DOCTYPE html>
<html lang="es">
<head>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
				<div class="login-box clearfix" style="padding-top: 40px; padding-bottom: 50px;">
					<div class="login-logo">
						<img src="../images/logo.png" alt="iFactura" style="width: 16vh;">
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
							<input type="text" placeholder="Correo electrónico" class="input-field" required=""> 
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
					<div class="register-form" style="margin-top: 16px; display: none;">
						<!-- Start Error box -->
						<div class="alert alert-danger hide">
							<button type="button" class="close" data-dismiss="alert"> ×</button>
							<h4>Error</h4>Mensaje de error
						</div>
						<!-- End Error box -->
						<form action="#" method="get">
							<input type="text" placeholder="Nombre y Apellidos" class="input-field" required=""> 
							<input type="text" placeholder="Correo electrónico" class="input-field" required=""> 
							<input type="password" placeholder="Contraseña" class="input-field" required="">
							<input type="password" placeholder="Confirmar contraseña" class="input-field" required=""> 
							<label class="checkbox">
								<input type="checkbox" value="option1" required=""> Acepto los <a href="">términos y condiciones</a>
							</label>
							<button type="submit" class="btn btn-login" style="margin-bottom: 0;">Registrarme</button> 
						</form>
					</div>
					<div class="password-form" style="margin-top: 16px; display: none;">
						<!-- Start Error box -->
						<div class="alert alert-danger hide">
							<button type="button" class="close" data-dismiss="alert"> ×</button>
							<h4>Error</h4>Mensaje de error
						</div>
						<!-- End Error box -->
						<form action="#" method="get">
							<p id="pw">Introduce tu correo electrónico y te enviaremos un enlace para resetear tu contraseña</p>
							<input type="text" placeholder="Correo electrónico" class="input-field" required=""> 
							<button type="submit" class="btn btn-login" style="margin-bottom: 0;">Enviar</button> 
						</form>
					</div>
				</div>
				<div class="login-links"> 
					<a href="#" id="password-form-link" style="padding: 10px 0 0 0;">
						<p style="margin: 0;">¿Has olvidado tu contraseña?</p>
					</a>
					<a href="#" id="login-form-link" style="padding: 10px 0 0 0; display:none;">
						<p style="margin: 0;">Inicia sesión</p>
					</a>
					<a href="#" id="register-form-link">
						<p style="margin: 0;">¿No tienes una cuenta? <strong>Regístrate</strong></p>
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
	<script>
		$(function() {
			$('#register-form-link').click(function(e) {
				$(".register-form").delay(100).fadeIn(100);
				$("#login-form-link").delay(100).fadeIn(100);
		 		$(".login-form").fadeOut(100);
		 		$(".password-form").fadeOut(100);
		 		$("#register-form-link").fadeOut(100);
		 		$("#password-form-link").fadeOut(100);
				e.preventDefault();
			});	
		    $('#login-form-link').click(function(e) {
				$(".login-form").delay(100).fadeIn(100);
				$("#register-form-link").delay(100).fadeIn(100);
				$("#password-form-link").delay(100).fadeIn(100);
		 		$(".register-form").fadeOut(100);
		 		$(".password-form").fadeOut(100);
		 		$("#login-form-link").fadeOut(100);
				e.preventDefault();
			});
			$('#password-form-link').click(function(e) {
				$(".password-form").delay(100).fadeIn(100);
				$("#login-form-link").delay(100).fadeIn(100);
		 		$(".register-form").fadeOut(100);
		 		$(".login-form").fadeOut(100);
		 		$("#register-form-link").fadeOut(100);
		 		$("#password-form-link").fadeOut(100);
				e.preventDefault();
			});	
		});
	</script>
</body>
</html>