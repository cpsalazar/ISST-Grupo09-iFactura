<%@page pageEncoding="utf8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="col-md-3 left_col">
	<div class="left_col scroll-view">
		<div class="navbar nav_title" style="border: 0;">
			<a href="index.jsp" class="site_title"><i class="fa fa-paw"></i>
				<span>iFactura</span></a>
		</div>
		<div class="clearfix"></div>
		<!-- menu prile quick info -->
		<div class="profile">
			<div class="profile_pic">
				<img src="../images/img.jpg" alt="..."
					class="img-circle profile_img">
			</div>
		</div>
		<br />
		<!-- sidebar menu -->
		<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
			<div class="menu_section">
				<ul class="nav side-menu">
					<li><c:if test="${user != null}">
							<c:out value="${user}" />
							<p>Bienvenido.</p>
						</c:if> <c:if test="${user == null}">
							<p>Ningún usuario registrado</p>
						</c:if>
					</li>
					<li><a href="/pages/index.jsp"><i class="fa fa-table"></i>
							Subastas en curso <span class="fa fa-chevron-down"></span></a></li>
					<li><a href="/pages/peticiones.jsp"><i class="fa fa-edit"></i>
							Petición de subastas <span class="fa fa-chevron-down"></span></a></li>
					<li><a href="/pages/historial.jsp"><i class="fa fa-bar-chart-o"></i>
							Historial de subastas <span class="fa fa-chevron-down"></span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- top navigation -->
<div class="top_nav">
	<div class="nav_menu">
		<nav class="" role="navigation">
			<div class="nav toggle">
				<a id="menu_toggle"><i class="fa fa-bars"></i></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class=""><a href="javascript:;"
					class="user-profile dropdown-toggle" data-toggle="dropdown"
					aria-expanded="false"> <img src="../images/img.jpg" alt="">
					<c:if test="${user != null}">
							<c:out value="${user}" />
					</c:if>
					<c:if test="${user == null}">
							<p>Ningún usuario registrado</p>
					</c:if>
					<span class=" fa fa-angle-down"></span>
				</a>
					<ul
						class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
						<li><a href="javascript:;">Perfil</a></li>
						<li><a href="javascript:;"><span>Ajustes</span></a></li>
						<li><a href="javascript:;">Ayuda</a></li>
						<li><a href="<c:url value="${url}"/>">
							<i class="fa fa-sign-out pull-right"></i>
							<c:out value="${urlLinktext}" /></a> 
						</li>
					</ul></li>
				<li role="presentation" class="dropdown"><a href="javascript:;"
					class="dropdown-toggle info-number" data-toggle="dropdown"
					aria-expanded="false"> <i class="fa fa-envelope-o"></i> <span
						class="badge bg-green">2</span>
				</a>
					<ul id="menu1"
						class="dropdown-menu list-unstyled msg_list animated fadeInDown"
						role="menu">
						<li><a> <span class="image"><img
									src="../images/img.jpg" alt="Profile Image" /></span> <span> <span>Andrés
										Menéndez</span> <span class="time">Hace 3 minutos</span>
							</span> <span class="message">Film festivals used to be do-or-die
									moments for movie makers. They were where...</span>
						</a></li>
						<li><a> <span class="image"><img
									src="../images/img.jpg" alt="Profile Image" /></span> <span> <span>Andrés
										Menéndez</span> <span class="time">Hace 8 minutos</span>
							</span> <span class="message">Film festivals used to be do-or-die
									moments for movie makers. They were where...</span>
						</a></li>
						<li>
							<div class="text-center">
								<a href="inbox.html"> <strong>Ver notificaciones</strong> <i
									class="fa fa-angle-right"></i>
								</a>
							</div>
						</li>
					</ul></li>
			</ul>
		</nav>
	</div>
</div>