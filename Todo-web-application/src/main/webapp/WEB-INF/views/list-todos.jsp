<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
	<table class="table table-striped mt-3">
		<header class="h3 mt-5">Your todos are</header>
		<thead>
			<tr>
				<th>Description</th>
				<th>Target date</th>
				<th>Is it done?</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${todos}" var="todo">
				<tr>
					<td>${todo.desc}</td>
					<td><fmt:formatDate value="${todo.targetDate}" pattern="dd/MM/yyyy"/></td>
					<td>${todo.done}</td> <!-- (not todo.isDone) because of Java Bean Conventions (https://docstore.mik.ua/orelly/java-ent/jnut/ch06_02.htm) -->
					<td><a class="btn btn-outline-primary" type="button" href="/update-todo?id=${todo.id}">Update</a></td>
					<td><a class="btn btn-outline-danger" type="button" href="/delete-todo?id=${todo.id}">Delete</a></td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	
	<div>
		<a class="btn btn-success" type="button" href="/add-todo">Add a todo</a>
	</div>
	
</div>

<%@ include file="common/footer.jspf" %>