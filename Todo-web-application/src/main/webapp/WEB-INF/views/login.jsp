<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Log in</title>
    
    <link href="webjars/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    
</head>
<body>
<div class="container">
    <div style="width:600px;margin-left: auto;margin-right: auto;margin-top:24px;padding: 24px;">
        <div class="card">
            <div class="card-header" style="background-color:#98bbdb;">
                <i class="fa fa-user"></i> Please Login
            </div>
            <div class="card-block" style="padding: 24px;">
                <form name="f" action="/login" method="post">
                    <fieldset>
                        <!-- c: + Spring Security error display -->
                        <c:if test="${param.error != null}">
	                        <div class="alert alert-danger">
	                            Invalid username or password.
	                        </div>
	                        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			                  Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
			                </c:if>
                        </c:if>
						
						<c:if test="${param.logout != null}">
	                        <div class="alert alert-success">
	                            You have been logged out.
	                        </div>
	                    </c:if>

                        <!-- Login Controls -->
                        <div class="form-group">
                            <label for="username">Username</label>
                            <!-- username keyword must be exactly like that, to be recognized from Spring Security (same for password & remember-me) -->
                            <input type="text" class="form-control" id="username" name="username" 
                                   placeholder="Username: 'admin' or 'user'">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Password: 'pass'">
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
                            <label class="form-check-label" for="remember-me">Remember me?</label>
                        </div>

                        <!-- Login Button -->
                        <div class="form-actions" style="margin-top: 12px;">
                            <button type="submit" class="btn btn-success">Log in</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>