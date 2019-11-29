<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<div class="container">
	<form:form method="post" modelAttribute="todo"><!-- "todo" is the name of the bean (bind to the bean) -->
		<fieldset class="form-group">
			<form:hidden path="id"/> <!-- todo's id -->
			<!-- path="desc" -> bind with "desc" field from todo bean! -->
			<!-- path ~= name in HTML -->
			<form:label path="desc">Description</form:label>
			<form:input path="desc" class="form-control" type="text" required="required"/>
			<form:errors path="desc" cssClass="text-warning" />
		</fieldset>
		<fieldset class="form-group">
			<form:hidden path="id"/>
			<form:label path="targetDate">Target Date</form:label>
			<form:input path="targetDate" class="form-control" type="text" required="required"/>
			<form:errors path="targetDate" cssClass="text-warning" />
		</fieldset>
		<button class="btn btn-success" type="submit">Add</button>
	</form:form>
</div>

<%@ include file="common/footer.jspf" %>