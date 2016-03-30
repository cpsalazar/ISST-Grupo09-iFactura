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

  <!-- Custom styling plus plugins -->
  <link href="../css/custom.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="../css/maps/jquery-jvectormap-2.0.3.css" />
  <link href="../css/icheck/flat/green.css" rel="stylesheet" />
  <link href="../css/floatexamples.css" rel="stylesheet" type="text/css" />

  <script src="../js/jquery.min.js"></script>
  <script src="../js/nprogress.js"></script>

  <!--[if lt IE 9]>
        <script src="../assets/js/ie8-responsive-file-warning.js"></script>
        <![endif]-->

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>

<body class="nav-md">

  <div class="container body">


    <div class="main_container">

      <%@ include file="menu.jsp" %>
      <!-- /top navigation -->


      <div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>
                    Formulario de petición de subasta
                </h3>
            </div>
          </div>
          <div class="clearfix"></div>
        
<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<form class="form-horizontal" style="margin-top: 20px;">
								<div class="form-group">
									<label class="control-label col-md-2 col-md-offset-2">Franja
										horaria:</label>
									<div class="col-md-6">
										<select class="form-control">
											<option>Mañana</option>
											<option>Tarde</option>
											<option>Noche</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-md-offset-2">Tarifa
										actual (€/mes):</label>
									<div class="col-md-3">
										<input type="number" class="form-control" placeholder="Mínimo">
									</div>
									<div class="col-md-3">
										<input type="number" class="form-control" placeholder="Máximo">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-md-offset-2">
										Llamadas (min):</label>
									<div class="col-md-3">
										<input type="number" class="form-control" placeholder="Mínimo">
									</div>
									<div class="col-md-3">
										<input type="number" class="form-control" placeholder="Máximo">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-md-offset-2">Datos
										(GB):</label>
									<div class="col-md-3">
										<input type="number" class="form-control" placeholder="Mínimo">
									</div>
									<div class="col-md-3">
										<input type="number" class="form-control" placeholder="Máximo">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-2 col-md-offset-2">4G:</label>
									<div class="col-md-1">
										<label class="radio-inline"> <input type="radio"
											name="genderRadios" value="male"> Sí
										</label>
									</div>
									<div class="col-md-1">
										<label class="radio-inline"> <input type="radio"
											name="genderRadios" value="female"> No
										</label>
									</div>
									<div class="col-md-1">
										<label class="radio-inline"> <input type="radio"
											name="genderRadios" value="female"> Indiferente
										</label>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-offset-4 col-md-1">
										<input type="submit" class="btn btn-primary" value="Enviar">
									</div>
									<div class="col-md-5">
										<label class="checkbox-inline"> <input type="checkbox"
											value="agree"> Acepto <a href="#">Terminos y
												condiciones</a>.
										</label>
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
        <!-- footer content -->

        <%@ include file="footer.jsp" %>
        <!-- /footer content -->
      </div>
      <!-- /page content -->

  <div id="custom_notifications" class="custom-notifications dsp_none">
    <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
    </ul>
    <div class="clearfix"></div>
    <div id="notif-group" class="tabbed_notifications"></div>
  </div>

 <%@ include file="scripts.jsp" %>
</body>

</html>
