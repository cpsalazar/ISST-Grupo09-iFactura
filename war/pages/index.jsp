<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page isELIgnored="false"%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>iFactura</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="../bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->

		<nav class="navbar navbar-default navbar-static-top" id="navigator"
			role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">iFactura</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">

				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
						<li class="divider"></li>
						<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>
								Subastas en curso</a></li>
						<li><a href="peticiones.jsp"><i
								class="fa fa-bar-chart-o fa-fw"></i> Petición de subastas</a></li>
						<!--<li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li> -->
						<li><a href="historial.jsp"><i class="fa fa-edit fa-fw"></i>
								Historial de subastas</a></li>
						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
								Sample Pages<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<!--<li>
                                    <a href="blank.html">Blank Page</a>
                                </li> -->
								<li><a href="login.jsp">Login Page</a></li>
							</ul> <!-- /.nav-second-level --></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">Subastas en curso</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">Tabla de subastas</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Nº Subasta</th>
											<th>Nº Usuarios</th>
											<th>Finaliza en</th>
											<th>Puja actual</th>
											<th>Ganador actual</th>
											<th>Tu puja</th>

										</tr>
									</thead>
									<tbody>
									<tr class="odd gradeX">
											<td>7</td>
											<td>200</td>
											<td>
												<div id="clockdiv">
													<div>
														<span class="days"></span> <span class="hours"></span> <span
															class="minutes"></span> <span class="seconds"></span>
													</div>
												</div>
											</td>
											<td>10</td>
											<td>Yoigo</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
										<tr class="odd gradeX">
											<td>6</td>
											<td>190</td>
											<td>
												0d : 05h : 13m : 40s
											</td>
											<td>12</td>
											<td>Orange</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
										<tr class="odd gradeX">
											<td>5</td>
											<td>240</td>
											<td>
												0d : 12h : 53m : 20s
											</td>
											<td>14</td>
											<td>Vodafone</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
										<tr class="odd gradeX">
											<td>4</td>
											<td>180</td>
											<td>
												4d : 01h : 32m : 20s
											</td>
											<td>15</td>
											<td>Movistar</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
										<tr class="odd gradeX">
											<td>3</td>
											<td>350</td>
											<td>
												2d : 12h : 43m : 50s
											</td>
											<td>12</td>
											<td>Vodafone</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
										<tr class="odd gradeX">
											<td>2</td>
											<td>450</td>
											<td>
												0d : 07h : 21m : 32s
											</td>
											<td>17</td>
											<td>Movistar</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
										<tr class="even gradeC">
											<td>1</td>
											<td>220</td>
											<td>
												1d : 02h : 43m : 20s
											</td>
											<td>11</td>
											<td>Yoigo</td>
											<td><input type="number" class="form-control"
												placeholder="Introduzca puja"><input type="submit"
												class="btn btn-primary" value="Enviar"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

	<!-- Countdown js -->
	<script src="../dist/js/countdown.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>
