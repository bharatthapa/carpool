<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>My Trips</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").is(':checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
	
	$(function(){
		$(document).on('click','.btn-delete',function () {
			alert($(this).attr("data-id"));
			$(".btn-delete-modal-yes").attr("data-id",$(this).attr("data-id"));
			$("#delete").modal('show');
			
		})
		$(document).on('click','.btn-delete-modal-yes', function(){
			var tripId = $(".btn-delete-modal-yes").attr("data-id");
			$.ajax({
				url : "deleteTrip",
				data : {"tripId" : +tripId},
				type: "post"
			}).done(function(data){
				if (data == "success") {
					var btn = $("button[data-id='"+tripId+"']");
					var trip = btn.parents("tr");
					trip.remove();
					$("#delete").modal('hide');
				}
			}).error(function(xhr, status, error){
				console.log(error);
			})
		})
	})

	//fetch json data
	/* $(function(){
		alert("hello from mytrips ajax");
		$.ajax({
			url : "fetchMyTrips",
			type : "get",
			dataType : "json",
			contentType : "application/json"
		}).done(function(data){
			alert("success in fetching all my trips");
			//document.write(JSON.stringify(data));
			alert("data" + JSON.stringify(data));
		}).fail(function(xhr, status, error){
			alert("error fetching all my trips "+ xhr + status + error);
		})
	}) */
</script>
<script type="text/javascript">
	//Angular Js
	var plotMyTripsApps = angular.module('plotMyTrips', []);

	plotMyTripsApps.controller('plotMyTripsController', [ '$scope', '$http',
			function($scope, $http) {
				/* alert(); */
				$scope.trips = [];
				$http.get('fetchMyTrips').success(function(data, status) {
					$scope.trips = data;
					/* console.log(data);
					console.log(data[0].firstName); */
				})
			} ]);
</script>
<link rel="icon" type="image/png"
	href="<c:url value='/resources/static/img/favicon.ico'/>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>My Trips</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />

<!-- Bootstrap core CSS     -->
<link href="<c:url value='/resources/static/css/bootstrap.min.css'/>"
	rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="<c:url value='/resources/static/css/animate.min.css'/>"
	rel="stylesheet" />

<!--  Light Bootstrap Table core CSS    -->
<link
	href="<c:url value='/resources/static/css/light-bootstrap-dashboard.css'/>"
	rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="<c:url value='/resources/static/css/demo.css'/>"
	rel="stylesheet" />


<!--     Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300'
	rel='stylesheet' type='text/css'>
<link href="<c:url value='/resources/static/css/pe-icon-7-stroke.css'/>"
	rel="stylesheet" />

