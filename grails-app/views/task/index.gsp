
<%@ page import="co.bugu.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    <g:javascript>
        function changeTask(id){
            if(id == null || id.equals("")) {  //add
                $("#table2").hide() ;
                $("#table1").show();
               } else{
                $("#table2").show();
                $("#table1").hide();



            }

        }

        function showList(e){
            var taskList = eval("(" + e.responseText + ")")
            if(taskList.size() > 0) {

            for(var i in taskList){
                var task = taskList[i] ;
                if(i % 2 == 0 ){
                var sty = "even"
                }  else{
                var sty = "odd"
                }

               "<tr class=sty>  "+

        %{--"<td><g:link action="show" id="${task.id}">${tasl.content}</g:link></td> "+--}%

        "<td><g:formatDate date="${task.date}" /></td>"+

        "<td>${task.user}</td> " +
        "<td><g:remoteLink action="ajaxDelete" id="${task.id}" onSuccess="showSuccessMessage(e)">Delete Task</g:remoteLink></td>" +

        "<td><button onclick="changeTask(${task.id})" >Change</button> </td>"+

        "</tr>".appendTo("#tbody")


            }

           }

        }


        function showSuccessMessage(e){
            var message = eval("(" + e.responseText+ ")")

            $("#message").innerHTML = message


        }


    </g:javascript>
</head>
<body>
<a href="#list-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
</div>
<div id="list-task" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <div id="message"></div>

    <g:remoteLink action="listAsJson" update="success" onSuccess="showList(e)">Show List</g:remoteLink>

    <table>
        <thead>
        <tr>

            <g:sortableColumn property="content" title="${message(code: 'task.content.label', default: 'Content')}" />

            <g:sortableColumn property="date" title="${message(code: 'task.date.label', default: 'Date')}" />

            <th><g:message code="task.user.label" default="User" /></th>

            <th></th>
            <th></th>

        </tr>
        </thead>
        <tbody id="tbody">
        <g:each in="${taskInstanceList}" status="i" var="taskInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "content")}</g:link></td>

                <td><g:formatDate date="${taskInstance.date}" /></td>

                <td>${fieldValue(bean: taskInstance, field: "user")}</td>

                <td><g:remoteLink action="ajaxDelete" id="${taskInstance.id}">Delete Task</g:remoteLink></td>

                <td><button onclick="changeTask(${taskInstance.id})"></button> </td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <table id="table1">
        <thead>
        <tr>

            <g:sortableColumn property="content" title="${message(code: 'task.content.label', default: 'Content')}" />

            <g:sortableColumn property="date" title="${message(code: 'task.date.label', default: 'Date')}" />

            <th><g:message code="task.user.label" default="User" /></th>
            <th></th>

        </tr>
        </thead>

        <tbody>

            <tr>

                <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "content")}</g:link></td>

                <td><g:formatDate date="${taskInstance.date}" /></td>

                <td>${fieldValue(bean: taskInstance, field: "user")}</td>

                <td><g:remoteLink action="ajaxSave" >Add Task</g:remoteLink></td>

            </tr>

        </tbody>



    </table>

    <table id="table2">
        <thead>
        <tr>

            <g:sortableColumn property="content" title="${message(code: 'task.content.label', default: 'Content')}" />

            <g:sortableColumn property="date" title="${message(code: 'task.date.label', default: 'Date')}" />

            <th><g:message code="task.user.label" default="User" /></th>
            <th></th>

        </tr>
        </thead>

        <tbody>

        <tr>

            <td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "content")}</g:link></td>

            <td><g:formatDate date="${taskInstance.date}" /></td>

            <td>${fieldValue(bean: taskInstance, field: "user")}</td>

            <td><g:remoteLink action="ajaxChange" id="${taskInstance.id}">Delete Task</g:remoteLink></td>


        </tr>

        </tbody>



    </table>
    <div class="pagination">
        <g:paginate total="${taskInstanceTotal}" />
    </div>
</div>
</body>
</html>
