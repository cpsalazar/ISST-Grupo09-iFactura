<%@page pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${user == 'ifactura'}">
	<div class="col-md-3 left_col">
		<div class="left_col scroll-view">
			<div class="navbar nav_title" style="border: 0;">
				<a href="/isst_g09_ifactura" class="site_title"><img id="menu_logo" src="../images/logo_white_.png" style="width: 60%;"></a>
			</div>
			<div class="clearfix"></div>
			
			<!-- sidebar menu -->
			<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
				<div class="menu_section">
					<ul class="nav side-menu">
						<li><a href="/isst_g09_ifactura"><i class="fa fa-table"></i>
								Subastas en curso <span class="fa fa-chevron-down"></span></a></li>
						<li><a href="/pages/peticionesRecibidas.jsp"><i
								class="fa fa-edit"></i> Peticiones recibidas <span
								class="fa fa-chevron-down"></span></a></li>
						<li><a href="/pages/historial.jsp"><i class="fa fa-bar-chart-o"></i>
								Historial de subastas <span class="fa fa-chevron-down"></span></a></li>
						<li><a href="/pages/nuevaSubasta.jsp"><i class="fa fa-edit"></i>
								Crear subasta <span class="fa fa-chevron-down"></span></a></li>
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
					<li class="">
						<a href="javascript:;"
						class="user-profile dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false">
								<img src="../images/logo_ifactura.png" alt="" style="  margin-top: -5px; margin-right: 0;">
								<span id="logo_root"><c:out value="${user}" /></span>
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
						</ul>
					</li>
					<li role="presentation" class="dropdown">
						<a href="javascript:;"
						class="dropdown-toggle info-number" data-toggle="dropdown"
						aria-expanded="false">
							<i class="fa fa-envelope-o"></i><span class="badge bg-green"><c:out value="${fn:length(notificaciones)}"/></span>
						</a>
						<ul id="menu1"
							class="dropdown-menu list-unstyled msg_list animated fadeInDown"
							role="menu">
							<c:forEach items="${notificaciones}" var="noti">
								<li><a> <span class="image"> 
											<img src="../images/logo_vodafone.png" alt="">
										</span> 
										<span> 
											<span><c:out value="${user}" /></span>
										</span> 
										<span class="message"><c:out value="${noti.texto}" /></span>
								</a></li>
							</c:forEach>
							<li>
								<div class="text-center">
									<a href="inbox.jsp"> <strong>Ver notificaciones</strong> <i
										class="fa fa-angle-right"></i>
									</a>
								</div>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</c:if>
<c:if test="${user != 'ifactura'}">
	<br>
	<meta http-equiv="refresh" content="0; url=/isst_g09_ifactura" />
</c:if>