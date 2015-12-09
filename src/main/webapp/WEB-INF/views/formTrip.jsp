<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!--   Core JS Files   -->
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

<script type="text/javascript">
	$(function() {
		$("#btnSubmit").on("click", processAddTripForm);
		function processAddTripForm(e) {

			e.preventDefault();
			alert("you clicked add");

			$.ajax({
				url : "addTrip",
				type : "POST",
				//dataType : "text/plain",
				//header : "accept: text/plain",
				contentType : "application/json",
				data : JSON.stringify($("#addTripForm").serializeObject())
			}).done(function(data) {
				alert("Success Ajax" + data);
				
				//clear form 
				$('#addTripForm').trigger("reset");
				
				$("#statusMessage").empty();
				//show success message
				$("#statusMessage").append($("<div>")
													.addClass("alert alert-success successMessageAlert")
													.append($("<strong>").html(data))
													);

			}).fail(function(xhr, status, error) {
				
				$("#statusMessage").empty();
				//show error message
				$("#statusMessage").append($("<div>")
													.addClass("alert alert-danger successMessageAlert")
													.append($("<strong>").html("Error in ajax " + xhr + status + error))
													);
			})
		}

		//Making Form Data a JSON Object
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name] !== undefined) {
					if (!o[this.name].push) {
						o[this.name] = [ o[this.name] ];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
	})
</script>
<link rel="icon" type="image/png"
	href="<c:url value='/resources/static/img/favicon.ico'/>" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Add Trip</title>

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

<style type="text/css">
body {
	padding-top: 20px;
	padding-bottom: 20px;
}

/* Everything but the jumbotron gets side spacing for mobile first views */
.header, .marketing, .footer {
	padding-right: 15px;
	padding-left: 15px;
}

/* Custom page header */
.header {
	border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
	padding-bottom: 19px;
	margin-top: 0;
	margin-bottom: 0;
	line-height: 40px;
}

/* Custom page footer */
.footer {
	padding-top: 19px;
	color: #777;
	border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media ( min-width : 768px) {
	.container {
		max-width: 730px;
	}
}

.container-narrow>hr {
	margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
	text-align: center;
	border-bottom: 1px solid #e5e5e5;
}

.jumbotron .btn {
	padding: 14px 24px;
	font-size: 21px;
}

/* Supporting marketing content */
.marketing {
	margin: 40px 0;
}

.marketing p+h4 {
	margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
	/* Remove the padding we set earlier */
	.header, .marketing, .footer {
		padding-right: 0;
		padding-left: 0;
	}
	/* Space out the masthead */
	.header {
		margin-bottom: 30px;
	}
	/* Remove the bottom border on the jumbotron for visual effect */
	.jumbotron {
		border-bottom: 0;
	}
	.well, #divColor, .container {
		background-color: #ccc;
	}
}
</style>

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
						<a class="navbar-brand" href="#">Icons</a>
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

			<div id="statusMessage"></div>

			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card">

								<!-- Adding Trips Div -->
								<div class="container">
									<h1 id="titleH1" class="well">Add Trip</h1>
									<div class="col-lg-12 well" id="divColor">
										<div class="row">
											<form id="addTripForm">
												<div class="col-sm-12">
													<div class="row">
														<div class="col-sm-6 form-group">
															<label style="color: black;">First Name</label> <input
																type="text" placeholder="Enter First Name Here.."
																name="firstName" class="form-control">
														</div>
														<div class="col-sm-6 form-group">
															<label style="color: black;">Last Name</label> <input
																type="text" placeholder="Enter Last Name Here.."
																name="lastName" class="form-control">
														</div>
													</div>
													<div class="form-group">
														<label style="color: black;">Address</label>
														<textarea placeholder="Enter Address Here.." rows="3"
															name="address" class="form-control"></textarea>
													</div>
													<div class="row">
														<div class="col-sm-4 form-group">
															<label style="color: black;">City</label> <input
																type="text" name="city"
																placeholder="Enter City Name Here.."
																class="form-control">
														</div>
														<div class="col-sm-4 form-group">
															<label style="color: black;">State</label> <input
																type="text" name="state"
																placeholder="Enter State Name Here.."
																class="form-control">
														</div>
														<div class="col-sm-4 form-group">
															<label style="color: black;">Zip</label> <input
																type="text" name="zip"
																placeholder="Enter Zip Code Here.." class="form-control">
														</div>
													</div>
													<div class="row">
														<div class="col-sm-6 form-group">
															<label style="color: black;">Start Time</label> <input
																type="text" name="startTime"
																placeholder="Enter Start Date Here.."
																class="form-control">
														</div>
														<div class="col-sm-6 form-group">
															<label style="color: black;">End Time</label> <input
																type="text" name="endTime"
																placeholder="Enter End Time Here.." class="form-control">
														</div>
													</div>
													<div class="form-group">
														<label style="color: black;">Phone Number</label> <input
															type="text" name="phoneNumber"
															placeholder="Enter Phone Number Here.."
															class="form-control">
													</div>
													<div class="form-group">
														<label style="color: black;">Email Address</label> <input
															type="text" name="emailAddress"
															placeholder="Enter Email Address Here.."
															class="form-control">
													</div>
													<div class="form-group">
														<label style="color: black;">Date</label> <input
															type="text" name="date" placeholder="Enter Date Here.."
															class="form-control">
													</div>
													<div class="form-group">
														<label style="color: black;">Route</label>
														<textarea placeholder="Enter Route Here.." rows="3"
															name="route" class="form-control"></textarea>
													</div>
													<button id="btnSubmit" class="btn btn-primary btn-lg"
														style="color: black;">Add</button>
												</div>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>




</html>