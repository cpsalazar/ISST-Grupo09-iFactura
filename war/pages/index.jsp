<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<%@ include file="menu.jsp"%>
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
											<table id="example"
												class="table table-striped responsive-utilities jambo_table">
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
													<c:set var="cuenta" value="0" />
													<c:forEach items="${subastas}" var="subasta" varStatus="loop">
														<c:if test="${subasta.fechaFin lt miliActual}">
															<form action="/postPuja" method="post"
																onsubmit="return getPuja${subasta.id}();">
																<input type="hidden" id="fechaFin${subasta.id}"
																	value="0" />
															</form>
														</c:if>
														<c:if test="${subasta.fechaFin gt miliActual}">
															<tr>
																<form action="/postPuja" method="post" onsubmit="return getPuja${subasta.id}();">
																	<td class="a-center "><input type="checkbox" class="tableflat"></td>
																	<td class=" "><c:out value="${subasta.id}" /></td>
																	<td class=" "><c:out value="${subasta.numUsuarios}" /></td>
																	<td class=" " id="clock${subasta.id}"><span
																		class="days${subasta.id}"></span> <span
																		class="hours${subasta.id}"></span> <span
																		class="minutes${subasta.id}"></span> <span
																		class="seconds${subasta.id}"></span>
																	</td>
																	<td id="rlpuja${subasta.id}">
																		<span id="rlpuja${subasta.id}_"><c:out value="${subasta.pujaActual}" />€</span>
																	</td>
																	<td id="rlpujador${subasta.id}">
																		<span id="rlpujador${subasta.id}_">
																			<c:if test="${user == subasta.ganadorActual}">
																				<c:out value="${subasta.ganadorActual}" />
																			</c:if>
																			<c:if test="${user != subasta.ganadorActual}">
																				-
																			</c:if>
																		</span>
																	</td>
																	<input type="hidden" id="fechaFin${subasta.id}"
																		value="${subasta.fechaFin}" />
																	<td class="a-right a-right ">
																		<div class="div-form">
																			<input type="hidden" name="id" value="${subasta.id}">
																			<input type="number" id="puja_${subasta.id}"
																				step="0.25" name="puja" class="form-control numeric"
																				placeholder="Introduzca puja" required> <input
																				type="submit" id="pujar"
																				class="btn btn-primary btn-form" value="Pujar">
																			<script>
																				function getPuja${subasta.id}() {
																					var puja = document.getElementById("puja_${subasta.id}").value;
																					return confirm('¿Seguro que desea pujar ' + puja + '€?');
																				}
																			</script>
																		</div>
																	</td>
																</form>
															</tr>
														</c:if>
														<c:if test="${cuenta < loop.index}">
															<c:set var="cuenta" value="${loop.index}" />
														</c:if>
													</c:forEach>
													<span id="num_subastas" style="display: none;"><c:out value="${cuenta + 1}" /></span>
												</tbody>
											</table>
										</div>
									</div>
									<c:if test="${alerta == 'Vas ganando la subasta'}">
										<div class="alert alert-success fade in" style="font-size: 14px;">
											<a class="close" href="#" data-dismiss="alert">x</a>
											<strong>Puja satisfactoria: </strong><c:out value="${alerta}" />
										</div>
									</c:if>
									<c:if test="${alerta != null && alerta != 'Vas ganando la subasta'}">
										<div class="alert alert-danger fade in" style="color: white; font-size: 14px;">
											<a class="close" href="#" data-dismiss="alert">x</a>
											<strong>Error: </strong><c:out value="${alerta}" />
										</div>
									</c:if>
									<p id="clock"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="footer.jsp"%>
			</div>
			<!-- /page content -->
			<div id="custom_notifications" class="custom-notifications dsp_none">
				<ul class="list-unstyled notifications clearfix"
					data-tabbed_notifications="notif-group"></ul>
				<div class="clearfix"></div>
				<div id="notif-group" class="tabbed_notifications"></div>
			</div>
			<%@ include file="scripts.jsp"%>
		</div>
	</c:if>
	<c:if test="${user == null}">
		<br>
		<div class="container">
			<p class="denied-top col-xs-12">Acceso denegado</p>
			<p class="denied col-xs-12">No has iniciado sesión en el sistema, pulsa el siguiente enlace para registrarte</p>
			<p><a class="denied-a col-xs-12" href="<c:url value="/isst_g09_ifactura"/>"><c:out value="Iniciar sesión" /></a></p>
		</div>
	</c:if>
</body>
</html>