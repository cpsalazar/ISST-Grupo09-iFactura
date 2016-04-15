<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>iFactura</title>
	<!-- Bootstrap core CSS -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../fonts/css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/animate.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="../css/custom.css" rel="stylesheet">
	<link href="../css/icheck/flat/green.css" rel="stylesheet" />
	<link href="../css/floatexamples.css" rel="stylesheet" type="text/css" />
</head>
<body class="nav-md">
	<c:if test="${user != null}">
	<div class="container body">
		<div class="main_container">
			<%@ include file="menu.jsp" %>
      		<!-- /top navigation -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Formulario de creación de subasta</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<!-- /.row -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<!-- /.panel-heading -->
								<div class="panel-body">
									<form class="form-horizontal" action="/crearSubasta" method="post" id="creacion-subasta">
										<div class="form-group"> 
											<label class="control-label col-md-2 col-md-offset-2">Nº subasta:</label>
											<div class="col-md-6">
												<input name="id" class="form-control numeric" placeholder="Introduzca ID">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2 col-md-offset-2">Nº usuarios:</label>
											<div class="col-md-6">
												<input name="usuarios" class="form-control numeric" placeholder="Introduzca número de usuarios">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2 col-md-offset-2">Fecha de finalización:</label>
											<div class="col-md-6">
												<input name="fecha" class="form-control" placeholder="Introduzca fecha">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-2 col-md-offset-2">Puja inicial:</label>
											<div class="col-md-6">
												<input name="puja_inicial" class="form-control numeric" placeholder="Introduzca la puja inicial">
											</div>
										</div>
										<div class="form-group">
											<div class="col-md-6">
												<input type="submit" class="btn btn-primary btn-form" value="Enviar">	
											</div>
										</div>
									</form>
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-12 -->
					</div>
				</div>
				<!-- /page content -->
				<div id="custom_notifications" class="custom-notifications dsp_none">
					<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
					<div class="clearfix"></div>
					<div id="notif-group" class="tabbed_notifications"></div>
				</div>
			</div>
			<%@ include file="footer.jsp" %>			
		</div>
		<%@ include file="scripts.jsp" %>
	</div>
	</c:if>
	<c:if test="${user == null}">
		<br>
		<p>
			No estas registrado en el sistema, puedes pulsar el siguiente enlace para registrarte
			<a href="<c:url value="${url}"/>"><c:out value="${urlLinktext}" /></a>
		</p>
	</c:if>
</body>
</html>