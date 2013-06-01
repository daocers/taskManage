<%@ page import="co.bugu.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="task.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${taskInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="task.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${taskInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="task.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${co.bugu.User.list()}" optionKey="id" required="" value="${taskInstance?.user?.id}" class="many-to-one"/>
</div>

