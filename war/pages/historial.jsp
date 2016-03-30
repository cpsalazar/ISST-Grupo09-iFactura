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
                    Historial de subastas
                </h3>
            </div>
          </div>
          <div class="clearfix"></div>
       
            </div>
<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Nº Subasta</th>
											<th>Fecha de finalización</th>
											<th>Puja ganadora</th>
											<th>Compañía ganadora</th>
											<th>Nº Clientes</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td>6</td>
											<td>2016/03/21</td>
											<td>15€</td>
											<td>Vodafone</td>
											<td>200</td>
										</tr>
										<tr class="even gradeC">
											<td>5</td>
											<td>2016/04/13</td>
											<td>16€</td>
											<td>Movistar</td>
											<td>250</td>
										</tr>
										<tr class="odd gradeA">
											<td>4</td>
											<td>2016/05/21</td>
											<td>10€</td>
											<td>Yoigo</td>
											<td>100</td>
										</tr>
										<tr class="even gradeA">
											<td>3</td>
											<td>2016/06/04</td>
											<td>12€</td>
											<td>Orange</td>
											<td>170</td>
										</tr>
										<tr class="odd gradeA">
											<td>2</td>
											<td>2016/03/06</td>
											<td>10€</td>
											<td>Orange</td>
											<td>205</td>
										</tr>
										<tr class="even gradeA">
											<td>1</td>
											<td>2016/03/12</td>
											<td>14€</td>
											<td>Movistar</td>
											<td>255</td>
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
