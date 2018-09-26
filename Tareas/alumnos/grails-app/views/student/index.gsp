<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'student.label', default: 'Alumno')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-student" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-student" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:form action="index" method="GET">
               <div class="fieldcontain">
                    <span id="query" class="property-label">Busqueda: </span>
                    <g:textField name="query" for="query" value="${params.query}" placeholder="Busqueda"/>
                    <button type="submit">Buscar</button>
                </div>
                
            </g:form>
            <f:table collection="${studentList}" />

            <div class="pagination">
                <g:paginate total="${studentCount ?: 0}" />
            </div>
        </div>
    </body>
</html>