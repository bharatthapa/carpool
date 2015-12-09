<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login/Sign-In</title>

<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script>
        	$(function(){
        		$(document).on('click','#submit',function (e) {
        			e.preventDefault();
        			console.log($("#signUpForm").serialize());
        			$.ajax({
        				url:"http://localhost:8080/testCarpool/register" ,
        				type: 'POST',
        				dataType : "JSON",
        				//header:"accept: application/json",
        				//contentType : "application/json",
        				data: $("#signUpForm").serialize()
        				
        			}).done(function(data){
        				
        				
        				$("#loginTab").trigger('click');
        				$("#j_username").val($("#username").val());
        				$("#j_password").val($("#password").val());
        			}).fail(function(xhr, status, error){
        				console.log("error "+xhr + status + error);
        			})
        			
        		});
        	})
        	    		
        </script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<script src="<c:url value="/resources/static/js/index.js"/>"></script>


<link rel="stylesheet" href="<c:url value="/resources/static/css/normalize.css"/>">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="<c:url value="/resources/static/css/style.css"/>">

</head>

<body>

	<div class="logmod">
		<div class="logmod__wrapper">
			<span class="logmod__close">Close</span>
			<div class="logmod__container">
				<ul class="logmod__tabs">
					<li data-tabtar="lgm-1"><a href="#">Sign Up</a></li>
					<li data-tabtar="lgm-2" id="loginTab"><a href="#">Login</a></li>
				</ul>
				<div class="logmod__tab-wrapper">
					<div class="logmod__tab lgm-1">
						<div class="logmod__heading">
							<span class="logmod__heading-subtitle">Enter your personal
								details <strong>to create an acount</strong>
							</span>
						</div>
						<div class="logmod__form">
							<form accept-charset="utf-8" id="signUpForm" class="simform">
								<%--  <form:form accept-charset="utf-8" action="register" modelAttribute="user" cssClass="simform">
                                    <form:errors path="*" cssStyle="color : red;"/> --%>
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" for="user-name">Username*</label>
										<input class="string optional" maxlength="255" id="username"
											name="username" placeholder="username" type="text" size="50" />
										<%-- <form:input cssClass="string optional" maxlength="255" path="username"
                                                        placeholder="username" type="text" size="50" /> --%>
										<%-- <form:errors path="username" cssStyle="color : red;"/> --%>
									</div>
								</div>
								<div class="sminputs">
									<div class="input string optional">
										<label class="string optional" for="user-pw">Password
											*</label> <input class="string optional" maxlength="255"
											id="password" name="password" placeholder="Password"
											type="text" size="50" />
										<%-- <form:input cssClass="string optional" maxlength="255" path="password"
                                                            placeholder="Password" type="text" size="50" /> --%>
										<%-- <form:errors path="password" cssStyle="color : red;"/> --%>
									</div>
									<div class="input string optional">
										<label class="string optional" for="user-pw-repeat">Repeat
											password *</label>
										<%-- form:input cssClass="string optional" maxlength="255"
                                                            path="pwdRepeat" placeholder="Repeat password" type="text"
                                                            size="50" /> --%>
										<input class="string optional" maxlength="255" id="pwdRepeat"
											name="pwdRepeat" placeholder="Repeat password" type="text"
											size="50" />
									</div>
								</div>
								<div class="simform__actions">
									<%--  <form:button cssClass="sumbit" type="sumbit"
                                                     > Create Account </form:button> --%>
									<button class="sumbit" id="submit">Create
										Account</button>
									<span class="simform__actions-sidetext">By creating an
										account you agree to our <a class="special" href="#"
										target="_blank" role="link">Terms &amp; Privacy</a>
									</span>
								</div>
							</form>
							<%-- </form:form> --%>
						</div>
						<div class="logmod__alter">
							<div class="logmod__alter-container">
								<a href="#" class="connect facebook">
									<div class="connect__icon">
										<i class="fa fa-facebook"></i>
									</div>
									<div class="connect__context">
										<span>Create an account with <strong>Facebook</strong></span>
									</div>
								</a> <a href="#" class="connect googleplus">
									<div class="connect__icon">
										<i class="fa fa-google-plus"></i>
									</div>
									<div class="connect__context">
										<span>Create an account with <strong>Google+</strong></span>
									</div>
								</a>
							</div>
						</div>
					</div>
					<div class="logmod__tab lgm-2">
						<div class="logmod__heading">
							<span class="logmod__heading-subtitle">Enter your email
								and password <strong>to sign in</strong>
							</span>
						</div>
						<div class="logmod__form">
							<form action="j_spring_security_check" method="post"
								class="simform">
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" id="user-name">Username*</label>
										<input class="string optional" maxlength="255"
											name="j_username" id="j_username" placeholder="Username"
											type="text" size="50" />
									</div>
								</div>
								<div class="sminputs">
									<div class="input full">
										<label class="string optional" id="user-pw">Password *</label>
										<input class="string optional" maxlength="255"
											name="j_password" id="j_password" placeholder="Password"
											type="password" size="50" /> <span class="hide-password">Show</span>
									</div>
								</div>
								<div class="simform__actions">
									<button class="sumbit" name="commit">
										Log In</button>
									<span class="simform__actions-sidetext"><a
										class="special" role="link" href="#">Forgot your password?<br>Click
											here
									</a></span>
								</div>
							</form>
						</div>
						<div class="logmod__alter">
							<div class="logmod__alter-container">
								<a href="#" class="connect facebook">
									<div class="connect__icon">
										<i class="fa fa-facebook"></i>
									</div>
									<div class="connect__context">
										<span>Sign in with <strong>Facebook</strong></span>
									</div>
								</a> <a href="#" class="connect googleplus">
									<div class="connect__icon">
										<i class="fa fa-google-plus"></i>
									</div>
									<div class="connect__context">
										<span>Sign in with <strong>Google+</strong></span>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
