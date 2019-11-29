<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
	
	<div class="row mt-3">
		<p class="h4">Welcome <span class="font-weight-bold">${username}!</span></p>		
	</div>
	<div class="row my-5">
		<p>Start by managing your <a href="/list-todos"><span class="font-weight-bold">Todos</span></a></p>
	</div>	
	
	<div class="row mt-5">
		<div class="col-lg-9">
			<p class="h3 mt-5">Todo application, <small>implemented with:</small></p>
			
			<div class="images">
				<a href="https://www.oracle.com/java/technologies/java-ee-glance.html"><img src="/resources/img/java-J2EE.png" alt="java-J2EE" height="133" width="145"/></a>
				<a href="https://www.spring.io"><img src="/resources/img/spring-framework.png" alt="spring-framework" height="85" width="105"/></a>
				<a href="https://www.maven.apache.org/"><img src="/resources/img/maven.png" alt="maven" height="27" width="133"/></a>
				<img src="/resources/img/sql.png" alt="sql" height="64" width="135"/>
				<a href="http://www.hibernate.org/"><img src="/resources/img/hql.png" alt="hql" height="64" width="135"/></a>
				<img src="/resources/img/HTML-5.png" alt="html5" height="85" width="107"/>
				<img src="/resources/img/CSS-3.png" alt="css3" height="85" width="75"/>
				<a href="https://www.getbootstrap.com/"><img src="/resources/img/bootstrap.png" alt="bootstrap" height="85" width="124"/></a>
				<img src="/resources/img/xml.png" alt="xml" height="94" width="94"/>
			</div>
			
		</div>
	
		<div class="col-lg-3">	
			<p class="lead">Added features:</p>
			<ul class="h6">
				<li><p>Spring Security:</p> 
					<p>- login/logout, remember me,</p>
					<p>- Admin/User/Manager roles throughout all mappings,</p>
					<p>- Custom configuration</p>
				</li>
				<li>
					<p>Spring boot MVC pattern:</p>
					<p>- Architecture and implementation follows MVC standards</p>
				</li>
				<li>
					<p>Server-side validations:</p>
					<p>- Bean Validation API (Hybernate Validator reference implementation)</p>
				</li>
				<li>
					<p>Exception Handling</p>
				</li>
			</ul>
		</div>
	</div>
</div>
	
	
<%@ include file="common/footer.jspf" %>