</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-color="purple"
			data-image="<c:url value='/resources/static/img/sidebar-5.jpg'/>">

			<!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->

			<jsp:include page="sideBar.jsp"/>

		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default navbar-fixed">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#navigation-example-2">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Maps</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-left">
							<li><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-dashboard"></i>
							</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="fa fa-globe"></i> <b
									class="caret"></b> <span class="notification">5</span>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Notification 1</a></li>
									<li><a href="#">Notification 2</a></li>
									<li><a href="#">Notification 3</a></li>
									<li><a href="#">Notification 4</a></li>
									<li><a href="#">Another notification</a></li>
								</ul></li>
							<li><a href=""> <i class="fa fa-search"></i>
							</a></li>
						</ul>

						<ul class="nav navbar-nav navbar-right">
							<li><a href=""> Account </a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> Dropdown <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
								</ul></li>
							<li><a href="#"> Log out </a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div ng-app="plotMyTrips">
				<div  ng-controller="plotMyTripsController">
					<table id="myAngularTable"
						class="table table-bordred table-striped">

						<thead>

							<th><input type="checkbox" id="checkall" /></th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Address</th>
							<th>City</th>
							<th>State</th>
							<th>Zip</th>
							<th>Start Time</th>
							<th>End Time</th>
							<th>Phone</th>
							<th>Email</th>
							<th>Date</th>
							<th>Route</th>
							<th>Edit</th>
							<th>Delete</th>
						</thead>
						<tbody>
							<tr ng-repeat="trip in trips">
								<td><input type="checkbox" class="checkthis" /></td>
								<td>{{trip.firstName}}</td>
								<td>{{trip.lastName}}</td>
								<td>{{trip.address}}</td>
								<td>{{trip.city}}</td>
								<td>{{trip.state}}</td>
								<td>{{trip.zip}}</td>
								<td>{{trip.startTime}}</td>
								<td>{{trip.endTime}}</td>
								<td>{{trip.phoneNumber}}</td>
								<td>{{trip.emailAddress}}</td>
								<td>{{trip.date}}</td>
								<td>{{trip.route}}</td>
								<td></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Edit">
										<button class="btn btn-primary btn-xs btn-edit" data-title="Edit"
											data-toggle="modal" data-target="#edit" data-id="{{trip.id}}">
											<span class="glyphicon glyphicon-pencil"></span>
										</button>
									</p></td>
								<td><p data-placement="top" data-toggle="tooltip"
										title="Delete">
										<button class="btn btn-danger btn-xs btn-delete" data-title="Delete"
											data-id="{{trip.id}}">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</p></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<!-- <div id="map">


				<div class="container">
					<div class="row">


						<div class="col-md-12">
							<h4>List of Trips I've Created</h4>
							<div class="table-responsive">


								<table id="mytable" class="table table-bordred table-striped">

									<thead>

										<th><input type="checkbox" id="checkall" /></th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Address</th>
										<th>City</th>
										<th>State</th>
										<th>Zip</th>
										<th>Start Time</th>
										<th>End Time</th>
										<th>Phone</th>
										<th>Email</th>
										<th>Date</th>
										<th>Route</th>
										<th>Edit</th>
										<th>Delete</th>
									</thead>
									<tbody>

										<tr>
											<td><input type="checkbox" class="checkthis" /></td>
											<td>Mohsin</td>
											<td>Irshad</td>
											<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
											<td>isometric.mohsin@gmail.com</td>
											<td>+923335586757</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Edit">
													<button class="btn btn-primary btn-xs" data-title="Edit"
														data-toggle="modal" data-target="#edit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</p></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Delete">
													<button class="btn btn-danger btn-xs" data-title="Delete"
														data-toggle="modal" data-target="#delete">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</p></td>
										</tr>

										<tr>
											<td><input type="checkbox" class="checkthis" /></td>
											<td>Mohsin</td>
											<td>Irshad</td>
											<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
											<td>isometric.mohsin@gmail.com</td>
											<td>+923335586757</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Edit">
													<button class="btn btn-primary btn-xs" data-title="Edit"
														data-toggle="modal" data-target="#edit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</p></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Delete">
													<button class="btn btn-danger btn-xs" data-title="Delete"
														data-toggle="modal" data-target="#delete">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</p></td>
										</tr>


										<tr>
											<td><input type="checkbox" class="checkthis" /></td>
											<td>Mohsin</td>
											<td>Irshad</td>
											<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
											<td>isometric.mohsin@gmail.com</td>
											<td>+923335586757</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Edit">
													<button class="btn btn-primary btn-xs" data-title="Edit"
														data-toggle="modal" data-target="#edit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</p></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Delete">
													<button class="btn btn-danger btn-xs" data-title="Delete"
														data-toggle="modal" data-target="#delete">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</p></td>
										</tr>



										<tr>
											<td><input type="checkbox" class="checkthis" /></td>
											<td>Mohsin</td>
											<td>Irshad</td>
											<td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
											<td>isometric.mohsin@gmail.com</td>
											<td>+923335586757</td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Edit">
													<button class="btn btn-primary btn-xs" data-title="Edit"
														data-toggle="modal" data-target="#edit">
														<span class="glyphicon glyphicon-pencil"></span>
													</button>
												</p></td>
											<td><p data-placement="top" data-toggle="tooltip"
													title="Delete">
													<button class="btn btn-danger btn-xs" data-title="Delete"
														data-toggle="modal" data-target="#delete">
														<span class="glyphicon glyphicon-trash"></span>
													</button>
												</p></td>
										</tr>
									</tbody>
								</table>

								<div class="clearfix">
								
								
								</div>
								<ul class="pagination pull-right">
									<li class="disabled"><a href="#"><span
											class="glyphicon glyphicon-chevron-left"></span></a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#"><span
											class="glyphicon glyphicon-chevron-right"></span></a></li>
								</ul>

							</div>

						</div>
					</div>
				</div>


			</div> -->

		</div>
	</div>



	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Edit Your
						Detail</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control " type="text" placeholder="Mohsin">
					</div>
					<div class="form-group">

						<input class="form-control " type="text" placeholder="Irshad">
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control"
							placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Update
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>



	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Delete this
						entry</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Are you
						sure you want to delete this Record?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success btn-delete-modal-yes" data-id="">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
</body>

<!--   Core JS Files   -->
<script src="<c:url value='/resources/static/js/jquery-1.10.2.js'/>"
	type="text/javascript"></script>
<script src="<c:url value='/resources/static/js/bootstrap.min.js'/>"
	type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script
	src="<c:url value='/resources/static/js/bootstrap-checkbox-radio-switch.js'/>"></script>

<!--  Charts Plugin -->
<script src="<c:url value='/resources/static/js/chartist.min.js'/>"></script>

<!--  Notifications Plugin    -->
<script src="<c:url value='/resources/static/js/bootstrap-notify.js'/>"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
<script
	src="<c:url value='/resources/static/js/light-bootstrap-dashboard.js'/>"></script>

<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
<script src="<c:url value='/resources/static/js/demo.js'/>"></script>


</html>