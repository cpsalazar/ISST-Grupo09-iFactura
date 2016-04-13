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
							<h3>Tabla de subastas</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<!-- /.panel-heading -->
									<div class="panel-body">
										<table id="example" class="table table-striped responsive-utilities jambo_table">
											<thead>
												<tr class="headings">
													<th><input type="checkbox" class="tableflat"></th>
													<th>Nº Subasta</th>
													<th>Nº Usuarios</th>
													<th>Finaliza en</th>
													<th>Puja actual</th>
													<th>Ganador actual</th>
													<th>Tu puja</th>
												</tr>
											</thead>
											<tbody>
												<tr class="odd pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">12</td>
													<td class=" ">2000</td>
													<td class=" "> 1d : 03h : 39m : 05s</td>
													<td class=" ">16</td>
													<td class=" ">Movistar</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="even pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">11</td>
													<td class=" ">4600</td>
													<td class=" "> 0d : 05h : 13m : 40s</td>
													<td class=" ">9</td>
													<td class=" ">Yoigo</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="odd pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">10</td>
													<td class=" ">3900</td>
													<td class=" "> 1d : 03h : 39m : 05s</td>
													<td class=" ">11</td>
													<td class=" ">Yoigo</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="even pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">9</td>
													<td class=" ">5000</td>
													<td class=" "> 0d : 05h : 13m : 40s</td>
													<td class=" ">14</td>
													<td class=" ">Vodafone</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="odd pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">8</td>
													<td class=" ">2100</td>
													<td class=" "> 1d : 03h : 39m : 05s</td>
													<td class=" ">12</td>
													<td class=" ">Orange</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="even pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">7</td>
													<td class=" ">2000</td>
													<td class=" "> 0d : 05h : 13m : 40s</td>
													<td class=" ">10</td>
													<td class=" ">Yoigo</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="odd pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">6</td>
													<td class=" ">1900</td>
													<td class=" "> 1d : 03h : 39m : 05s</td>
													<td class=" ">12</td>
													<td class=" ">Orange</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="even pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">5</td>
													<td class=" ">2400</td>
													<td class=" "> 4d : 01h : 32m : 20s</td>
													<td class=" ">15</td>
													<td class=" ">Movistar</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="odd pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">4</td>
													<td class=" ">1800</td>
													<td class=" "> 0d : 12h : 53m : 20s</td>
													<td class=" ">14</td>
													<td class=" ">Vodafone</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="even pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">3</td>
													<td class=" ">3500</td>
													<td class=" "> 2d : 22h : 33m : 10s</td>
													<td class=" ">12</td>
													<td class=" ">Vodafone</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="odd pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">2</td>
													<td class=" ">4500</td>
													<td class=" "> 0d : 07h : 21m : 32s</td>
													<td class=" ">17</td>
													<td class=" ">Movistar</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
												<tr class="even pointer">
													<td class="a-center "><input type="checkbox" class="tableflat"></td>
													<td class=" ">1</td>
													<td class=" ">2200</td>
													<td class=" "> 1d : 02h : 43m : 20s</td>
													<td class=" ">11</td>
													<td class=" ">Yoigo</td>
													<td class="a-right a-right ">
														<div class="div-form">
															<input type="number" class="form-control numeric" placeholder="Introduzca puja">
															<input type="submit" class="btn btn-primary btn-form" value="Enviar">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="footer.jsp" %>
		</div>
		<!-- /page content -->
		<div id="custom_notifications" class="custom-notifications dsp_none">
			<ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group"></ul>
			<div class="clearfix"></div>
			<div id="notif-group" class="tabbed_notifications"></div>
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