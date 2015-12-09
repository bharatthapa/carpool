<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="sidebar-wrapper">
				<div class="logo">
					<a href="http://www.creative-tim.com" class="simple-text">
						Welcome <c:out value="${username}" /> !!!
					</a>
				</div>

				<ul class="nav">
					<li  class="active"><a href="dashboard"> <i class="pe-7s-graph"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a href="getTrip"> <i
							class="pe-7s-graph"></i>
							<p>Add Trip</p>
					</a></li>
					<li><a href="myTripsForm"> <i class="pe-7s-user"></i>
							<p>My Trips</p>
					</a></li>
					<li><a href="table.html"> <i class="pe-7s-note2"></i>
							<p>Search Trips</p>
					</a></li>
					<li><a href="typography"> <i class="pe-7s-news-paper"></i>
							<p>Typography</p>
					</a></li>
					<li><a href="icons.html"> <i class="pe-7s-science"></i>
							<p>Icons</p>
					</a></li>
					<li><a href="maps.html"> <i class="pe-7s-map-marker"></i>
							<p>Maps</p>
					</a></li>
					<li><a href="notifications.html"> <i class="pe-7s-bell"></i>
							<p>Notifications</p>
					</a></li>
				</ul>
			</div>