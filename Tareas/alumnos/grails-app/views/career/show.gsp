<%@ page import="com.itesm.grails.alumnos.Student"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'career.label', default: 'Carreras')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-career" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-career" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <!--<f:display bean="career" />-->
            <ol class="property-list career"/>
                <li class="fieldcontain">
                    <span id="siglas-label" class="property-label">Siglas:</span>
                    <div class="property-value" aria-labelledby="siglas-label">${career.siglas}</div>
                </li>
                <li class="fieldcontain">
                    <span id="nombre-label" class="property-label">Nombre de la carrera:</span>
                    <div class="property-value" aria-labelledby="nombre-label">${career.nombreCarrera}</div>
                </li>
                <li class="fieldcontain">
                    <span id="programa-label" class="property-label">Programa:</span>
                    <div class="property-value" aria-labelledby="programa-label">${career.programa}</div>
                </li>
                <li class="fieldcontain">
                    <span id="alumnos-label" class="property-label">Alumnos:</span>
                    <div class="property-value" aria-labelledby="alumnos-label">
                        <g:each in="${career.students}" status="i" var="estudiante">
                            <ul>
                                <li>
                                    <g:link controller="student" action="show" id="${estudiante.id}">${estudiante}</g:link>
                                </li>
                            </ul>
                        </g:each>
                    </div>
                </li>
            </ol>
            <g:form resource="${this.career}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.career}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
