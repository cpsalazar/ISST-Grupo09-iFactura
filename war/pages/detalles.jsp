<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>iFactura</title>

<!-- Bootstrap Core CSS -->
<link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="../bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">iFactura</a>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<!-- /.dropdown -->
			<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="fa fa-user fa-fw"></i>
					<i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li><a href="#"><i class="fa fa-user fa-fw"></i>Perfil</a></li>
					<li><a href="#"><i class="fa fa-gear fa-fw"></i>Ajustes</a></li>
					<li class="divider"></li>
					<li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i>Logout</a></li>
				</ul> <!-- /.dropdown-user --></li>
			<!-- /.dropdown -->
		</ul>
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							Año 2016<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="detalles.jsp">Luz</a></li>
							<li><a href="index.jsp">Agua</a></li>
							<li><a href="index.jsp">Teléfono</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							Año 2015<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="index.jsp">Luz</a></li>
							<li><a href="index.jsp">Agua</a></li>
							<li><a href="index.jsp">Teléfono</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							Año 2014<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="index.jsp">Luz</a></li>
							<li><a href="index.jsp">Agua</a></li>
							<li><a href="index.jsp">Teléfono</a></li>
						</ul> <!-- /.nav-second-level --></li>
					<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>
							Año 2013<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="index.jsp">Luz</a></li>
							<li><a href="index.jsp">Agua</a></li>
							<li><a href="index.jsp">Teléfono</a></li>
						</ul> <!-- /.nav-second-level --></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		</nav>
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1>Facturas de Usuario</h1>

						<table class="table" id="dataTables-example">
							<tbody>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
								<tr>
									<td>Factura</td>
									<td>Factura</td>
									<td>Factura</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
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

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
	<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>
</html>